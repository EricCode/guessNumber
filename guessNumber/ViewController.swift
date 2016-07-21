//
//  ViewController.swift
//  guessNumber
//
//  Created by EricYang on 2016/7/21.
//  Copyright © 2016年 EricYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label2: UILabel!
    
    var number = 0
    var min = 1
    var max = 100
    var guess = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        number = Int(arc4random_uniform(101))
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let _ = Int(string){
            return true
        }
        else if string == ""{
            return true
        }
        else{
            return false
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        number = Int(arc4random_uniform(101))
        min = 1
        max = 100
        guess = 0
        Label.text = "1~100猜個數字"
        label2.text = ""

    }
    @IBAction func confirm(_ sender: UIButton) {
        guess = guess + 1
        if guess < 6{
            label2.text = "還有 \(6-guess)次機會"
            if let input = textField.text{
                if input == String(number){
                    Label.text = "數字 \(number),猜對了！"
                }
                else if Int(input)>number{
                    
                    let n = Int(input)!
                    if n <= max{
                        max = n
                        
                        Label.text = "\(min)~\(n-1)猜個數字"
                    }
                    
                }
                else if Int(input)<number{
                    
                    let m = Int(input)!
                    if m >= min{
                        Label.text = "\(m+1)~\(max)猜個數字"
                        min = m
                        
                    }
                }
            }
            
        }
        else{
            label2.text = "機會已用完了ＱＱ"
            Label.text = "答案是 \(number)"
        }
                
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    

}

