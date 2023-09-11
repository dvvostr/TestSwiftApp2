import UIKit
import x3Core
import x3UI

// MARK: - ******* CONFIG *******
public let DEBUG_PRINT = true
public let DEBUG_URL = "https://dvostr.ru/data/execute"

public protocol CustomDefaultProtocol {
    static func initialize()
}


public struct Config: CustomDefaultProtocol {
    public static func initialize() {
        Config.Colors.initialize()
        Config.Fonts.initialize()
        Config.Images.initialize()
        UIX3CustomViewController.Defaults.navigationBackImage = Config.Images.iconChevronBack
        UIX3CustomViewController.Defaults.navigationBackTintColor = Config.Colors.backgroundLight
        UIX3CustomViewController.Defaults.navigationBackBackgroundColor = Config.Colors.blue
        UIX3CustomViewController.Defaults.navigationBackRadius = 6.0

    }
// MARK: - ******* COLORS *******
    public struct Colors: CustomDefaultProtocol {
        public static func initialize() {
        }
        public struct Names {
            public static let colorBackgroundGray = "colorBackgroundGray"
            public static let colorBackgroundLight = "colorBackgroundLight"
            public static let colorBlue = "colorBlue"
            public static let colorGray = "colorGray"
            public static let colorOrange = "colorOrange"
            public static let colorYellow = "colorYellow"
            public static let colorDarkGray = "colorDarkGray"
        }
        public static let backgroundGray = UIColor(named: Config.Colors.Names.colorBackgroundGray) ?? UIColor.clear
        public static let backgroundLight = UIColor(named: Config.Colors.Names.colorBackgroundLight) ?? UIColor.clear
        public static let blue = UIColor(named: Config.Colors.Names.colorBlue) ?? UIColor.clear
        public static let gray = UIColor(named: Config.Colors.Names.colorGray) ?? UIColor.clear
        public static let darkGray = UIColor(named: Config.Colors.Names.colorDarkGray) ?? UIColor.clear
        public static let orange = UIColor(named: Config.Colors.Names.colorOrange) ?? UIColor.clear
        public static let yellow = UIColor(named: Config.Colors.Names.colorYellow) ?? UIColor.clear
        public static let tint = UIColor(named: Config.Colors.Names.colorOrange) ?? UIColor.clear
    }
// MARK: - ******* FONTS *******
    public struct Fonts: CustomDefaultProtocol {
        private static let FONT_SFPRODISPLAY_BLACK_ITALIC = "SFPRODISPLAYBLACKITALIC"
        private static let FONT_SFPRODISPLAY_BOLD = "SFPRODISPLAYBOLD"
        private static let FONT_SFPRODISPLAY_HEAVYI_TALIC = "SFPRODISPLAYHEAVYITALIC"
        private static let FONT_SFPRODISPLAY_LIGHT_ITALIC = "SFPRODISPLAYLIGHTITALIC"
        private static let FONT_SFPRODISPLAY_MEDIUM = "SFPRODISPLAYMEDIUM"
        private static let FONT_SFPRODISPLAY_REGULAR = "SFPRODISPLAYREGULAR"
        private static let FONT_SFPRODISPLAY_SEMIBOLD_ITALIC = "SFPRODISPLAYSEMIBOLDITALIC"
        private static let FONT_SFPRODISPLAY_THIN_ITALIC = "SFPRODISPLAYTHINITALIC"
        private static let FONT_SFPRODISPLAY_ULTRALIGHT_ITALIC = "SFPRODISPLAYULTRALIGHTITALIC"

        
        public static func initialize() {
        }
        public static func SFProDisplayBlackItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_BLACK_ITALIC, size: size)
        }
        public static func SFProDisplayBold(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_BOLD, size: size)
        }
        public static func SFProDisplayHeavyItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_HEAVYI_TALIC, size: size)
        }
        public static func SFProDisplayLightItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_LIGHT_ITALIC, size: size)
        }
        public static func SFProDisplayMedium(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_MEDIUM, size: size)
        }
        public static func SFProDisplayRegular(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_REGULAR, size: size)
        }
        public static func SFProDisplaySemiBoldItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_SEMIBOLD_ITALIC, size: size)
        }
        public static func SFProDisplayThinItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_THIN_ITALIC, size: size)
        }
        public static func SFProDisplayUltraLightItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: FONT_SFPRODISPLAY_ULTRALIGHT_ITALIC, size: size)
        }
    }
    
// MARK: - ******* IMAGES *******
    public struct Images: CustomDefaultProtocol {
        public static func initialize() {
            UINavigationBar.appearance().backIndicatorImage = Config.Images.iconChevronBack?.withRenderingOriginal
            UINavigationBar.appearance().backIndicatorTransitionMaskImage = Config.Images.iconChevronBack?.withRenderingOriginal
            
            UIX3CustomControl.Defaults.Color.background = Config.Colors.backgroundLight
            
        }
        
        public static let IMAGE_ICONCANCEL = "iconCancel"
        public static let IMAGE_ICONCARD = "iconCard"
        public static let IMAGE_ICONCATEGORY = "iconCategory"
        public static let IMAGE_ICONCHECKED = "iconChecked"
        public static let IMAGE_ICONCHEVRONBACK = "iconChevronBack"
        public static let IMAGE_ICONCHEVRONDOWN = "iconChevronDown"
        public static let IMAGE_ICONCIRCLE = "iconCircle"
        public static let IMAGE_ICONFAVORITEOFF = "iconFavoriteOff"
        public static let IMAGE_ICONFAVORITEON = "iconFavoriteOn"
        public static let IMAGE_ICONFILTER = "iconFilter"
        public static let IMAGE_ICONLOCATION = "iconLocation"
        public static let IMAGE_ICONSEARCH = "iconSearch"
        public static let IMAGE_ICONTRASHBIN = "iconTrashBin"
        public static let IMAGE_ICONSTAR = "iconStar"
        public static let IMAGE_ICONUSER = "iconUser"

        public static var iconCancel: UIImage? { get { return UIImage(named: IMAGE_ICONCANCEL) } }
        public static var iconCard: UIImage? { get { return UIImage(named: IMAGE_ICONCARD) } }
        public static var iconCategory: UIImage? { get { return UIImage(named: IMAGE_ICONCATEGORY) } }
        public static var iconChecked: UIImage? { get { return UIImage(named: IMAGE_ICONCHECKED) } }
        public static var iconChevronBack: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONBACK) } }
        public static var iconChevronDown: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONDOWN) } }
        public static var iconCircle: UIImage? { get { return UIImage(named: IMAGE_ICONCIRCLE) } }
        public static var iconFavoriteOff: UIImage? { get { return UIImage(named: IMAGE_ICONFAVORITEOFF) } }
        public static var iconFavoriteOn: UIImage? { get { return UIImage(named: IMAGE_ICONFAVORITEON) } }
        public static var iconFilter: UIImage? { get { return UIImage(named: IMAGE_ICONFILTER) } }
        public static var iconLocation: UIImage? { get { return UIImage(named: IMAGE_ICONLOCATION) } }
        public static var iconSearch: UIImage? { get { return UIImage(named: IMAGE_ICONSEARCH) } }
        public static var iconTrashBin: UIImage? { get { return UIImage(named: IMAGE_ICONTRASHBIN) } }
        public static var iconStar: UIImage? { get { return UIImage(named: IMAGE_ICONSTAR) } }
        public static var iconUser: UIImage? { get { return UIImage(named: IMAGE_ICONUSER) } }
    }
// MARK: - ******* ALERT VIEW *******
}
