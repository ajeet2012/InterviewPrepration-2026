//
//  SSLPinningManager.swift
//  Coding-Practice-Interview
//
//  Created by Ajeet Sharma on 26/04/26.
//

import Foundation


class SSLPinningManager: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        // 1. Validate challenge type
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

        let serverCertData = SecCertificateCopyData(serverCertificate) as Data

        // 3. Load local certificate
        guard let certPath = Bundle.main.path(forResource: "server", ofType: "cer"),
              let localCertData = try? Data(contentsOf: URL(fileURLWithPath: certPath)) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        // 4. Compare certificates
        if serverCertData == localCertData {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
