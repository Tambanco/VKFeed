//
//  FeedViewController.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 15.06.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        networkService.getFeed()
    }
}
