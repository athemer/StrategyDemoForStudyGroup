//
//  CheckOutDetailViewController.swift
//  StrategyDemoForStudyGroup
//
//  Created by kuanhuachen on 2018/5/10.
//  Copyright © 2018年 athemer. All rights reserved.
//

import UIKit

enum CheckoutType
{
    case normal         // regular price
    case percentOff     // certain % off
    case cashReturn     // get cash return if total price is over certain price
//    case freeShipping
}

class CheckOutDetailViewController: UIViewController {
    
    var checkoutType: CheckoutType!

    var itemPrices: [Int]!
    
    var finalPrice: Int = 0 {
        didSet {
            print (" @@@@@ ", finalPrice)
            finalPriceLabel.text = "Total Price is \(finalPrice)"
        }
    }
    
    lazy var finalPriceLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "PingFang TC", size: 26)
        label.textColor = .white
       return label
    }()
    
    
    public func bindProperties(itemPrices: [Int], checkoutType: CheckoutType)
    {
        switch checkoutType
        {
        case .normal:
            finalPrice = getFinalPriceWithNormal(itemPrices: itemPrices)
            
        case .percentOff:
            finalPrice = getFinalPriceWithPercenOff(itemPrices: itemPrices)
            
        case .cashReturn:
            finalPrice = getFinalPriceWithCashReturn(itemPrices: itemPrices)
            
//        case .freeShipping:
//            finalPrice = getFinalPriceWithFreeShipping(itemPrices: itemPrices)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(finalPriceLabel)
        
        finalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            finalPriceLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            finalPriceLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            ])
    }

    private func getFinalPriceWithNormal(itemPrices: [Int]) -> Int
    {
        // calculate.....
        
        return 60 + 80 + 39
    }
    
    private func getFinalPriceWithPercenOff(itemPrices: [Int]) -> Int
    {
        // calculate.....
        
        return (60 + 80) / 10 * 9 + 39
    }
    
    private func getFinalPriceWithCashReturn(itemPrices: [Int]) -> Int
    {
        // calculate....
        
        return 60 + 80 + 39 - 20
    }
    
//    private func getFinalPriceWithFreeShipping(itemPrices: [Int]) -> Int
//    {
//        // calculate....
    
//        return 60 + 80
//    }
    
}
