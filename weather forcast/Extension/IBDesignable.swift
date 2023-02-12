//
//  IBDesignable.swift
//  APUtilities-iOS
//
//  Created by Naphat Sottiyaphai on 4/8/2565 BE.
//

import Foundation
import UIKit

@IBDesignable extension UIView {

    @IBInspectable public var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = false
            self.clipsToBounds = true
        }

        get { return self.layer.cornerRadius }
    }

    @IBInspectable public var borderWidth: CGFloat {
        set { self.layer.borderWidth = newValue }
        get { return self.layer.borderWidth }
    }

    @IBInspectable public var borderColor: UIColor {
        set { self.layer.borderColor = newValue.cgColor }
        get { return UIColor(cgColor: self.layer.borderColor!) }
    }

    @IBInspectable public var shadowColor: UIColor {
        set { self.layer.shadowColor = newValue.cgColor }
        get { return UIColor(cgColor: self.layer.shadowColor!) }
    }

    @IBInspectable public var shadowOffset: CGSize {
        set { self.layer.shadowOffset = newValue }
        get { return self.layer.shadowOffset }
    }

    @IBInspectable public var shadowOpacity: Float {
        set {
            self.layer.shadowOpacity = newValue
            self.layer.masksToBounds = false
        }

        get { return self.layer.shadowOpacity }
    }

    @IBInspectable public var shadowRadius: CGFloat {
        set {
            self.layer.shadowRadius = newValue
            self.layer.masksToBounds = false
        }

        get { return self.layer.shadowRadius }
    }

    @available(iOS 11.0, *)
    @IBInspectable var topLeft: Bool {
        get { return layer.maskedCorners.contains(.layerMinXMinYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMinYCorner)
            }
        }
    }

    @available(iOS 11.0, *)
    @IBInspectable var topRight: Bool {
        get { return layer.maskedCorners.contains(.layerMaxXMinYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMinYCorner)
            }
        }
    }

    @available(iOS 11.0, *)
    @IBInspectable var bottomLeft: Bool {
        get { return layer.maskedCorners.contains(.layerMinXMaxYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMaxYCorner)
            }
        }
    }

    @available(iOS 11.0, *)
    @IBInspectable var bottomRight: Bool {
        get { return layer.maskedCorners.contains(.layerMaxXMaxYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMaxYCorner)
            }
        }
    }
}

@IBDesignable extension UITextField {
    @IBInspectable public var placeholderColor: UIColor {
        set {
            self.attributedPlaceholder = NSAttributedString(
                string: self.placeholder ?? "",
                attributes: [NSAttributedString.Key.foregroundColor: newValue]
            )
        }

        get { return .lightGray }
    }
}
