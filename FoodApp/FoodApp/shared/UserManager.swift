//
//  UserManager.swift
//  FoodApp
//
//  Created by osmanyesil on 4/4/22.
//

import Foundation

class UserManager {
    
    static let shared = UserManager()
    
    private init(){
        
    }
    
    private(set) var userName:String = "osmanyesil"
    
    func changeUserName(userName:String){
        self.userName = userName
    }
    
}
