//
//  LoginViewController.swift
//  ReactiveFramework
//
//  Created by Ajeet Sharma on 27/04/26.
//

import UIKit
import Combine
class LoginViewController: UIViewController {
    
    let viewModel: LoginViewModel = LoginViewModel()
    private var bag = Set<AnyCancellable>()
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "To call login api"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Tap Me", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(button)
        
        // MARK: - Constraints
        NSLayoutConstraint.activate([
            // Center label
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Button below label
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // MARK: - Action
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.viewModelBinding()
    }
    
    @objc func buttonTapped() {
        print("Button tapped")
        label.text = "Api calling in progress..."
        button.isHidden = true
        viewModel.apiCall()
    }
    
    private func viewModelBinding() {
        
        /*
         
         •    sink → “Subscriber used to handle values and completion with full control.”
         •    assign → “Subscriber used to bind publisher output directly to a property.”
         
         
         viewModel.$username
         .sink { value in
         print("Username:", value)
         }
         
         
         viewModel.$username
         .assign(to: \.text, on: textField)
         
         */
        viewModel.$error
            .receive(on: RunLoop.main)
            .sink { [weak self] error in
                if let err = error {
                    self?.label.text = "\(err)"
                }
                self?.button.isHidden = false
            }
            .store(in: &bag)
        
        viewModel.$responseArray
            .map { array in
                array.map({$0 * 2})
                
            }
            .receive(on: RunLoop.main)
            .sink { [weak self] list in
                self?.label.text = "\(list.reduce(0, +))"
                self?.button.isHidden = false
            }
            .store(in: &bag)
        /*
         .store(in:) is used to retain the subscription so it doesn’t get cancelled immediately.
         */
    }
    
}

