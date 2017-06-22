//
//  LoginViewController.swift
//  9rounds
//
//  Created by Kishore's Mac on 21/06/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var userNameTF:UITextField?
    @IBOutlet var passwordTF:UITextField?
    var currentTextField:UITextField?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func loginButtonAction(sender:AnyObject){
        currentTextField?.resignFirstResponder()
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        appDelegate.navi = UINavigationController(rootViewController: rootVC)
        appDelegate.window?.rootViewController = appDelegate.navi
        
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nxtVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.navigationController?.pushViewController(nxtVC, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       //self.navigationController?.navigationBar.isHidden = true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    // MARK: - TEXTFIELD DELEGATE Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
