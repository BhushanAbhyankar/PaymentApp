// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

/// List response with possible payment networks
class ListResult:NSObject, Decodable {
    /// Collection of links related to this `LIST` session
    let links: [String: URL]

    /// Descriptive information that complements the result code and interaction advice.
    let resultInfo: String

    /// Interaction advice for this `LIST` session according to its current state.
    let interaction: Interaction

    /// Collection of registered accounts (if available) for recurring customer.
    let accounts: [AccountRegistration]?

    /// Payment networks applicable for this `LIST` session.
    let networks: Networks

    /// Extra elements that should be rendered on payment page; intended for additional labels and checkboxes.
    let extraElements: ExtraElement?

    /// An information about preset account.
    let presetAccount: PresetAccount?

    /// Operation type for this `LIST` session
    ///
    /// Possible values: `CHARGE`, `PRESET`, `PAYOUT`, `UPDATE`
    let operationType: String?

    /// Indicates that deletion of registered accounts is allowed in scope of this `LIST` session
    /// * If set to `true` the deletion accounts is explicitly permitted by merchant.
    /// * If set to `false` the deletion accounts is explicitly disallowed by merchant.
    /// * If nothing is set the default behavior applies: deletion is only allowed for `LIST`s in the `updateOnly` mode.
    let allowDelete: Bool?

    /// Allows to change default appearance of payment page.
    ///
    /// - Note: `_Style` used for Objective-C compatibility
    let style: _Style?

    /// Defines what integration scenario this payment session is initialized for, default is `DISPLAY_NATIVE`.
    let integrationType: String
    
    private enum CodingKeys: String, CodingKey {
        case links
        case resultInfo
        case interaction
        case accounts
        case networks
        case extraElements
        case presetAccount
        case operationType
        case allowDelete
        case style
        case integrationType
    }

}
