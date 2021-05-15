// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class InstallmentItem: NSObject, Decodable {
    /// An amount of this installment in major units.
    let amount: Double?

    /// An installment (or payment) date.
    let date: String?
}
