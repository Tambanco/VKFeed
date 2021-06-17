//
//  NewsfeedCodeCell.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 17.06.2021.
//

import Foundation
import UIKit

final class NewsfeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCodeCell"
    
    // first layer
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        return view
    }()
    
    // second layer
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return view
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Constants.postLabelFont
        label.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        label.textColor = #colorLiteral(red: 0.1725490196, green: 0.1764705882, blue: 0.1803921569, alpha: 1)
        return label
    }()
    
    let postImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return imageView
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return view
    }()
    
    // third layer on topView
    let iconImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textColor = #colorLiteral(red: 0.1725490196, green: 0.1764705882, blue: 0.1803921569, alpha: 1)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // third layer on bottomView
    let likesView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentsView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sharesView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewsView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        overlayFirstLayer()
        overlaySecondLayer()
        overlayThirdLayerOnTopView()
        overlayThirdLayerOnBottomView()
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageURL: viewModel.iconURLString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachementFrame
        bottomView.frame = viewModel.sizes.bottomViewFrame
        
        if let photoAttachement = viewModel.photoAttachement {
            postImageView.set(imageURL: photoAttachement.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
    
    private func overlayThirdLayerOnBottomView() {
        bottomView.addSubview(likesView)
        bottomView.addSubview(commentsView)
        bottomView.addSubview(sharesView)
        bottomView.addSubview(viewsView)
        
        // likesView constraints
        likesView.anchor(top: bottomView.topAnchor,
                         leading: bottomView.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
        
        // commentsView constraints
        commentsView.anchor(top: bottomView.topAnchor,
                         leading: likesView.trailingAnchor,
                         bottom: nil,
                         trailing: nil,
                         size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
        
        // commentsView constraints
        sharesView.anchor(top: bottomView.topAnchor,
                         leading: commentsView.trailingAnchor,
                         bottom: nil,
                         trailing: nil,
                         size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
        
        // viewsView constraints
        viewsView.anchor(top: bottomView.topAnchor,
                         leading: nil,
                         bottom: nil,
                         trailing: bottomView.trailingAnchor,
                         size: CGSize(width: Constants.bottomViewViewWidth, height: Constants.bottomViewViewHeight))
    }
    
    private func overlayThirdLayerOnTopView() {
        topView.addSubview(iconImageView)
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)
        
        // iconImageView constraints
        iconImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
        
        // nameLabel constraints
        nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.topViewHeight / 2 - 2).isActive = true
        
        // dateLabel constraints
        dateLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    private func overlaySecondLayer() {
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)
        
        // topView constraints
        topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
        topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight).isActive = true
    }
    
    private func overlayFirstLayer() {
        addSubview(cardView)
        
        // cardView constraints
        cardView.fillSuperview(padding: Constants.cardInsets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
