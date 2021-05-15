//
//  PaymentSelectionListViewModel.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 09/05/21.
//

import UIKit

class PaymentSelectionListViewModel: NSObject{
    
    private var paymentSelectionListApi : PaymentSelectionApiManager!
    var bindViewModelToVC: (() -> ()) = {}

    private(set) var paymentList:ListResult?{
        didSet{
            //bind this data to viewController
            self.bindViewModelToVC()
        }
    }
    private(set) var listError:Error?{
        didSet{
            //bind this data to viewController
            self.bindViewModelToVC()
        }
    }
    
    override init() {
        super.init()
        let apiSessionConnection = APISessionConnection()
        self.paymentSelectionListApi = PaymentSelectionApiManager.init(connection: apiSessionConnection)
        getPaymentsListFromApi()
    }
    
    func getPaymentsListFromApi(){
        paymentSelectionListApi.getPaymentsListFromAPI { result in
            switch result {
            case .success(let listResult):
                self.paymentList = listResult
            case .failure(let error):
                self.listError = error
            }
        }
    }
    
}
