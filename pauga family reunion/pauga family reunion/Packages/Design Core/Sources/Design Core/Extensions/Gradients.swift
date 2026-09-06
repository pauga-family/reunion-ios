//
//  Gradients.swift
//  Design Core
//
//  Created by Justin Pauga on 9/5/26.
//

import Foundation
import SwiftUI

public enum Gradients: String {
    case whitePrimaryBlack
    case extraWhitePrimaryBlack
    case extraWhiteExtraPrimaryBlack
    case blackPrimaryWhite
    case secondaryToTertiary
    case tertiaryToSecondary
    
    public var gradient: Gradient {
        switch self {
        case .whitePrimaryBlack: return Gradient(colors: [.white, .appPrimary, .black])
        case .extraWhitePrimaryBlack: return Gradient(colors: [.white, .white, .appPrimary, .black])
        case .extraWhiteExtraPrimaryBlack: return Gradient(colors: [.white, .white, .appPrimary, .appPrimary, .black])
        case .blackPrimaryWhite: return Gradient(colors: [.black, .primary, .white])
        case .secondaryToTertiary: return Gradient(colors: [.appSecondary, .appTertiary])
        case .tertiaryToSecondary: return Gradient(colors: [.appTertiary, .appSecondary])
        }
    }
}
