//
//  BetterCheckOutDetailViewController.swift
//  StrategyDemoForStudyGroup
//
//  Created by kuanhuachen on 2018/5/10.
//  Copyright © 2018年 athemer. All rights reserved.
//

import UIKit

class BetterCheckOutDetailViewController: UIViewController {
    
    var checkoutStrategy: PriceReturnable!
    
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

    public func bindProperties(itemPrices: [Int], checkoutStrategy: PriceReturnable)
    {
        self.checkoutStrategy = checkoutStrategy
        
        finalPrice = checkoutStrategy.getFinalPrice(with: itemPrices)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(finalPriceLabel)

        finalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            finalPriceLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            finalPriceLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            ])

    }

}
