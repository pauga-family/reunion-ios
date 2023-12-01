//
//  Gradients.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation
import SwiftUI

enum Gradients: String {
    case whitePrimaryBlack
    case extraWhitePrimaryBlack
    case extraWhiteExtraPrimaryBlack
    case blackPrimaryWhite
    case secondaryToTertiary
    case tertiaryToSecondary
    
    var gradient: Gradient {
        switch self {
        case .whitePrimaryBlack: return Gradient(colors: [.white, .primary, .black])
        case .extraWhitePrimaryBlack: return Gradient(colors: [.white, .white, .primary, .black])
        case .extraWhiteExtraPrimaryBlack: return Gradient(colors: [.white, .white, .primary, .primary, .black])
        case .blackPrimaryWhite: return Gradient(colors: [.black, .primary, .white])
        case .secondaryToTertiary: return Gradient(colors: [.secondary, .tertiary])
        case .tertiaryToSecondary: return Gradient(colors: [.tertiary, .secondary])
        }
    }
}
