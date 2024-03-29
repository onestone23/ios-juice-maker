//
//  JuiceMaker - JuiceMaker.swift
//  Created by stone, jpush.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    let fruitStore = FruitStore.shared
    
    func makeJuice(_ juice: Juice) throws { 
        let juiceRecipe = juice.recipe

        try validFruitAmount(for: juiceRecipe)
        try fruitStore.useFruits(for: juiceRecipe)
        
    }
    
    func validFruitAmount(for recipe : [Fruit : Int]) throws {
        for (fruit, amount) in recipe {
            let fruitAmount = try fruitStore.fetchFruitAmount(for: fruit)
            guard amount <= fruitAmount else { throw JuiceMakerError.fruitAmountError }
        }
    }
}
