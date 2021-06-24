//
//  UserResponse.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 24.06.2021.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
