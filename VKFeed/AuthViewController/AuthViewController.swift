//
//  ViewController.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 15.06.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .red
    }

    @IBAction func sighnInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}

