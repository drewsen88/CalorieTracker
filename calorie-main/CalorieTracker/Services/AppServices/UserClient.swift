//
//  UserClient.swift
//  CalorieTracker
//
//  Created by Drew Sen on 10/06/2023.
//

import Foundation

protocol UserClient {
    
    func allUsers() async -> [User]
    
}
