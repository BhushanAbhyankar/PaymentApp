// Copyright (c) 2021 Payoneer Germany GmbH
// https://www.payoneer.com
//
// This file is open source and available under the MIT license.
// See the LICENSE file for more information.

import Foundation

/// Current list of payment methods. That list could be changed in future or `method` could contain the new value that are not present in enum.
enum PaymentMethod: String, RawRepresentable {
    case BANK_TRANSFER
    case BILLING_PROVIDER
    case CASH_ON_DELIVERY
    case CHECK_PAYMENT
    case CREDIT_CARD
    case DEBIT_CARD
    case DIRECT_DEBIT
    case ELECTRONIC_INVOICE
    case GIFT_CARD
    case MOBILE_PAYMENT
    case ONLINE_BANK_TRANSFER
    case OPEN_INVOICE
    case PREPAID_CARD
    case TERMINAL
    case WALLET
}
