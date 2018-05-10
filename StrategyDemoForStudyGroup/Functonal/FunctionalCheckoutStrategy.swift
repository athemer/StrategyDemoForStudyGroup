//
//  FunctionalCheckoutStrategy.swift
//  StrategyDemoForStudyGroup
//
//  Created by kuanhuachen on 2018/5/10.
//  Copyright © 2018年 athemer. All rights reserved.
//

import Foundation

typealias PriceReturnable_Fuctional = ([Int]) -> Int

let getNormalFinalPrice_Fuctional: PriceReturnable_Fuctional = { itemPrices in
    return 80 + 60 + 39
}

let getDiscountFinalPrice_Fuctional: PriceReturnable_Fuctional = { itemPrices in
    return (80 + 60) / 10 * 9 + 39
}

let getCashReturnFinalPrice_Fuctional: PriceReturnable_Fuctional = { itemPrices in
    return 80 + 60 + 39 - 20
}

//let getFreeShippingFinalPrice_Fuctional: PriceReturnable_Fuctional = { itemPrices in
//    return 80 + 60
//}

