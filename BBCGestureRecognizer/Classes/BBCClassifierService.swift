//
//  BBCClassifierService.swift
//  BBCGestureRecognizer
//
//  Created by Anton Nazarov on 11/01/2019.
//

import CoreML
import Vision

final class BBCClassifierService {
    // TODO: add BBC sizes classification
    private enum Identifier: String {
        case bbc = "BBC"
        case notBbc = "Not-BBC"
    }

    // swiftlint:disable:next force_try
    private let bbcModel = try! VNCoreMLModel(for: BBCClassifier().model)

    func classify(data: Data, completion: @escaping ((BBCType) -> Void)) throws {
        let bbcClassifierRequest = VNCoreMLRequest(model: bbcModel) { request, _ in
            guard let results = request.results as? [VNClassificationObservation],
                let result = BBCType(rawValue: results.first?.identifier ?? "") else { return }
            completion(result)
        }
        try VNImageRequestHandler(data: data, options: [:]).perform([bbcClassifierRequest])
    }
}
