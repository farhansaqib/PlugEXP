//
//  LoginTextField.swift
//  PlugEXP
//
//  Created by admin on 11/14/17.
//  Copyright © 2017 brainplow. All rights reserved.
//

import UIKit


@IBDesignable
class LoginTextField: UITextField {

    override func prepareForInterfaceBuilder() {
        customizedView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        customizedView()
    }
    
    func customizedView(){
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        if let p  = placeholder{
            let place = NSAttributedString(string: p, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}
