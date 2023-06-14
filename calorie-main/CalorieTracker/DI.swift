//
//  DI.swift
//  CalorieTracker
//
//  Created by Drew Sen on 11/06/2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

final class DI {
    
    static let authClient: AuthClient = FirebaseAuthClient()
    static let userClient: UserClient = FirebaseUserClient()
    static let entriesClient: EntriesClient = FirebaseEntriesClient()

    static let appRepo = ApplicationRepository(
        authClient: authClient,
        userClient: userClient,
        entriesClient: entriesClient
    )

}
