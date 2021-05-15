// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class CustomerFormData: NSObject, Decodable {
    /// Customer's birthday.
    let birthday: String?
}
