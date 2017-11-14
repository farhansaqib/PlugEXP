//
//  LoginButton.swift
//  PlugEXP
//
//  Created by admin on 11/14/17.
//  Copyright © 2017 brainplow. All rights reserved.
//

import UIKit
@IBDesignable
class LoginButton: UIButton {

    //TODO: add the gradient color
    override func awakeFromNib() {
        super.awakeFromNib()
        customizedView()
        
    }
    
    override func prepareForInterfaceBuilder() {
        customizedView()
    }
    
    func customizedView(){
        layer.cornerRadius = 5.0
    }

}
