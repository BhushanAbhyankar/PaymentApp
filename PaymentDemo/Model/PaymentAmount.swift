// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class PaymentAmount: NSObject, Decodable {
    /// Payment amount in major units.
    let amount: Double

    /// 3-letter currency code (ISO 4217)
    let currency: String
}
