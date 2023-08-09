//
//  SwiftUIColor+Extension.swift

// So you can set custom Colors

// Use Case:
//          Rectangle()
//              .Background(Color.Clear)

import SwiftUI

extension Color {
    
    static let White = Color(hex: "#FFFFF")
    static let AKPSIBlue = Color(hex: "#094B81")
    static let Monochrome = Color(hex: "#DFDFDF")
    static let MonochromeLight = Color(hex: "#F6F6F6")
    
    init(hex: String?, placeholderColor: UIColor = .clear) {
        guard let hex = hex else {
            self.init(placeholderColor)
            return
        }
        let trimmedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        // FFF, FFFF, FFFFFF, FFFFFFFF (rgb, argb)
        // For Wrong length Hex, the placeholder color will come into practice.
        guard [3, 4, 6, 8].contains(where: { $0 == trimmedHex.count }) else {
            self.init(placeholderColor)
            return
        }
        var int: UInt64 = 0
        Scanner(string: trimmedHex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch trimmedHex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

