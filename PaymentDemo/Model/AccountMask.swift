// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

/// Masked account data of this payment operation or involved account. Sensitive fields of the account are removed, truncated, or replaced with mask characters.
class AccountMask: NSObject, Decodable {
    /// Display label of account registration. Usually combined from several account fields.
    let displayLabel: String?

    /// Account holder name.
    let holderName: String?

    /// Account number (bank account number, credit card number, etc.), usually truncated.
    let number: String?

    /// Bank code.
    let bankCode: String?

    /// Bank name.
    let bankName: String?

    /// BIC code.
    let bic: String?

    /// Bank branch name.
    let branch: String?

    /// Bank city or any other account related city.
    let city: String?

    /// Account expiry month (credit/debit cards).
    let expiryMonth: Int?

    /// Account expiry year (credit/debit cards).
    let expiryYear: Int?

    /// IBAN number, usually truncated.
    let iban: String?

    /// Account login name.
    let login: String?
}
