//
//  File.swift
//  Design Core
//
//  Created by Justin Pauga on 9/5/26.
//

import CoreText
import SwiftUI

enum FontRegistrar {
    nonisolated(unsafe) private static var didRegister = false
    
    static func registerFontsIfNeeded() {
        guard !didRegister else { return }
        didRegister = true
        let fontNames = ["Lato-Black",
                         "Lato-BlackItalic",
                         "Lato-Bold",
                         "Lato-BoldItalic",
                         "Lato-Hairline",
                         "Lato-HairlineItalic",
                         "Lato-Heavy",
                         "Lato-HeavyItalic",
                         "Lato-Italic",
                         "Lato-Light",
                         "Lato-LightItalic",
                         "Lato-Medium",
                         "Lato-MediumItalic",
                         "Lato-Regular",
                         "Lato-Semibold",
                         "Lato-SemiboldItalic",
                         "Lato-Thin",
                         "Lato-ThinItalic"
                        ]
        for name in fontNames {
            guard let url = Bundle.module.url(
                forResource: name,
                withExtension: "ttf") else {
                continue
            }
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
    }
}
