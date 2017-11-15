//
//  ExpensionCell.swift
//  PlugEXP
//
//  Created by admin on 11/14/17.
//  Copyright © 2017 brainplow. All rights reserved.
//

import Foundation
import UIKit

class ExpansionCell : UITableViewCell {
    @IBOutlet weak var cancelletionPrice: UILabel!
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet weak var factsheetBtn: UIButton!
    @IBOutlet weak var backgroundCardView: UIView!
    
    func updateData(data: ProductsData, index: Int){
        cancelletionPrice.text = data.productDetails[index].cancellectionPrice
        termsBtn.setTitle("Terms", for: .normal)
        factsheetBtn.setTitle("Fact Sheet", for: .normal)
        self.selectionStyle = .none
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
