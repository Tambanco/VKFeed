//
//  Constants.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 17.06.2021.
//

import Foundation
import UIKit

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 12, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 40
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let bottomViewHeight: CGFloat = 50
    
    static let bottomViewViewHeight: CGFloat = 40
    static let bottomViewViewWidth: CGFloat = 86
    
    static let bottomViewViewsIconSize: CGFloat = 24
    
    static let minifiedPostLimitLines: CGFloat = 8
    static let minifiedPostLines: CGFloat = 6
    
    static let moreTextButtonInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    static let moreTextButtonSize = CGSize(width: 170, height: 30)
}
