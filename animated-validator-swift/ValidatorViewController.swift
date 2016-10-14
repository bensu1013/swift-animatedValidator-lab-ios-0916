//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
    }

    @IBAction func editedChanges() {
        
        if checkEmailField() && validateEmailField() && checkPhoneText() && checkPassWord() && validatePassWord() {
            submitButton.isEnabled = true
        }
    }
    
    
    
    func checkEmailField() -> Bool {
        
        var domainName: Bool = false
        var domain: Bool = false
        
        if let text = emailTextField.text {
            
            let letters = text.characters
            
            for char in letters {
              
                if char == "@" {
                    if !domainName && !domain {
                        domainName = true
                    } else if domainName || domain {
                        return false
                    }
                }
                
                if char == "." {
                    if domainName && !domain {
                        domain = true
                    } else if domain {
                        return false
                    }
                }
            }
        }
        return domainName && domain ? true : false
    }
    
    func validateEmailField() -> Bool {
        guard let email1 = emailTextField.text else { return false }
        guard let email2 = emailConfirmationTextField.text else { return false }
        
        return email1 == email2 ? true : false
    }
    
    func checkPhoneText() -> Bool {
        
        guard let phoneString = phoneTextField.text else { return false }
        
        guard let phoneNum = Int(phoneString) else { return false }
        
        let count = phoneString.characters.count
        
        return count >= 7 ? true : false
    }
    
    func checkPassWord() -> Bool{
        
        guard let text = passwordTextField.text else { return false }
        
        return text.characters.count >= 6 ? true : false
        
    }
    
    func validatePassWord() -> Bool {
        guard let password1 = passwordTextField.text else { return false }
        guard let password2 = passwordConfirmTextField.text else { return false }
        
        return password1 == password2 ? true : false
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
    }
    
    
    
    
    
    
}













