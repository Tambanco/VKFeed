//
//  NewsfeedCellLayoutCalculator.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 16.06.2021.
//

import Foundation
import UIKit

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachement: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachementFrame: CGRect
    var moreTextButtonFrame: CGRect
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    
    func sizes(postText: String?, photoAttachement: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes {
        
        var showMoreTextButton = false
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        // MARK: - postLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            var height = text.height(width: width, font: Constants.postLabelFont)
            
            let limitHeight = Constants.postLabelFont.lineHeight * Constants.minifiedPostLimitLines
            if height > limitHeight {
                height = Constants.postLabelFont.lineHeight * Constants.minifiedPostLimitLines
                showMoreTextButton = true
            }
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: - moreTextButtonFrame
        
        var moreTextButtonSize = CGSize.zero
        if showMoreTextButton {
            moreTextButtonSize = Constants.moreTextButtonSize
        }
        
        let moreTextButtonOrigin = CGPoint(x: Constants.moreTextButtonInsets.left,
                                           y: postLabelFrame.maxY)
        let moreTextButtonFrame = CGRect(origin: moreTextButtonOrigin, size: moreTextButtonSize)
        
        
        // MARK: - attachementFrame
        let attachementTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : moreTextButtonFrame.maxY + Constants.postLabelInsets.bottom
        
        var attachementFrame = CGRect(origin: CGPoint(x: 0, y: attachementTop), size: CGSize.zero)
        
        if let attachement = photoAttachement {
            let photoHeight: Float = Float(attachement.height)
            let photoWidth: Float = Float(attachement.width)
            let ratio = CGFloat(photoHeight / photoWidth)
            attachementFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
        }
        
        // MARK: - bottomViewFrame
        let bottomViewTop = max(postLabelFrame.maxY, attachementFrame.maxY)
        let bottomViewFrame = CGRect(origin: CGPoint(x: 0, y: bottomViewTop), size: CGSize(width: cardViewWidth, height: Constants.bottomViewHeight))
        
        // MARK: - totalHeight
        let totalHeight = bottomViewFrame.maxY + Constants.cardInsets.bottom
        
        return Sizes(postLabelFrame: postLabelFrame,
                     attachementFrame: attachementFrame,
                     moreTextButtonFrame: moreTextButtonFrame,
                     bottomViewFrame: bottomViewFrame,
                     totalHeight: totalHeight)
    }
}
