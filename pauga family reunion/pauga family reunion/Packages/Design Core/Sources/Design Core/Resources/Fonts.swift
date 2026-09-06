//
//  Fonts.swift
//  Design Core
//
//  Created by Justin Pauga on 9/5/26.
//

import Foundation
import SwiftUI

public enum LatoFont {
    case thinItalic, thin
    case semiboldItalic, semibold
    case regular
    case mediumItalic, medium
    case lightItalic, light
    case heavyItalic, heavy
    case hairlineItalic, hairline
    case boldItalic, bold
    case blackItalic, black
    
    public var name: String {
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
    
    public func font(size: CGFloat) -> SwiftUI.Font {
        FontRegistrar.registerFontsIfNeeded()
        return SwiftUI.Font.custom(name, size: size)
    }
    
    public func uiFont(size: CGFloat) -> UIFont? {
        FontRegistrar.registerFontsIfNeeded()
        return UIFont.init(name: name, size: size)
    }
}
