//
//  CornerRadius_Border_Gradient.swift
//  FishingBuddy
//
//  Created by Karan Bodar on 12/04/25.
//

import UIKit

// Apply GradientColor to UIView.

// Steps :-

// 1.Go to Identity Inspector.
// 2.Change class to GradientView.
// 3.Go to properties select the colors , start & end positions & ren the program.

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .black { didSet { updateGradient() } }
    @IBInspectable var endColor: UIColor = .white { didSet { updateGradient() } }
    @IBInspectable var startX: CGFloat = 0.5 { didSet { updateGradient() } }
    @IBInspectable var startY: CGFloat = 0.0 { didSet { updateGradient() } }
    @IBInspectable var endX: CGFloat = 0.5 { didSet { updateGradient() } }
    @IBInspectable var endY: CGFloat = 1.0 { didSet { updateGradient() } }
    
    private var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateGradient()
    }
    
    private func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startX, y: startY)
        gradientLayer.endPoint = CGPoint(x: endX, y: endY)
    }
}
// CornerRadius 1 - Use in Code.

// Apply cornerRadius to UIImage,Button,Lable,TextField.

// Steps :-

// 1.Create Outlet of the object that you want to apply Properties.

// Syntax : self.OutLet.roundCorners(corners: [.topLeft, .bottomRight], radius: 90)

//extension UIView {
//    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(
//            roundedRect: self.bounds,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius)
//        )
//
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = path.cgPath
//        self.layer.mask = maskLayer
//    }
//}



// CornerRadius 2 - Use in StoryBoard.

// Steps :-

// 1.Go to StoryBoard -> Properties & apply cornerRadius,BorderWidth & color.

// Apply cornerRadius , borderWidth & borderColor to UIImage,Button,Lable,TextField.

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
class CornerRadius_Border_Gradient: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
}
