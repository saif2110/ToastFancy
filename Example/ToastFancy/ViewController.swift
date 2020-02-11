//
//  ViewController.swift
//  ToastFancy
//
//  Created by saif2110 on 02/10/2020.
//  Copyright (c) 2020 saif2110. All rights reserved.
//

import UIKit
import ToastFancy

class ViewController: UIViewController {
    var Position:Int = 0
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        
        
        if sender.selectedSegmentIndex == 0 {
            Position = 0
        }else if sender.selectedSegmentIndex == 1 {
            Position = 1
        }else{
            Position = 2
        }
        
    }
    @IBAction func toastWithImage(_ sender: Any) {
        
        ToastFancy.show(view: self.view, text: "\n             \n \n", textColour: .blue, position: .bottom, backgroundImagetoToast: #imageLiteral(resourceName: "so"))
        
    }
    @IBAction func toast(_ sender: Any) {
        if Position == 0 {
            ToastFancy.show(view: view, text: "This is The Toast from ToastFancy 😀",backgroundColor: .purple,position: .top,borderColor: .lightGray,borderWidth: 1)
        }else if Position == 1 {
            ToastFancy.show(view: view, text: "This is The Toast from ToastFancy 😀",backgroundColor: .purple,position: .mid,borderColor: .lightGray,borderWidth: 1)
        }else{
            ToastFancy.show(view: view, text: "This is The Toast from ToastFancy 😀",backgroundColor: .purple,position: .bottom,borderColor: .lightGray,borderWidth: 1)
        }
        
    }
}

