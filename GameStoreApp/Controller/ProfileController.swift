//
//  ProfileController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 30.09.25.
//

import UIKit

class ProfileController: BaseViewController {
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var gamesCountLabel: UILabel!
    
    private let userDefaultsManager = UserDataManager()
    private let userCoreDataManager = CoreDataManager()
    private let gamesDataManager = CartCoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTitle(title: "GameLand")
        userCoreDataManager.fetchItems()
        gamesDataManager.fetchItems()
        updateUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        userCoreDataManager.fetchItems()
        gamesDataManager.fetchItems()
        updateUI()
    }
    
    func updateUI(){
        if let email = userDefaultsManager.getString(key: .email){
            let userInfo = userCoreDataManager.users.filter { $0.email == email }
            let userGames = gamesDataManager.items.filter { $0.mail == email }
            usernameLabel.text = userInfo.first?.username
            emailLabel.text = userInfo.first?.email
            gamesCountLabel.text = String(userGames.count)
        }
    }
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        userDefaultsManager.removeAllData()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let delegate = windowScene.delegate as? SceneDelegate {
                delegate.loginRoot()
            }
        }
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
