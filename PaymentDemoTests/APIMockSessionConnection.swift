//
//  APIMockSessionConnection.swift
//  PaymentDemoTests
//
//  Created by Abhyankar Bhushan on 14/05/21.
//

import Foundation
@testable import PaymentDemo

class APIMockSessionConnection:ConnectionRequest {
    typealias RequestCompletionHandler = (Result<Data?, Error>) -> Void

    func sendNetwork(request: URLRequest, completionHandler: @escaping ((Result<Data?, Error>) -> Void)) {
        let bundle = Bundle(for:APIMockSessionConnection.self)
        let url = bundle.url(forResource: "MockResult", withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        handleTaskResponse(data: jsonData, response: nil, error: nil, completionHandler: completionHandler)
    }
    
    static func isRecoverableError(_ error: Error) -> Bool {
        return false
    }
    private func handleTaskResponse(data: Data?, response: URLResponse?, error: Error?, completionHandler: @escaping RequestCompletionHandler) {
        // HTTP Errors
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        completionHandler(.success(data))
    }

}
