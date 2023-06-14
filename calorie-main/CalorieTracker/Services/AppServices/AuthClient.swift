//
//  AuthClient.swift
//  CalorieTracker
//
//  Created by Drew Sen on 12/06/2023.
//

import Foundation

protocol AuthClient {
    
    var currentUser: User? { get }
    
    func signIn(email: String, password: String) async -> User?
    func signOut()
    
}
