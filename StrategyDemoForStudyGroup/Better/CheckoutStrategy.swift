//
//  CheckoutStrategy.swift
//  StrategyDemoForStudyGroup
//
//  Created by kuanhuachen on 2018/5/10.
//  Copyright © 2018年 athemer. All rights reserved.
//

import Foundation

protocol PriceReturnable {
    
    func getFinalPrice(with itemPrices: [Int]) -> Int
    
}


class GetNormalFinalPrice: PriceReturnable {
    
    func getFinalPrice(with itemPrices: [Int]) -> Int
    {
        // do calculation
        
        return 60 + 80 + 39
    }
    
}

class GetDiscountFinalPrice: PriceReturnable {
    
    func getFinalPrice(with itemPrices: [Int]) -> Int
    {
        // do calculation
        
        return ( 60 + 80 ) / 10 * 9 + 39
    }
    
}

class GetCashReturnFinalPrice: PriceReturnable {
    
    func getFinalPrice(with itemPrices: [Int]) -> Int
    {
        // do calculation
        
        return 60 + 80 + 39 - 20
    }
    
}

class GetFreeShippingFinalPrice: PriceReturnable {
    
    func getFinalPrice(with itemPrices: [Int]) -> Int
    {
        // do calculation
        
        return 60 + 80
    }
    
}


