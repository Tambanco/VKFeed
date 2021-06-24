//
//  GradientView.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 24.06.2021.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    private var startColor: UIColor = .red
    private var endColor: UIColor = .yellow
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}
