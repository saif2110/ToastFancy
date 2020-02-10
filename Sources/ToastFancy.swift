//
//  ToastFancy.swift
//
//  Created by Saif Mukadam on 09/02/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import Foundation
import UIKit


public class ToastFancy {
    public static func show(view:UIView,text:String,textColour:UIColor = .white,backgroundColor:UIColor = .gray,position:position = .bottom,borderColor:UIColor = .black,borderWidth:CGFloat = 0.0,durationTimeOut:Double = 2,backgroundImagetoToast:UIImage = UIColor.orange.imagewithColor(CGSize(width: 1, height: 1))){
        
        let toast = ToastFancyView(view: view, text: text, textColor: textColour, backgroundColor: backgroundColor, position: position, borderColor: borderColor, borderWidth: borderWidth, durationTimeOut: durationTimeOut, backgroundImagetoToast: backgroundImagetoToast)
        
        //print(backgroundImagetoToast)
        
        toast.toastDisplay()
    }
}

