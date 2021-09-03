
import UIKit

struct AppFontName {
    static let regular = "BinggraeSamanco"
    static let bold = "BinggraeSamanco-Bold"
}

extension UIFont{
    
    @objc class func binggraeSamancoRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }

    @objc class func binggraeSamancoBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
    
  
}


