//
//  ExpandingTVC.swift
//  PlugEXP
//
//  Created by admin on 11/14/17.
//  Copyright © 2017 brainplow. All rights reserved.
//

import Foundation
import UIKit

class ExpandingTVC : UITableViewController {
    
    var productsData: [ProductsData?]?
    override func viewDidLoad() {
        productsData = getData()
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func getParentCellIndex(expansionIndex: Int) -> Int {
        
        var selectedCell: ProductsData?
        var selectedCellIndex = expansionIndex
        
        while(selectedCell == nil && selectedCellIndex >= 0) {
            selectedCellIndex -= 1
            selectedCell = productsData?[selectedCellIndex]
        }
        
        return selectedCellIndex
    }


  
    public func getData() -> [ProductsData?]{
        var data: [ProductsData?] = []
        
        let detail1 = [ProductDetails(price: "$22")]
        let data1 = ProductsData(name: "Product 1",imageName: "shirt04", price: "$100", description: "This can be any description about the product, You can write multiple text", productDetails: detail1)
         let detail2 = [ProductDetails(price: "$23")]
        let data2 = ProductsData(name: "Product2", imageName: "shirt03", price: "$150", description: "This can be any description about the product", productDetails: detail2)
         let detail3 = [ProductDetails(price: "$24")]
        let data3 = ProductsData(name: "Product3", imageName: "shirt02", price: "$10", description: "This can be any description about the product", productDetails: detail3)
         let detail4 = [ProductDetails(price: "$25")]
        let data4 = ProductsData(name: "Product4", imageName: "hat03", price: "$1000", description: "This can be any description about the product", productDetails: detail4)
         let detail5 = [ProductDetails(price: "$26")]
        let data5 = ProductsData(name: "Product5", imageName: "shirt04", price: "$40", description: "This can be any description about the product", productDetails: detail5)
        
        return [data1,data2,data3,data4,data5]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = productsData {
            return data.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let rowData = productsData![indexPath.row] {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
            defaultCell.productImage.image = UIImage(named: rowData.imagename)
            defaultCell.price.text = rowData.price
            defaultCell.productName.text = rowData.productName
            defaultCell.discription.text = rowData.description
            defaultCell.selectionStyle = .none
            return defaultCell
        }
            // Row is ExpansionCell
        else {
            if let rowData = productsData![getParentCellIndex(expansionIndex: indexPath.row)] {
                //  Create an ExpansionCell
                let expansionCell = tableView.dequeueReusableCell(withIdentifier: "ExpansionCell", for: indexPath) as! ExpansionCell
                
                //  Get the index of the parent Cell (containing the data)
                let parentCellIndex = getParentCellIndex(expansionIndex: indexPath.row)
                
                //  Get the index of the flight data (e.g. if there are multiple ExpansionCells
                let flightIndex = indexPath.row - parentCellIndex - 1
                
                //  Set the cell's data
                
                expansionCell.cancelletionPrice.text = rowData.productDetails[flightIndex].cancellectionPrice
                expansionCell.termsBtn.setTitle("Terms", for: .normal)
                expansionCell.factsheetBtn.setTitle("Fact Sheet", for: .normal)
                expansionCell.selectionStyle = .none
                return expansionCell
            
        }
        
        return UITableViewCell()
    }
}
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let rowData = productsData?[indexPath.row] {
            return 230
        } else {
            return 200
        }
    }
    
    private func expandCell(tableView: UITableView, index: Int) {
        // Expand Cell (add ExpansionCells
        if let details = productsData?[index]?.productDetails {
            for i in 1...details.count {
                productsData?.insert(nil, at: index + i)
                tableView.insertRows(at: [NSIndexPath(row: index + i, section: 0) as IndexPath] , with: .top)
            }
        }
    }
    
    private func contractCell(tableView: UITableView, index: Int) {
        if let details = productsData?[index]?.productDetails{
            for i in 1...details.count {
                productsData?.remove(at: index+1)
                tableView.deleteRows(at: [NSIndexPath(row: index+1, section: 0) as IndexPath], with: .top)
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = productsData?[indexPath.row] {
            
            // If user clicked last cell, do not try to access cell+1 (out of range)
            if(indexPath.row + 1 >= (productsData?.count)!) {
                expandCell(tableView: tableView, index: indexPath.row)
            }
            else {
                // If next cell is not nil, then cell is not expanded
                if(productsData?[indexPath.row+1] != nil) {
                    expandCell(tableView: tableView, index: indexPath.row)
                    // Close Cell (remove ExpansionCells)
                } else {
                    contractCell(tableView: tableView, index: indexPath.row)
                    
                }
            }
        }
    }
    
    
    
 
            
            
    
    
    
   
    
    
    
    
}
