//
//  ToastFancy.swift
//
//  Created by Saif Mukadam on 08/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import Foundation
import UIKit


public enum position {
    case top
    case bottom
    case mid
}

public class ToastFancyView {
    //let make = ToastFancy()
    
    var myview:UIView!
    var myText:String = ""
    var textColor:UIColor = .white
    var borderColor:UIColor = .black
    var backgroundColor:UIColor = .black
    var position:position = .bottom
    var durationTimeOut:Double = 1
    var borderWidth:CGFloat = 2
    var backgroundImagetoToast:UIImage!
    
    
    let toastLabel: UITextView = {
        let toastLabel = UITextView()
        toastLabel.font = .systemFont(ofSize: 15)
        //toastLabel.textColor = .white
        //toastLabel.backgroundColor = .black
        toastLabel.isEditable = false
        toastLabel.isSelectable = false
        toastLabel.textContainer.maximumNumberOfLines = 35
        toastLabel.textContainer.lineBreakMode = .byTruncatingTail
        toastLabel.translatesAutoresizingMaskIntoConstraints = true
        toastLabel.sizeToFit()
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        //toastLabel.text = "myText"
        toastLabel.layer.borderWidth = 1
        toastLabel.textAlignment = .center
        toastLabel.isScrollEnabled = false
        toastLabel.centerVertically()
        return toastLabel
    }()
    
    init(view:UIView,text:String,textColor:UIColor = .white,backgroundColor:UIColor = .gray,position:position = .bottom,borderColor:UIColor = .black,borderWidth:CGFloat = 1,durationTimeOut:Double,backgroundImagetoToast:UIImage) {
        self.myText = text
        self.myview = view
        self.textColor = textColor
        self.position = position
        self.borderWidth = borderWidth
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.durationTimeOut = durationTimeOut
        self.backgroundImagetoToast = backgroundImagetoToast
    }
    
    func toastDisplay() {
        toastLabel.text = myText
        toastLabel.textColor = textColor
        toastLabel.backgroundColor = backgroundColor
        toastLabel.layer.borderColor = borderColor.cgColor
        toastLabel.layer.borderWidth = borderWidth
        
        if self.backgroundImagetoToast.size != CGSize(width: 1, height: 1){
            
            toastLabel.backgroundColor = UIColor.init(patternImage:backgroundImagetoToast)
            
        }
        
        UIView.transition(with: myview, duration: 1, options: [.transitionCrossDissolve], animations: {
            self.myview.addSubview(self.toastLabel)
        }, completion: nil)
        
        toastLabel.centerVertically()
        contraint(position: position, view: myview)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTimeOut){
            UIView.transition(with: self.myview, duration: 1, options: [.transitionCrossDissolve], animations: {
                self.toastLabel.removeFromSuperview()
            }, completion: nil)
        }
    }
    
    func contraint(position:position =  .bottom,view:UIView){
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        if position == .top{
            NSLayoutConstraint.activate([
                toastLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 25),
                toastLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant:-25),
                toastLabel.topAnchor.constraint(equalTo:view.topAnchor,constant: 60)
            ])
        }else if position == .mid{
            NSLayoutConstraint.activate([
                toastLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 25),
                toastLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant:-25),
                toastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                toastLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }else{
            NSLayoutConstraint.activate([
                toastLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 25),
                toastLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant:-25),
                toastLabel.bottomAnchor.constraint(equalTo:view.bottomAnchor,constant: -60)
            ])
        }
    }
}


extension UITextView {
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: bounds.height)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(0, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}

public extension UIColor {
    func imagewithColor(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
