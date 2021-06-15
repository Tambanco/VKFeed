//
//  AuthService.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 15.06.2021.
//

import Foundation
import VK_ios_sdk

class AuthService {
    private let appID = "7880109"
    private let vkSDK: VKSdk
    
    init() {
        vkSDK = VKSdk.initialize(withAppId: appID)
    }
}
