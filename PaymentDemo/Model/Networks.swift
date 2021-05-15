// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class Networks: NSObject, Decodable {
    /// Collection of applicable payment networks that could be used by a customer to complete the payment in scope of this `LIST` session
    let applicable: [ApplicableNetwork]
}
