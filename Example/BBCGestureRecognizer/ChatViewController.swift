//
//  ChatViewController.swift
//  BBCGestureRecognizer_Example
//
//  Created by Anton Nazarov on 11/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import BBCGestureRecognizer
import UIKit

final class ChatViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(BBCGestureRecognizer(target: self, action: #selector(handleBBC(sender:))))
    }
}

// MARK: - Private
private extension ChatViewController {
    @objc func handleBBC(sender: BBCGestureRecognizer) {
        switch sender.state {
        case .ended:
                imageView.image = #imageLiteral(resourceName: "ChatAnswerExample")
        default:
            break
        }
    }
}
