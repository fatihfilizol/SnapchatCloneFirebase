//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Fatih Filizol on 22.09.2022.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    
    private init (){
        
    }
    
}
