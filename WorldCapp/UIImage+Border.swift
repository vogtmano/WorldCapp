//
//  UIImage+Border.swift
//  WorldCapp
//
//  Created by Maks Vogtman on 08/05/2023.
//

import Foundation
import UIKit

extension UIImage {
    static func imageWithBorder(from image: UIImage) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        
        let rendered = renderer.image { ctx in
            image.draw(in: rect)
            
            let strokeRect = rect.insetBy(dx: 0.5, dy: 0.5)
            ctx.cgContext.setStrokeColor(UIColor.gray.cgColor)
            ctx.cgContext.setLineWidth(1)
            ctx.cgContext.stroke(strokeRect)
        }
        
        return rendered
    }
}
