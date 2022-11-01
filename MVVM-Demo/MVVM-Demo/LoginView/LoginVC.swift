//
//  ViewController.swift
//  MVVM-Demo
//
//  Created by iOSayed on 31/10/2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinders()
    }
    
    //MARK: Functions
    
    func setupBinders() {
        viewModel.error.bind {[weak self] error in
            if let error = error {
                print(error)
                let alert = UIAlertController(title: "error", message: error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { _ in
                    self?.view.alpha = 1
                }))
                self?.view.alpha = 0.6
                self?.present(alert, animated: true)
            }else {
                self?.goToHomeView()

            }
        }
    }
    
    func goToHomeView() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        present(vc, animated: true)
    }
    
    @IBAction func loginClickedButton(_ sender: UIButton) {
        guard let email = emailTextField.text , let password = passwordTextField.text else {
            print("Please Write email & password")
            return
        }
        viewModel.login(email: email, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

