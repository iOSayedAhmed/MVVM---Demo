//
//  NetworkServices.swift
//  MVVM-Demo
//
//  Created by iOSayed on 01/11/2022.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    var user:User?
    
    func login(email:String,password:String,compeletion:@escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email == "test"  && password == "123456"
            {
                self?.user = User(email: "elsayed@email.com", firstName: "Elsayed", lastName: "Ahmed", age: 24)
                compeletion(true)
            }else {
                
                self?.user = nil
                compeletion(false)
            }
        }
    }
    
    
    func getLoggedIn() -> User {
        return user!
    }
    
}
