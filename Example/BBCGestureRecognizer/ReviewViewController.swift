//
//  ReviewViewController.swift
//  BBCGestureRecognizer_Example
//
//  Created by Anton Nazarov on 11/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import BBCGestureRecognizer
import StoreKit
import UIKit

final class ReviewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(BBCGestureRecognizer(target: self, action: #selector(handleBBC(sender:))))
    }
}

// MARK: - Private
private extension ReviewViewController {
    @objc func handleBBC(sender: BBCGestureRecognizer) {
        switch sender.state {
        case .ended:
            SKStoreReviewController.requestReview()
        default:
            break
        }
    }
}
