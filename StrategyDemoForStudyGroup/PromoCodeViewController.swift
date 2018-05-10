//
//  PromoCodeViewController.swift
//  StrategyDemoForStudyGroup
//
//  Created by kuanhuachen on 2018/5/10.
//  Copyright © 2018年 athemer. All rights reserved.
//

import UIKit

class PromoCodeViewController: UIViewController {
    
    let itemPrices: [Int] = [60, 80, 39]
    
    @IBOutlet weak var promocode_TextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        self.view.endEditing(true)
        
        if let destinationViewController: CheckOutDetailViewController = segue.destination as? CheckOutDetailViewController {
            
            destinationViewController.bindProperties(itemPrices: itemPrices,
                                                     checkoutType: transferPromoCodeToCheckoutType(text: promocode_TextField.text ?? ""))
            
        } else if let destinationViewController: BetterCheckOutDetailViewController = segue.destination as? BetterCheckOutDetailViewController {
            
            destinationViewController.bindProperties(itemPrices: itemPrices,
                                                     checkoutStrategy: transferPromoCodeToPriceReturnable(text: promocode_TextField.text ?? ""))

        } else if let destinationViewController: FunctionalCheckoutDetailViewController = segue.destination as? FunctionalCheckoutDetailViewController {
            
            destinationViewController.bindProperties(itemPrices: itemPrices,
                                                     checkoutStrategy: transferPromoCodeToPriceReturnableFunctional(text: promocode_TextField.text ?? ""))
        }
    }
    
    
    private func transferPromoCodeToPriceReturnableFunctional(text: String) -> PriceReturnable_Fuctional {
        
        switch text {
            
        case "iansohandsome":
            return getDiscountFinalPrice_Fuctional
            
        case "burgerlover":
            return getCashReturnFinalPrice_Fuctional
            
//        case "freeShipping":
//            return getCashReturnFinalPrice_Fuctional
            
        default:
            return getNormalFinalPrice_Fuctional
        }
    }

    private func transferPromoCodeToCheckoutType(text: String) -> CheckoutType {
        
        switch text {
            
        case "iansohandsome":
            return .percentOff
            
        case "burgerlover":
            return .cashReturn
            
//        case "freeShipping":
//            return .freeShipping
            
        default:
            return .normal
        }
    }
    
    private func transferPromoCodeToPriceReturnable(text: String) -> PriceReturnable {
        
        switch text {

        case "iansohandsome":
            return GetDiscountFinalPrice()

        case "burgerlover":
            return GetCashReturnFinalPrice()

//        case "freeShipping":
//            return GetFreeShippingFinalPrice()

        default:
            return GetNormalFinalPrice()
        }
    }

    
    @IBAction func checkout_Button_Tapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
}
