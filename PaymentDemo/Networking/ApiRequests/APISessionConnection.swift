//
//  APISessionConnection.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 14/05/21.
//

import UIKit

class APISessionConnection:ConnectionRequest {
    typealias RequestCompletionHandler = (Result<Data?, Error>) -> Void
    let session = URLSession(configuration: URLSessionConfiguration.default)

    func sendNetwork(request: URLRequest, completionHandler: @escaping ((Result<Data?, Error>) -> Void)) {
        // Send a network request
        let task = session.dataTask(with: request) { [handleTaskResponse] (data, response, error) in
            handleTaskResponse(data, response, error, completionHandler)
        }
        task.resume()
    }
    
    static func isRecoverableError(_ error: Error) -> Bool {
        let nsError = error as NSError
        return nsError.domain == NSURLErrorDomain
    }
    private func handleTaskResponse(data: Data?, response: URLResponse?, error: Error?, completionHandler: @escaping RequestCompletionHandler) {
        // HTTP Errors
        if let error = error {
            completionHandler(.failure(error))
            return
        }

        guard let response = response else {
            let error = CustomError(message: "Incorrect completion from a URLSession, we have no error and no response")
            completionHandler(.failure(error))
            return
        }

        // We expect HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            let error = CustomError(message: "Unexpected server response (receive a non-HTTP response)")
            completionHandler(.failure(error))
            return
        }

        // - TODO:backend's status codes
        guard httpResponse.statusCode >= 200, httpResponse.statusCode < 400 else {
            if let data = data, let backendError = try? JSONDecoder().decode(ErrorInfo.self, from: data) {
                completionHandler(.failure(backendError))
            } else {
                let error = CustomError(message: "Non-OK response from a server")
                completionHandler(.failure(error))
            }

            return
        }

        completionHandler(.success(data))
    }
    
    struct CustomError: Error {
        let message: String
        
        init(message: String) {
            self.message = message
        }
    }
    
}
