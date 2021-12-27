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
            }//trow catchのイメージ（投げる捕る）
            guard divide != 0 else {
                throw alert.noZero
            }
            return divided / divide
        }

   //---------------------------------model--------------------------------------------
    
//    do catch文でどのようなエラーが起きたのか判別する
    
    @IBAction func calculateButton(_ sender: Any) {
        do {
            let result = try calculate(num1: (firstText.text ?? ""), num2: (secondText.text ?? ""))
            resultLabel.text = String(result)
        } catch let error as alert {
            alertDisplay(message: error.name)
        } catch {
            alertDisplay(message: "予期せぬエラーが見つかりました")
        }
        
    }
   private func alertDisplay(message: String) {
        //アラート作成
        let alert = UIAlertController(title: "課題５", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //省略しない書き方
        //        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        //        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
//---------------------------------controller---------------------------------------------------------
    
    
    
    

}

