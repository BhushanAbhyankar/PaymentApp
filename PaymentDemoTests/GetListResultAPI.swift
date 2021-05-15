//
//  GetListResultAPI.swift
//  PaymentDemoTests
//
//  Created by Abhyankar Bhushan on 14/05/21.
//

import XCTest
@testable import PaymentDemo

class GetListResultAPI: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testListResultAPI() throws {
        let apiMockSessionConnection =  APIMockSessionConnection()
        let apirReq = URLRequest.init(url: URL.init(string: "apiURL")!)

        apiMockSessionConnection.sendNetwork(request: apirReq) { result in
            switch result {
            case .success(let listResult):
                    do {
                        let jsonDecoder = JSONDecoder()
                        let listResult = try jsonDecoder.decode(ListResult.self, from: listResult!)
                        XCTAssertEqual(listResult.networks.applicable.first?.code, "AMEX")
                    } catch {
                        print("error : \(error)")
                        XCTFail(error.localizedDescription)
                    }
                                    
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
}
