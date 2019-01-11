//
//  RenderView.swift
//  BBCGestureRecognizer
//
//  Created by Anton Nazarov on 10/01/2019.
//

import UIKit

public final class RenderView: UIView {
    public var points = [CGPoint]() {
        didSet { setNeedsDisplay() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext(), !points.isEmpty else { return }
        context.clear(bounds)
        context.setLineWidth(10.0)
        context.move(to: points[0])
        points.dropFirst().forEach(context.addLine)
        context.strokePath()
    }
}
