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
        UIX3CustomViewController.Defaults.navigationBackTintColor = Config.Colors.textDark
        UIX3CustomViewController.Defaults.navigationBackBackgroundColor = UIColor.clear
        UIX3CustomViewController.Defaults.navigationBackRadius = 6.0
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Config.Colors.background
        appearance.shadowColor = UIColor.clear
        appearance.shadowImage = UIImage()
        let backItemAppearance = UIBarButtonItemAppearance()
        backItemAppearance.normal.titleTextAttributes = [.foregroundColor : Config.Colors.textDark]
        appearance.backButtonAppearance = backItemAppearance
        let image = Config.Images.iconChevronLeft?.withRenderingModeTemplate
        appearance.setBackIndicatorImage(image, transitionMaskImage: image)
        UINavigationBar.appearance().tintColor = Config.Colors.textDark
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
//
//
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)
//        if #available(iOS 15.0, *) {
//            let navigationBarAppearance = UINavigationBarAppearance()
//            navigationBarAppearance.configureWithDefaultBackground()
//            navigationBarAppearance.backgroundColor = Config.Colors.background
//            navigationBarAppearance.shadowColor = UIColor.clear
//            navigationBarAppearance.shadowImage = UIImage()
//            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
//            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
//            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
//        } else  {
//            UINavigationBar.appearance().backgroundColor = Config.Colors.background
//        }
//        UINavigationBar.appearance().tintColor = Config.Colors.textDark
//        UINavigationBar.appearance().backIndicatorImage = Config.Images.iconChevronLeft?.withRenderingModeTemplate
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = Config.Images.iconChevronLeft?.withRenderingModeTemplate
    }
// MARK: - ******* COLORS *******
    public struct Colors: CustomDefaultProtocol {
        public static func initialize() {
        }
        public struct Names {
            public static let colorTint = "colorTint"
            public static let colorControlActive = "colorControlActive"
            public static let colorControlInactive = "colorControlInactive"
            public static let colorBackground = "colorBackground"
            public static let colorBackgroundGray = "colorBackgroundGray"
            public static let colorTextDark = "colorTextDark"
            public static let colorTextDisabled = "colorTextDisabled"
            public static let colorBackgroundExcelent = "colorBackgroundExcelent"
            public static let colorForegroundExcelent = "colorForegroundExcelent"

            public static let colorBlue = "colorBlue"
            public static let colorGray = "colorGray"
            public static let colorOrange = "colorOrange"
            public static let colorYellow = "colorYellow"
            public static let colorDarkGray = "colorDarkGray"
        }
        public static let tint = UIColor(named: Config.Colors.Names.colorTint) ?? UIColor.clear
        public static let controlActive = UIColor(named: Config.Colors.Names.colorControlActive) ?? UIColor.clear
        public static let controlInactive = UIColor(named: Config.Colors.Names.colorControlInactive) ?? UIColor.clear
        public static let background = UIColor(named: Config.Colors.Names.colorBackground) ?? UIColor.clear
        public static let backgroundGray = UIColor(named: Config.Colors.Names.colorBackgroundGray) ?? UIColor.clear
        public static let textLight = UIColor(named: Config.Colors.Names.colorBackground) ?? UIColor.clear
        public static let textDark = UIColor(named: Config.Colors.Names.colorTextDark) ?? UIColor.clear
        public static let textDisabled = UIColor(named: Config.Colors.Names.colorTextDisabled) ?? UIColor.clear
        public static let backgroundExcelent = UIColor(named: Config.Colors.Names.colorBackgroundExcelent) ?? UIColor.clear
        public static let foregroundExcelent = UIColor(named: Config.Colors.Names.colorForegroundExcelent) ?? UIColor.clear

        public static let blue = UIColor(named: Config.Colors.Names.colorBlue) ?? UIColor.clear
        public static let gray = UIColor(named: Config.Colors.Names.colorGray) ?? UIColor.clear
        public static let darkGray = UIColor(named: Config.Colors.Names.colorDarkGray) ?? UIColor.clear
        public static let orange = UIColor(named: Config.Colors.Names.colorOrange) ?? UIColor.clear
        public static let yellow = UIColor(named: Config.Colors.Names.colorYellow) ?? UIColor.clear
    }
// MARK: - ******* FONTS *******
    public struct Fonts: CustomDefaultProtocol {
        public enum Extension: String {
            case ttf = "ttf"
            case otf = "otf"
        }
        private static let SFProDisplayRegular = "SFProDisplay-Regular"
        private static let SFProDisplayRegularItalic = "SFProDisplay-RegularItalic"
        private static let SFProDisplayUltralight = "SFProDisplay-Ultralight"
        private static let SFProDisplayUltralightItalic = "SFProDisplay-UltralightItalic"
        private static let SFProDisplayThin = "SFProDisplay-Thin"
        private static let SFProDisplayThinItalic = "SFProDisplay-ThinItalic"
        private static let SFProDisplayLight = "SFProDisplay-Light"
        private static let SFProDisplayLightItalic = "SFProDisplay-LightItalic"
        private static let SFProDisplayMedium = "SFProDisplay-Medium"
        private static let SFProDisplayMediumItalic = "SFProDisplay-MediumItalic"
        private static let SFProDisplaySemibold = "SFProDisplay-Semibold"
        private static let SFProDisplaySemiboldItalic = "SFProDisplay-SemiboldItalic"
        private static let SFProDisplayBold = "SFProDisplay-Bold"
        private static let SFProDisplayBoldItalic = "SFProDisplay-BoldItalic"
        private static let SFProDisplayHeavy = "SFProDisplay-Heavy"
        private static let SFProDisplayHeavyItalic = "SFProDisplay-HeavyItalic"
        private static let SFProDisplayBlack = "SFProDisplay-Black"
        private static let SFProDisplayBlackItalic = "SFProDisplay-BlackItalic"
        
        public static func initialize() {

        }
        
        static public func loadFont(_ fontName: String, withExtension: Extension, isPrintReport: Bool = false) -> CGFont? {
            if let fontUrl = Bundle(for: UserFonts.self).url(forResource: fontName, withExtension: withExtension.rawValue),
               let dataProvider = CGDataProvider(url: fontUrl as CFURL),
               let newFont = CGFont(dataProvider) {
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(newFont, &error) {
                    if isPrintReport { print("\("Error loading Font".localized): \(fontName).\(withExtension)") }
                    return nil
                } else {
                    if isPrintReport { print("\("Loaded font".localized): \(fontName).\(withExtension)") }
                    return newFont
                }
            } else {
                assertionFailure("\("Error loading Font".localized): \(fontName).\(withExtension)")
                return nil
            }
        }
        
        public static func SFProDisplayBlack(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayBlack, size: size)
        }
        public static func SFProDisplayBlackItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayBlackItalic, size: size)
        }
        public static func SFProDisplayBold(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayBold, size: size)
        }
        public static func SFProDisplayBoldItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayBoldItalic, size: size)
        }
        public static func SFProDisplayHeavy(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayHeavy, size: size)
        }
        public static func SFProDisplayHeavyItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayHeavyItalic, size: size)
        }
        public static func SFProDisplayLight(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayLight, size: size)
        }
        public static func SFProDisplayLightItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayLightItalic, size: size)
        }
        public static func SFProDisplayMedium(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayMedium, size: size)
        }
        public static func SFProDisplayMediumItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayMediumItalic, size: size)
        }
        public static func SFProDisplayRegular(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayRegular, size: size)
        }
        public static func SFProDisplayRegularItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayRegularItalic, size: size)
        }
        public static func SFProDisplaySemibold(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplaySemibold, size: size)
        }
        public static func SFProDisplaySemiboldItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplaySemiboldItalic, size: size)
        }
        public static func SFProDisplayThin(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayThin, size: size)
        }
        public static func SFProDisplayThinItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayThinItalic, size: size)
        }
        public static func SFProDisplayUltralight(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayUltralight, size: size)
        }
        public static func SFProDisplayUltralightItalic(size: CGFloat) -> UIFont? {
            return UIFont(name: SFProDisplayUltralightItalic, size: size)
        }
    }
    
// MARK: - ******* IMAGES *******
    public struct Images: CustomDefaultProtocol {
        public static func initialize() {
            UIX3CustomControl.Defaults.Color.background = Config.Colors.background
            
        }
        public static let IMAGE_FUNNY = "imageFunny"
        
        public static let IMAGE_ICONCHEVRONBACK = "iconChevronBack"
        public static let IMAGE_ICONCHEVRONRIGHT = "iconChevronRight"
        public static let IMAGE_ICONCHEVRONLEFT = "iconChevronLeft"
        public static let IMAGE_ICONCHEVRONUP = "iconChevronUp"
        
        public static let IMAGE_ICONCLOSESQUARE = "iconCloseSquare"
        public static let IMAGE_ICONEMOJIHAPPY = "iconEmojiHappy"
        public static let IMAGE_ICONSTAR = "iconStar"
        public static let IMAGE_ICONTICKSQUARE = "iconTickSquare"
        public static let IMAGE_ICONPLUS = "iconPlus"

        public static let IMAGE_ICONCANCEL = "iconCancel"
        public static let IMAGE_ICONCARD = "iconCard"
        public static let IMAGE_ICONCATEGORY = "iconCategory"
        public static let IMAGE_ICONCHECKED = "iconChecked"
        public static let IMAGE_ICONCHEVRONDOWN = "iconChevronDown"
        public static let IMAGE_ICONCIRCLE = "iconCircle"
        public static let IMAGE_ICONFAVORITEOFF = "iconFavoriteOff"
        public static let IMAGE_ICONFAVORITEON = "iconFavoriteOn"
        public static let IMAGE_ICONFILTER = "iconFilter"
        public static let IMAGE_ICONLOCATION = "iconLocation"
        public static let IMAGE_ICONSEARCH = "iconSearch"
        public static let IMAGE_ICONTRASHBIN = "iconTrashBin"
        public static let IMAGE_ICONUSER = "iconUser"

        public static var imageFunny: UIImage? { get { return UIImage(named: IMAGE_FUNNY) } }
        
        public static var iconChevronBack: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONBACK) } }
        public static var iconChevronRight: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONRIGHT) } }
        public static var iconChevronLeft: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONLEFT) } }
        public static var iconChevronUp: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONUP) } }
        public static var iconCloseSquare: UIImage? { get { return UIImage(named: IMAGE_ICONSTAR) } }
        public static var iconEmojiHappy: UIImage? { get { return UIImage(named: IMAGE_ICONEMOJIHAPPY) } }
        public static var iconStar: UIImage? { get { return UIImage(named: IMAGE_ICONSTAR) } }
        public static var iconTickSquare: UIImage? { get { return UIImage(named: IMAGE_ICONTICKSQUARE) } }
        public static var iconPlus: UIImage? { get { return UIImage(named: IMAGE_ICONPLUS) } }
        
        public static var iconCancel: UIImage? { get { return UIImage(named: IMAGE_ICONCANCEL) } }
        public static var iconCard: UIImage? { get { return UIImage(named: IMAGE_ICONCARD) } }
        public static var iconCategory: UIImage? { get { return UIImage(named: IMAGE_ICONCATEGORY) } }
        public static var iconChecked: UIImage? { get { return UIImage(named: IMAGE_ICONCHECKED) } }
        public static var iconChevronDown: UIImage? { get { return UIImage(named: IMAGE_ICONCHEVRONDOWN) } }
        public static var iconCircle: UIImage? { get { return UIImage(named: IMAGE_ICONCIRCLE) } }
        public static var iconFavoriteOff: UIImage? { get { return UIImage(named: IMAGE_ICONFAVORITEOFF) } }
        public static var iconFavoriteOn: UIImage? { get { return UIImage(named: IMAGE_ICONFAVORITEON) } }
        public static var iconFilter: UIImage? { get { return UIImage(named: IMAGE_ICONFILTER) } }
        public static var iconLocation: UIImage? { get { return UIImage(named: IMAGE_ICONLOCATION) } }
        public static var iconSearch: UIImage? { get { return UIImage(named: IMAGE_ICONSEARCH) } }
        public static var iconTrashBin: UIImage? { get { return UIImage(named: IMAGE_ICONTRASHBIN) } }
        public static var iconUser: UIImage? { get { return UIImage(named: IMAGE_ICONUSER) } }
    }
// MARK: - ******* ALERT VIEW *******
}
