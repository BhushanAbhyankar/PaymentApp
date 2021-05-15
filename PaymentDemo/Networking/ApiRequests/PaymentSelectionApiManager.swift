//
//  PaymentSelectionApiManager.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 09/05/21.
//

import UIKit

class PaymentSelectionApiManager: NSObject {
    let apiURL =  "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json"
    typealias RequestCompletionHandler = (Result<Data?, Error>) -> Void
    private let connection: APISessionConnection
    init (connection: APISessionConnection){
        self.connection = connection
    }
    func getPaymentsListFromAPI(completion: @escaping (Result<ListResult, Error>)->()){
        let apirReq = URLRequest.init(url: URL.init(string: apiURL)!)
        self.connection.sendNetwork(request: apirReq) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let listData = try jsonDecoder.decode(ListResult.self, from: data!)
                    completion(.success(listData))
                } catch {
                    print("error : \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("got failure: \(error)")
                completion(.failure(error))
            }
        }
    }
}
