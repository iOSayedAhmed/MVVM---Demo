//
//  ObservableObject.swift
//  MVVM-Demo
//
//  Created by iOSayed on 01/11/2022.
//

import Foundation

final class ObservableObject<T>{
    
    var value:T {
        didSet{
            listener?(value)
        }
    }
    var listener:((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ lisener:@escaping (T) -> Void){
        
        lisener(value)
        self.listener = lisener
    }
    
    
    
}
