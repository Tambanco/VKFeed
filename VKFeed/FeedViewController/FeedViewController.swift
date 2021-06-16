//
//  FeedViewController.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 15.06.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { (feedItem) in
                print(feedItem.date)
            }
        }
    }
}
