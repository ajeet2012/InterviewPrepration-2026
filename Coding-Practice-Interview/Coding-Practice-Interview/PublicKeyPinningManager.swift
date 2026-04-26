//
//  PublicKeyPinningManager.swift
//  Coding-Practice-Interview
//
//  Created by Ajeet Sharma on 26/04/26.
//

import Foundation
import Security

class PublicKeyPinningManager: NSObject, URLSessionDelegate {
    
    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        // 1. Ensure it's server trust
        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
              let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // 2. Get server certificate
        guard let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // 3. Extract server public key
        guard let serverPublicKey = extractPublicKey(from: serverCertificate) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // 4. Load local certificate
        guard let localCertPath = Bundle.main.path(forResource: "server", ofType: "cer"),
              let localCertData = try? Data(contentsOf: URL(fileURLWithPath: localCertPath)),
              let localCertificate = SecCertificateCreateWithData(nil, localCertData as CFData),
              let localPublicKey = extractPublicKey(from: localCertificate) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        
        // 5. Compare keys
        if serverPublicKey == localPublicKey {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
    
    func extractPublicKey(from certificate: SecCertificate) -> SecKey? {
        let policy = SecPolicyCreateBasicX509()
        var trust: SecTrust?

        SecTrustCreateWithCertificates(certificate, policy, &trust)

        guard let trust = trust else { return nil }

        return SecTrustCopyKey(trust)
    }
}
