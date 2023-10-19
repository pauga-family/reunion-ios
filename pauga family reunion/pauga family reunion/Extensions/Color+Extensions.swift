//
//  Color+Extensions.swift
//  pauga family reunion
//
//  Created by Justin Pauga on 10/18/23.
//

import Foundation
import SwiftUI

extension Color {
    static var primary: Color {
        Color(hex: "264089")
    }
    
    static var onColor: Color {
        .white
    }
    
    static var onWhite: Color {
        Color(hex: "#454648")
    }
    
    static var primaryDark: Color {
        Color(hex: "192A56")
    }
    
    static var secondary: Color {
        Color(hex: "ee4481")
    }
    
    static var secondaryDark: Color {
        Color(hex: "FF7F50")
    }
    
    static var tertiary: Color {
        Color(hex: " faa85d")
    }
    
    static var tertiaryDark: Color {
        Color(hex: "EAEAEA")
    }
    
    static var quaternary: Color {
        Color(hex: "333333")
    }
    
    static var quaternaryDark: Color {
        Color(hex: "FFFFFF")
    }
    
    init(hex string: String) {
            var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if string.hasPrefix("#") {
                _ = string.removeFirst()
            }

            // Double the last value if incomplete hex
            if !string.count.isMultiple(of: 2), let last = string.last {
                string.append(last)
            }

            // Fix invalid values
            if string.count > 8 {
                string = String(string.prefix(8))
            }

            // Scanner creation
            let scanner = Scanner(string: string)

            var color: UInt64 = 0
            scanner.scanHexInt64(&color)

            if string.count == 2 {
                let mask = 0xFF

                let g = Int(color) & mask

                let gray = Double(g) / 255.0

                self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

            } else if string.count == 4 {
                let mask = 0x00FF

                let g = Int(color >> 8) & mask
                let a = Int(color) & mask

                let gray = Double(g) / 255.0
                let alpha = Double(a) / 255.0

                self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

            } else if string.count == 6 {
                let mask = 0x0000FF
                let r = Int(color >> 16) & mask
                let g = Int(color >> 8) & mask
                let b = Int(color) & mask

                let red = Double(r) / 255.0
                let green = Double(g) / 255.0
                let blue = Double(b) / 255.0

                self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

            } else if string.count == 8 {
                let mask = 0x000000FF
                let r = Int(color >> 24) & mask
                let g = Int(color >> 16) & mask
                let b = Int(color >> 8) & mask
                let a = Int(color) & mask

                let red = Double(r) / 255.0
                let green = Double(g) / 255.0
                let blue = Double(b) / 255.0
                let alpha = Double(a) / 255.0

                self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

            } else {
                self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
            }
        }
}
