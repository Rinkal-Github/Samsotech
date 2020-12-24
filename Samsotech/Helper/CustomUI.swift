//
//  CustomUI.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import Foundation
import UIKit

@IBDesignable
class CustomSerchBar: UITextField {
    var cornnerRadius : CGFloat = 5
    var shadowOfSetWidth : CGFloat = 0
    var shadowOfSetHeight : CGFloat = 1
    
    var shadowColour : UIColor = UIColor.lightGray
    var shadowOpacity : CGFloat = 0.5
    
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
            
            layer.shadowColor = shadowColour.cgColor
            layer.shadowOffset = CGSize(width: shadowOfSetWidth, height: shadowOfSetHeight)
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornnerRadius)
            layer.shadowPath = shadowPath.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable var Corner: CGFloat = 0 {
        didSet {
            
            layer.cornerRadius = Corner
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
extension UIView{
    
    func activityStartAnimating() {
        
        
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        backgroundView.tag = 475647
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 120, height: 120))
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        activityIndicator.style = UIActivityIndicatorView.Style.white
        activityIndicator.center = backgroundView.center
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        let currentWindow: UIWindow? = UIApplication.shared.keyWindow
        currentWindow?.addSubview(backgroundView)
        //self.addSubview(backgroundView)
    }
    func activityStopAnimating() {
        // let window = UIWindow(frame: UIScreen.main.bounds)
        if let background = UIApplication.shared.keyWindow!.viewWithTag(475647){
            background.removeFromSuperview()
            background.isHidden = true
            
            
        }
        self.isUserInteractionEnabled = true
    }
}
func showAlert(Message:String, controller: UIViewController) {
    let alert = UIAlertController(title: "Message", message: Message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    controller.present(alert, animated: true, completion: nil)
}
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
