//
//  GradientView.swift
//  GeneralSwift
//
//  Created by SaFaa Mohamed on 06/03/2022.
//

import UIKit
@IBDesignable
open class GradientView: UIView {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    open override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    open func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    open func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    open func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
    @IBInspectable open var isShadow: Bool = true {
        didSet {
            self.updateProperties()
        }
    }
    
    
    @IBInspectable open var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.updateProperties()
        }
    }
    @IBInspectable open var borderColor: UIColor = .white {
        didSet {
            self.updateProperties()
        }
    }
    @IBInspectable open var borderWidth: CGFloat = 1 {
        didSet {
            self.updateProperties()
        }
    }
    
    /// The shadow color of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable open var shadowColor: UIColor = UIColor.black {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow offset of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable open var shadowOffset: CGSize = CGSize(width: 2, height: 2) {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow radius of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable open var shadowRadius: CGFloat = 2.0 {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow opacity of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable open var shadowOpacity: Float = 0.1 {
        didSet {
            self.updateProperties()
        }
    }
    
    /**
     Masks the layer to it's bounds and updates the layer properties and shadow path.
     */
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = false
        
        self.updateProperties()
        self.updateShadowPath()
    }
    
    /**
     Updates all layer properties according to the public properties of the `ShadowView`.
     */
    open func updateProperties() {
        if self.isShadow {
            self.layer.cornerRadius = self.cornerRadius
            self.layer.shadowColor = self.shadowColor.cgColor
            self.layer.shadowOffset = self.shadowOffset
            self.layer.shadowRadius = self.shadowRadius
            self.layer.shadowOpacity = self.shadowOpacity
        }
        
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
    }
    
    /**
     Updates the bezier path of the shadow to be the same as the layer's bounds, taking the layer's corner radius into account.
     */
    open func updateShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    /**
     Updates the shadow path everytime the views frame changes.
     */
 
    
}
