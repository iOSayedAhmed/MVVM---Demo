//
//  LoginViewModel.swift
//  MVVM-Demo
//
//  Created by iOSayed on 31/10/2022.
//

import Foundation

class LoginViewModel {

    var error:ObservableObject<String?> = ObservableObject(nil)
    
    func login(email:String,password:String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            self?.error.value = success ? nil : "Invalid Credintioal!!"
        }
    }
    

}
