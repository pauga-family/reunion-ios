//
//  Fonts.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation
import SwiftUI

enum LatoFont {
    case thinItalic, thin
    case semiboldItalic, semibold
    case regular
    case mediumItalic, medium
    case lightItalic, light
    case heavyItalic, heavy
    case hairlineItalic, hairline
    case boldItalic, bold
    case blackItalic, black
    
    var name: String {
        switch self {
        case .black: return "Lato-Black"
        case .blackItalic: return "Lato-BlackItalic"
        case .bold: return "Lato-Bold"
        case .boldItalic: return "Lato-BoldItalic"
        case .hairline: return "Lato-Hairline"
        case .hairlineItalic: return "Lato-HairlineItalic"
        case .heavy: return "Lato-Heavy"
        case .heavyItalic: return "Lato-HeavyItalic"
        case .light: return "Lato-Light"
        case .lightItalic: return "Lato-LightItalic"
        case .medium: return "Lato-Medium"
        case .mediumItalic: return "Lato-MediumItalic"
        case .regular: return "Lato-Regular"
        case .semibold: return "Lato-Semibold"
        case .semiboldItalic: return "Lato-SemiboldItalic"
        case .thin: return "Lato-Thin"
        case .thinItalic: return "Lato-ThinItalic"
        }
    }
    
    func font(size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(name, size: size)
    }
    
    func uiFont(size: CGFloat) -> UIFont? {
        UIFont.init(name: name, size: size)
    }
}

