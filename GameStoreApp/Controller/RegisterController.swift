//
//  RegisterController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 16.09.25.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   // var users = [User]()
    let manager = CoreDataManager()
    
    var registerCallback: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetchItems()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let name = nameTextField.text, !name.isEmpty,
           let email = emailTextField.text, !email.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            registerCallback?(email, password)
            manager.saveItem(name: name, email: email, password: password)
            navigationController?.popViewController(animated: true)
        }
    }
}
