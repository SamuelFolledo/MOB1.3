//
//  LoginModels.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 5/4/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

struct AuthenticationTokenResponse: ModelProtocol {
    let success: Bool?
    let expires_at: String?
    let request_token: String?
}

struct CreateSessionResponse: ModelProtocol {
    let success: Bool
    let session_id: String
}

struct Account : ModelProtocol {
    let id: Int
    let name: String?
    let username: String?

    var displayName: String {
        if let name = name, !name.isEmpty {
            return name
        }
        return username ?? "(uknown)"
    }
}
