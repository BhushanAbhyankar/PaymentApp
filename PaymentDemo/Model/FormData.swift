// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class FormData: NSObject, Decodable {
    /// Account related data to pre-fill a form.
    let account: AccountFormData?

    /// Customer related data to pre-fill a form.
    let customer: CustomerFormData?

    /// Data about possible installments plans.
    let installments: Installments?

    /// URL to the data privacy consent document.
    let dataPrivacyConsentUrl: URL?
}
