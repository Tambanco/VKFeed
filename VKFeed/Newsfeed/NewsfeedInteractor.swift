//
//  NewsfeedInteractor.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 16.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    
    private var revealedPostId = [Int]()
    private var feedResponse: FeedResponse?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        
        switch request {
        case .getNewsFeed:
            fetcher.getFeed { [weak self] (feedResponse) in
                
//                print("feedResponse?.nextFrom: \(feedResponse?.nextFrom)")
                
                self?.feedResponse = feedResponse
                self?.presentFeed()
                print(self?.feedResponse?.nextFrom)
            }
        case .getUser:
            fetcher.getUser { (userResponse) in
                self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentUserInfo(user: userResponse))
            }
        case .revealPostIds(postId: let postId):
        revealedPostId.append(postId)
        presentFeed()
        }
    }
    
    private func presentFeed() {
        guard let feedResponse = feedResponse else { return }
        presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse, revealedPostIds: revealedPostId))
    }
}

