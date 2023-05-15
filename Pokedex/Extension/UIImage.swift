//
//  UIImage.swift
//  Pokedex
//
//  Created by Francesco Merola on 14/05/23.
//

import Foundation
import SwiftUI

extension UIImage {
    static func imageWithGradient(colors: [Color], size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map({ $0.cgColor as Any })
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
