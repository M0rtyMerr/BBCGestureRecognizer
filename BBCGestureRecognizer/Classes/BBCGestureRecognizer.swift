//
//  BBCGestureRecognizer.swift
//  BBCGestureRecognizer
//
//  Created by Anton Nazarov on 09/01/2019.
//  Copyright © 2019 Anton Nazarov. All rights reserved.
//

import CoreML
import UIKit
import Vision

public final class BBCGestureRecognizer: UIGestureRecognizer {
    // TODO: add DI here (Typhoon???)
    private let bbcClassifier = BBCClassifierService()
    private var trackedTouch: UITouch?
    public var recordedPoints = [CGPoint]()

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        guard touches.count == 1 else {
            state = .failed
            return
        }
        guard trackedTouch == nil else {
            for touch in touches where touch != trackedTouch {
                ignore(touch, for: event)
            }
            return
        }
        guard let firstTouch = touches.first else { return }
        trackedTouch = firstTouch
        addPoint(for: firstTouch)
        state = .began
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let firstTouch = touches.first else { return }
        addPoint(for: firstTouch)
        state = .changed
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let firstTouch = touches.first else { return }
        self.addPoint(for: firstTouch)
        guard let view = view else { return }
        let renderView = RenderView(frame: view.frame)
        renderView.points = recordedPoints
        guard let bbcData = renderView.asImage().jpegData(compressionQuality: 1) else { return }
        // TODO: send user pic to backend here
        do {
            try bbcClassifier.classify(data: bbcData) {
                self.state = $0 == .bbc ? .ended : .cancelled
            }
        } catch {
            state = .cancelled
        }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        recordedPoints.removeAll()
        state = .cancelled
    }

    override public func reset() {
        recordedPoints.removeAll()
        trackedTouch = nil
    }
}

// MARK: - Private
private extension BBCGestureRecognizer {
    func addPoint(for touch: UITouch) {
        recordedPoints.append(touch.location(in: self.view))
    }
}
