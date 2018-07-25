//
//  LoginViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        textField.tag
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag==1{
            textField.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        }
        if textField.tag==2{
            textField.resignFirstResponder()
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
