//
//  DrawingViewController.swift
//  BBCGestureRecognizer
//
//  Created by MortyMerron 01/10/2019.
//  Copyright (c) 2019 MortyMerr All rights reserved.
//

import BBCGestureRecognizer
import UIKit

final class DrawingViewController: UIViewController {
    @IBOutlet private var identifierLabel: UILabel!
    @IBOutlet private var renderView: RenderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        renderView.addGestureRecognizer(BBCGestureRecognizer(target: self, action: #selector(handleBBC(sender:))))
    }
}

// MARK: - Private
private extension DrawingViewController {
    @objc func handleBBC(sender: BBCGestureRecognizer) {
        renderView.points = sender.recordedPoints
        switch sender.state {
        case .ended:
            identifierLabel.text = "BBC"
        case .cancelled:
            identifierLabel.text = "Not BBC"
        default:
            break
        }
    }
}
