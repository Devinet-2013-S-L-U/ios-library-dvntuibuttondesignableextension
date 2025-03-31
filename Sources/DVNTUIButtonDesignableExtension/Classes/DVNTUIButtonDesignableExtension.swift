//
//  DVNTUIButtonDesignableExtension.swift
//
//  Created by Raúl Vidal Muiños on 21/2/18.
//

import UIKit
import ObjectiveC

private var gradientLayerKey: UInt8 = 0
private var gradientStartColorKey: UInt8 = 0
private var gradientEndColorKey: UInt8 = 0

@IBDesignable extension UIButton {
        
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { layer.borderWidth }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            // Actualiza el gradiente si existe
            gradientLayer?.cornerRadius = newValue
        }
        get { layer.cornerRadius }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let color = newValue else { return }
            layer.borderColor = color.cgColor
        }
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
    }
    
    // MARK: - Sombras
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let cgColor = layer.shadowColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    // MARK: - Content Insets
    @IBInspectable var contentInsetTop: CGFloat {
        get { contentEdgeInsets.top }
        set {
            var insets = contentEdgeInsets
            insets.top = newValue
            contentEdgeInsets = insets
        }
    }
    
    @IBInspectable var contentInsetLeft: CGFloat {
        get { contentEdgeInsets.left }
        set {
            var insets = contentEdgeInsets
            insets.left = newValue
            contentEdgeInsets = insets
        }
    }
    
    @IBInspectable var contentInsetBottom: CGFloat {
        get { contentEdgeInsets.bottom }
        set {
            var insets = contentEdgeInsets
            insets.bottom = newValue
            contentEdgeInsets = insets
        }
    }
    
    @IBInspectable var contentInsetRight: CGFloat {
        get { contentEdgeInsets.right }
        set {
            var insets = contentEdgeInsets
            insets.right = newValue
            contentEdgeInsets = insets
        }
    }
    
    // MARK: - Gradiente de fondo
    
    private var gradientLayer: CAGradientLayer? {
        get { objc_getAssociatedObject(self, &gradientLayerKey) as? CAGradientLayer }
        set { objc_setAssociatedObject(self, &gradientLayerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    @IBInspectable var gradientStartColor: UIColor? {
        get { objc_getAssociatedObject(self, &gradientStartColorKey) as? UIColor }
        set {
            objc_setAssociatedObject(self, &gradientStartColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateGradientLayer()
        }
    }
    
    @IBInspectable var gradientEndColor: UIColor? {
        get { objc_getAssociatedObject(self, &gradientEndColorKey) as? UIColor }
        set {
            objc_setAssociatedObject(self, &gradientEndColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateGradientLayer()
        }
    }
    
    private func updateGradientLayer() {
        guard let startColor = gradientStartColor, let endColor = gradientEndColor else {
            // Si no se han establecido ambos colores, se elimina el gradiente.
            gradientLayer?.removeFromSuperlayer()
            gradientLayer = nil
            return
        }
        
        if let gradLayer = gradientLayer {
            gradLayer.frame = bounds
            gradLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradLayer.cornerRadius = cornerRadius
        } else {
            let gradLayer = CAGradientLayer()
            gradLayer.frame = bounds
            gradLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradLayer.cornerRadius = cornerRadius
            layer.insertSublayer(gradLayer, at: 0)
            gradientLayer = gradLayer
        }
    }
    
    // Nota: Para que el gradiente se ajuste al cambiar el tamaño del botón, es recomendable llamar a updateGradientLayer() desde layoutSubviews.
}
