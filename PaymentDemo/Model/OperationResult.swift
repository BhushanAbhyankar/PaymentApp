// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

/// Result of `CHARGE` operation execution with interaction information
@objc public class OperationResult: NSObject, Decodable {
    /// Descriptive information that complements the interaction advice
    public let resultInfo: String

    /// - TODO: Document it
    /// - TODO: Is it optional?
    public let links: [String: URL]?

    /// Interaction advice for the operation result
    public let interaction: Interaction

    /// If present, merchant is advised to redirect customer to corresponding redirect URL; this will lead to either
    /// PSP web-site to complete initiated payment, or it will be pointing to one of the merchants callback URLs from `LIST` session
    public let redirect: Redirect?

    /// Provider response data given back by the target provider as a result of transaction action; this data should contain all needed information to continue customer's journey on the payment page in the scope of used network
    public let providerResponse: ProviderParameters?

    internal init(resultInfo: String, links: [String: URL]?, interaction: Interaction, redirect: Redirect?, providerResponse: ProviderParameters? = nil) {
        self.resultInfo = resultInfo
        self.links = links
        self.interaction = interaction
        self.redirect = redirect
        self.providerResponse = providerResponse
    }
}
