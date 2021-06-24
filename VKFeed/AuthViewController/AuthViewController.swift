//
//  ViewController.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 15.06.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    @IBOutlet weak var enterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        enterButton.layer.masksToBounds = true
        enterButton.layer.cornerRadius = 10
    }

    @IBAction func sighnInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}

