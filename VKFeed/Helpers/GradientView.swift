//
//  GradientView.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 24.06.2021.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    @IBInspectable private var startColor: UIColor?
    @IBInspectable private var endColor: UIColor?
    
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
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}
