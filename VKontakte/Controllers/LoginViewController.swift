//
//  ViewController.swift
//  VKontakte
//
//  Created by Maria on 07.02.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var LoginButtom: UIButton!
    
//    var yellowText = String()
//    let fromLoginToYellow = "fromLoginToYellow"
    let fromLoginToTabBarSegue = "fromLoginToTabBarSegue"

    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tapRecognizer)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Login viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Login viewDidAppear")
        LoginButtom.backgroundColor =  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Login viewWillDisappear")
    }


    @objc func keyboardDidShow(_ notification: Notification){
        let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        guard let keyboardHeight = keyboardSize?.height else {return}
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardDidHide(_ notificatoin: Notification){
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func onTap(){
        self.view.endEditing(true)
    }
    /*   для возврата на этот экран
        @IBAction func unwind(segue: UIStoryboardSegue) {
            print("unwind to Login")
            guard let loginViewController = segue.source as? LoginViewController else {return}
            if let text = loginViewController.loginTextField.text {
                print(text)
                self.yellowText = text
        }
        
    }*/
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromLoginToTabBarSegue {
            guard let yellowController = segue.destination as? GalleryViewController, let textYellow = sender as? String
            else {
                return
            }
            yellowController.textYellow = textYellow
        }
    }*/

    
    @IBAction func EnterButtom(_ sender: UIButton) {
//        guard let login = self.loginTextField.text,
//                login == "root",
//                let password = self.passwordTextField.text,
//                password == "1234"
//        else {
//            print("ERROR")
//            return
//        }
        
        performSegue(withIdentifier: fromLoginToTabBarSegue, sender: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

