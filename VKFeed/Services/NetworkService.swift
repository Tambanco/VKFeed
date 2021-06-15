//
//  NetworkService.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 15.06.2021.
//

import Foundation

final class NetworkService {
    
    func getFeed() {
        var components = URLComponents()
        
        //https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&access_token=533bacf01e11f55b536a565b57531ac114461ae8736d6506a3&v=5.131
        
        let params = ["filters" : "post, photo"]
        let allParams = params
        allParams["access_token"]
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems
        
        components.url
    }
    
}
