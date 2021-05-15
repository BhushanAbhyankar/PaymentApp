// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class ExtraElements: NSObject, Decodable {
    /// Collection of extra elements (labels and checkboxes) that should be displayed on the top of payment page.
    let top: [ExtraElement]?

    /// Collection of extra elements (labels and checkboxes) that should be displayed on the bottom of payment page.
    let bottom: [ExtraElement]?
}
