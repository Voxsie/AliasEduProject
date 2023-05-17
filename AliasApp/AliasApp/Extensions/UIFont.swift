//
//  UIFont.swift
//  AliasApp
//
//  Created by Илья Желтиков on 16.05.2023.
//

import Foundation
import UIKit

enum InterFontTypes: String {
    case regular = "Regular"
    case medium = "Regular_Medium"
    case semibold = "Regular_SemiBold"
    case bold = "Regular_Bold"
}

enum TTCommonsTypes: String {
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case demiBold = "DemiBold"
    case demiBoldItalic = "DemiBoldItalic"
    case extraBold = "ExtraBold"
    case extraBoldItalic = "ExtraBoldItalic"
    case extraLight = "ExtraLight"
    case extraLightItalic = "ExtraLightItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case thinItalic = "ThinItalic"
    case thin = "Thin"
    
}


extension UIFont {
    
    class func monoton(size: CGFloat) -> UIFont {
        UIFont.init(name: "Monoton-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func inter(type: InterFontTypes, size: CGFloat) -> UIFont {
        UIFont.init(name: "Inter-\(type.rawValue)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func TTCommons(type: TTCommonsTypes, size: CGFloat) -> UIFont {
        UIFont.init(name: "TTCommons-\(type.rawValue)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func TTCommonsBlack(size: CGFloat) -> UIFont {
        return UIFont.init(name: "TTCommonsProExp-Blk", size: size) ?? UIFont.boldSystemFont(ofSize: size + 1)
     }
    
}
