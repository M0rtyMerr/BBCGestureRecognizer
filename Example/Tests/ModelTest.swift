//
//  ModelTest.swift
//  BBCGestureRecognizer_Tests
//
//  Created by Anton Nazarov on 11/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

@testable import BBCGestureRecognizer
import Nimble
import Quick

class ModelTest: QuickSpec {
    private let classifierService = BBCClassifierService()

    override func spec() {
        super.spec()

        describe("BBC model classification test") {
            it("classifies BBC on BBC image") {
                waitUntil { done in
                    try! self.classifierService.classify(data: #imageLiteral(resourceName: "excellentMemAboutBBC").jpegData(compressionQuality: 1)!) {
                        expect($0) == .bbc
                        done()
                    }
                }
            }

            it("classifies bold from brazzers as non BBC") {
                waitUntil { done in
                    try! self.classifierService.classify(data: #imageLiteral(resourceName: "notBBC").jpegData(compressionQuality: 1)!) {
                        expect($0) == .notBbc
                        done()
                    }
                }
            }
        }
    }
}
