//
//  SignInView.swift
//  CalorieTracker
//
//  Created by Drew Sen on 13/06/2023.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var appRepo: ApplicationRepository
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Form {
                    Text(
                    """
                    Welcome to Calorie Tracker demo app! There are 2 roles for this app:\n
                    1. Regular user - can read/add/update/delete own food entries
                    2. Admin user - can read/add/update/delete any other user food entries. Has access to reports
                    
                    Sign in with provided credentials:
                    """
                    )
                    
                    Section {
                        TextField(
                            "name@email.com",
                            text: $appRepo.email
                        )
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .tint(.gray)
                        
                        SecureField(
                            "••••••••",
                            text: $appRepo.password
                        )
                    }
                }
                
                AsyncButton(action: appRepo.signIn) {
                    Text("Sign In")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                }
                .background(.blue)
                .disabled(!appRepo.isFormValid)
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("Calorie Tracker")
        }
    }
    
}
