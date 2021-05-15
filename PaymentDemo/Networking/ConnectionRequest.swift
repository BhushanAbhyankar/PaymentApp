//
//  ConnectionRequest.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 14/05/21.
//

import UIKit

protocol ConnectionRequest {
    func sendNetwork(request: URLRequest, completionHandler: @escaping ((Result<Data?, Error>) -> Void))
    static func isRecoverableError(_ error: Error) -> Bool
}
