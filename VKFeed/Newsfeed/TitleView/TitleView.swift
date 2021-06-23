//
//  TitleView.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 23.06.2021.
//

import Foundation
import UIKit

class TitleView: UIView {
//
//    private var myTextField: UITextField = {
//
//    }()
//
    private var myAvatarView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .orange
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
