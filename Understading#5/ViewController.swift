//
//  ViewController.swift
//  Understading#5
//
//  Created by 中野翔太 on 2021/12/24.
//

import UIKit
//アラートを表示させたい
class ViewController: UIViewController {
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    enum alert: Error {
        case nodivided//割られる数がない
        case noDivide //割る数がない
        case noZero
        

    
        var name: String {
            switch self {
            case .nodivided: return "割られる数を入力して下さい"
            case .noDivide: return "割る数を入力して下さい"
            case.noZero: return "0は代入できません"
            }
        }
    }
        func calculate(num1: String, num2: String) throws -> Double {
            guard let divided = Double(num1)  else {
                throw alert.nodivided
            }
            guard let divide = Double(num2) else {
                throw alert.nodivided
            }
            guard divide != 0 else {
                throw alert.noZero
            }
            return divided / divide
        }

    
    
//    throwキーワドを使っているからdo catch文を
    
    @IBAction func calculateButton(_ sender: Any) {
        do {
            let result = try calculate(num1: String(firstText.text ?? ""), num2: (secondText.text ?? ""))
            resultLabel.text = String(result)
        } catch {
            print(alert.noZero)
        }
        
    }
    
    
    
    
    

}

