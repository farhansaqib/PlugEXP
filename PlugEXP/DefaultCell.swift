//
//  DefaultCell.swift
//  PlugEXP
//
//  Created by admin on 11/14/17.
//  Copyright © 2017 brainplow. All rights reserved.
//
import Foundation
import UIKit

class DefaultCell : UITableViewCell {
    
    
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var discription: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var backgroundCardView: UIView!
    
    
    
    func updateView(data: ProductsData){
        productImage.image = UIImage(named: data.imagename)
        price.text = data.price
        productName.text = data.productName
        discription.text = data.description
        selectionStyle = .none
        
        backgroundCardView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        backgroundCardView.layer.cornerRadius = 3.0
        //backgroundCardView.layer.shadowPath = UIBezierPath(rect: contentView.bounds).cgPath
        backgroundCardView.layer.masksToBounds = false
        backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundCardView.layer.shadowOpacity = 0.8
        
        
        
        
        
        
        
    }
    
    
    
}
