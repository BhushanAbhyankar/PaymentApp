// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class SelectOption: NSObject, Decodable {
    /// The value for this option.
    let value: String

    /// If set to `true` this option should be pre-selected, otherwise no specific behavior should be applied for this option.
    let selected: Bool?
}
