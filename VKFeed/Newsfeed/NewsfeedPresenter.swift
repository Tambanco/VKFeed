//
//  NewsfeedPresenter.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 16.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
    func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    
    weak var viewController: NewsfeedDisplayLogic?
    let ff = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    var cellLayaoutCalculator: FeedCellLayoutCalculatorProtocol = FeedCellLayoutCalculator()
    
    let dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_RU")
        dt.dateFormat = "d MMM 'в' HH:mm"
        return dt
    }()
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        
        switch response {
        case .presentNewsfeed(let feed, let revealedPostIds):
            
            let cells = feed.items.map { (feedItem) in
                cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups, revealedPostIds: revealedPostIds)
            }
            
            let feedViewModel = FeedViewModel.init(cells: cells)
            viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsFeed(feedViewModel: feedViewModel))
        case .presentUserInfo(user: let user):
            let userViewModel = UserViewModel.init(photoUrlString: user?.photo100)
            viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayUser(userViewModel: userViewModel))
        }
    }
    
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group], revealedPostIds: [Int]) -> FeedViewModel.Cell {
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        
        let photoAttachement = self.photoAttachments(feedItem: feedItem)
        
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)
        
        let isFullSized = revealedPostIds.contains { (postId) -> Bool in
            return postId == feedItem.postId
        }
//        let isFullSized = revealedPostIds.contains(feedItem.postId)
        
        let sizes = cellLayaoutCalculator.sizes(postText: feedItem.text, photoAttachements: photoAttachement, isFullSizedPost: isFullSized)
        
        return FeedViewModel.Cell.init(postId: feedItem.postId,
                                       iconURLString: profile.photo,
                                       name: profile.name,
                                       date: dateTitle,
                                       text: feedItem.text,
                                       likes: String(feedItem.likes?.count ?? 0),
                                       comments: String(feedItem.comments?.count ?? 0),
                                       shares: String(feedItem.reposts?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0),
                                       photoAttachements: photoAttachement,
                                       sizes: sizes)
    }
    
    private func profile(for sourceId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {
        let profilesOrGroups: [ProfileRepresentable] = sourceId >= 0 ? profiles : groups
        let normalSourceId = sourceId >= 0 ? sourceId : -sourceId
        let profileRepresentable = profilesOrGroups.first { (myProfileRepresentable) -> Bool in
            myProfileRepresentable.id == normalSourceId
        }
        return profileRepresentable!
    }
    
    private func photoAttachemnent(feedItem: FeedItem) -> FeedViewModel.FeedCellPhotoAttachement? {
        guard let photos = feedItem.attachments?.compactMap({ (attechement) in
            attechement.photo
        }), let firstPhoto = photos.first else {
            return nil
        }
        return FeedViewModel.FeedCellPhotoAttachement.init(photoUrlString: firstPhoto.srcBIG, width: firstPhoto.width, height: firstPhoto.height)
    }
    
    private func photoAttachments(feedItem: FeedItem) -> [FeedViewModel.FeedCellPhotoAttachement] {
        guard let attachments = feedItem.attachments else { return [] }
        return attachments.compactMap({ (attachment) -> FeedViewModel.FeedCellPhotoAttachement? in
            guard let photo = attachment.photo else { return nil }
            return FeedViewModel.FeedCellPhotoAttachement.init(photoUrlString: photo.srcBIG,
                                                               width: photo.width,
                                                               height: photo.height)
        })
    }
}
