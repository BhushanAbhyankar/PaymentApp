// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class Installments: NSObject, Decodable {
    /// An information about original payment
    let originalPayment: PaymentAmount?

    /// Collection of calculated installments plans what should be present to customer.
    let plans: [InstallmentsPlan]?
}
