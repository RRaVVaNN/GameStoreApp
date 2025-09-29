//
//  ViewController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 16.09.25.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    //  var users = [User]()
    let manager = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        manager.fetchItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager.fetchItems()
    }
    
    //    func configureManager() {
    //        manager.completion = { users in
    //            self.users = users
    //        }
    //        manager.fetchItems()
    //    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let regController = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        regController.registerCallback = { email, password in
            self.emailTextField.text = email
            self.passwordTextField.text = password
        }
        navigationController?.show(regController, sender: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print(manager.users)
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if let user = manager.users.first (where: {$0.email == email }) {
            if user.password == password {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let delegate = windowScene.delegate as? SceneDelegate {
                        delegate.tabRoot()
                    }
                }
            } else {
                showAlert(title: "Warning", message: "password is wrong.")
            }
        } else {
            showAlert(title: "Warning", message: "There is no such a user.")
        }
       
    }
}
