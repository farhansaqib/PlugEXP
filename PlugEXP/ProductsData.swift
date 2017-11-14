//
//  ProductsData.swift
//  PlugEXP
//
//  Created by admin on 11/14/17.
//  Copyright © 2017 brainplow. All rights reserved.
//

import Foundation
public class ProductsData{
    public var productName : String
    public var imagename : String
    public var price : String
    public var description : String
    public var productDetails: [ProductDetails]
    
    init(name: String, imageName: String, price: String, description: String, productDetails:[ProductDetails]?) {
        self.productName = name
        self.imagename = imageName
        self.description = description
        self.price = price
        self.productDetails = productDetails!
    }
    
    
    
}

public class ProductDetails{
    public var cancellectionPrice : String
    
    init(price: String) {
        self.cancellectionPrice = price
    }
    
}
