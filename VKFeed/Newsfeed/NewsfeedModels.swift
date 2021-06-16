//
//  NewsfeedModels.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 16.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Newsfeed {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getNewsFeed
            }
        }
        struct Response {
            enum ResponseType {
                case presentNewsfeed
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case some
                case displayNewsFeed
            }
        }
    }
        
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var iconURLString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
    }
    let cells: [Cell]
}
