// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

class AccountRegistration: NSObject, Decodable {
    /// Collection of links to build the account form for this registered account and perform different actions with entered data.
    let links: [String: URL]

    /// Payment network code of the registration.
    let code: String

    /// Display label of the payment network for this registration.
    let label: String

    /// Indicates payment method this registered account network belongs to.
    let method: String?

    /// Code of button-label when this registered account is selected.
    let button: String?

    /// Masked account data of this payment operation or involved account. Sensitive fields of the account are removed, truncated, or replaced with mask characters.
    let maskedAccount: AccountMask

    /// Timestamp when this account was successfully used last time for payment request.
    let lastSuccessfulChargeAt: Date?

    /// Indicates that this account registration is initially selected.
    let selected: Bool?

    /// IFrame height for selective native, only supplied if "iFrame" link is present.
    let iFrameHeight: Int?

    /// Timestamp when this account was marked as preferred.
    let preferredAt: Date?

    /// Timestamp when this account was created.
    let createdAt: Date?

    /// Indicates that form for this account is empty, without any text and input elements.
    let emptyForm: Bool?

    /// Collection of form input elements. This information is only exposed if merchant indicated `jsonForms` option in the `view` query parameter.
    let inputElements: [InputElement]?

    // FIXME: `contractData` is not present
    
    private enum CodingKeys: String, CodingKey {
        case links
        case code
        case label
        case method
        case button
        case maskedAccount
        case lastSuccessfulChargeAt
        case selected
        case iFrameHeight
        case preferredAt
        case createdAt
        case inputElements
        case emptyForm
    }
}
