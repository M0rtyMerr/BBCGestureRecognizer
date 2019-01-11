//
//  UIView+asImage.swift
//  BBCGestureRecognizer
//
//  Created by Anton Nazarov on 10/01/2019.
//

extension UIView {
    func asImage() -> UIImage {
        return UIGraphicsImageRenderer(bounds: bounds).image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
