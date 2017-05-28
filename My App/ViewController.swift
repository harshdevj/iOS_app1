//
//  ViewController.swift
//  My App
//
//  Created by System Administrator on 5/11/17.
//  Copyright © 2017 Harshdev Joshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt: UITextField?
    @IBOutlet weak var equalBtn: UIButton?
    
    var operation: String?
    var previousValue: Int = 0, currentValue: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        equalBtn?.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func appendNumber(sender: UIButton) {
        //print("You clicked: ", sender.titleLabel);
        let title = sender.titleLabel?.text
        switch title! {
        case "+", "-", "*", "/":
            //debugPrint("Operation: ", title!)
            operation = title!;
            previousValue = Int((txt?.text)!)!
            txt?.text = "";
            break
        case "=":
            currentValue = Int((txt?.text)!)!
            getResult()
            break;
        default:
            //debugPrint("Number: ", title!)
            txt?.text = (txt?.text)! + title!
            break
        }
        
        if (previousValue > 0 && equalBtn?.isEnabled == false) {
            equalBtn?.isEnabled = true
        }
        
        //debugPrint("Test", title!)
    }
    
    @IBAction func ac() {
        txt?.text = ""
        previousValue = 0
        equalBtn?.isEnabled = false
    }
    
    private func getResult() {
        switch operation! {
        case "+":
            txt?.text = "\(previousValue + currentValue)"
            break;
        case "*":
            txt?.text = "\(previousValue * currentValue)"
            break;
        case "-":
            txt?.text = "\(previousValue - currentValue)"
            break;
        case "/":
            txt?.text = "\(previousValue / currentValue)"
            break;
        default:
            debugPrint("Invalid operation")
        }
    }

}

