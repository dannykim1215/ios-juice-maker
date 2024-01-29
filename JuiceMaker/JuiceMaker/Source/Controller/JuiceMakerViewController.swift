//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet var modifiedFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet var strawbananaJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = juiceMaker.viewFruitStock(fruitName: .strawberry)
        bananaLabel.text = juiceMaker.viewFruitStock(fruitName: .banana)
        pineappleLabel.text = juiceMaker.viewFruitStock(fruitName: .pineapple)
        kiwiLabel.text = juiceMaker.viewFruitStock(fruitName: .kiwi)
        mangoLabel.text = juiceMaker.viewFruitStock(fruitName: .mango)
    }
    
    @IBAction func orderStrawbananaJuiceButtonClicked(_ sender: Any) {
        let result: String = showJuiceHandleResult(juiceMenu: .strawberryBanana)
        
        if result == "\(JuiceMenu.strawberryBanana.rawValue)를 1잔 만들었습니다." {
            orderJuiceSucceedAlert(juiceName: JuiceMenu.strawberryBanana.rawValue)
        } else {
            orderJuiceFailedAlert()
        }
    }
    
    func orderJuiceSucceedAlert(juiceName: String) {
        let alert = UIAlertController(title: "JuiceMaker", message: "\(juiceName)를 1잔 만들었습니다.", preferredStyle: UIAlertController.Style.actionSheet)
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: false, completion: nil)
    }
    
    func orderJuiceFailedAlert() {
        let alert = UIAlertController(title: "JuiceMaker", message: "재료가 모자라요, 재고를 수정할까요?", preferredStyle: UIAlertController.Style.actionSheet)
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)

        alert.addAction(okAction)
        alert.addAction(cancelAction)

        present(alert, animated: false, completion: nil)
    }
    
    
    @IBAction func modifiedFruitStockButtonClicked(_ sender: UIBarButtonItem) {
        guard let FruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else {
            return
        }
        self.navigationController?.pushViewController(FruitStockViewController, animated: true)
    }
    
    
    func showJuiceHandleResult(juiceMenu: JuiceMenu) -> String {
        let juiceResult = juiceMaker.makeJuice(juiceMenu: juiceMenu, amount: 1)
        switch juiceResult {
        case .success(let message):
            print(message)
            return message
        case .failure(.outOfStock):
            return "재고가 없습니다"
        }
    }
}

