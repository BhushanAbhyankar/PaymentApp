//
//  ApplicableNetworkLinks.swift
//  PaymentDemo
//
//  Created by Abhyankar Bhushan on 09/05/21.
//

import UIKit

class ApplicableNetworkLinks: NSObject , Decodable {
    /// Account holder name.
    let logo: String?
    let lang: String?
    let operation: String?
    let validation: String?
}

