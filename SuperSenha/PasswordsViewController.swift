//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Luan Coleto on 06/03/20.
//  Copyright © 2020 Luan Coleto. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfPasswords: Int = 5
    var numberOfCharacters: Int = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenarator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenarator(numberOfPasswords: numberOfPasswords, numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
         let passwords = passwordGenerator.generate(total: numberOfPasswords)
               
               for password in passwords {
                   tvPasswords.text.append(password + "\n\n")
               }
    }
    
    
    @IBAction func Generate(_ sender: Any) {
        generatePasswords()
    }
    
    
}
