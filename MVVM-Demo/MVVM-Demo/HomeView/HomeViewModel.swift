//
//  HomeViewModel.swift
//  MVVM-Demo
//
//  Created by iOSayed on 02/11/2022.
//

import Foundation

final class HomeViewModel {
    
     var welcomeMessage : ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggedIn() {
        let user = NetworkService.shared.getLoggedIn()
        self.welcomeMessage.value = "hello \(user.firstName) \(user.lastName)"
        
    }
    
}
