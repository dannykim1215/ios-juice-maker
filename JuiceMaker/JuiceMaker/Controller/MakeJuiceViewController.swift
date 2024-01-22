//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MakeJuiceViewController: UIViewController {

    private var juiceMaker: JuiceMaker?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker()
        JuiceHandleResult()
    }
    
    func makeJuice() -> String? {
        let juiceResult = juiceMaker?.makeJuice(juiceMenu: .strawberryBanana, amount: 1)
        return juiceResult
    }
    
    func JuiceHandleResult() {
        if let result = makeJuice() {
            print(result)
        } else {
            print("error: not working makeJuiceAndHandleResult()")
        }
    }
}
