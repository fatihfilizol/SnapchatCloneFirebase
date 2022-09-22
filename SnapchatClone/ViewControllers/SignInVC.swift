//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Fatih Filizol on 20.09.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButton(_ sender: Any) {
        
        if passwordText.text != "" && emailText.text != ""{
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) {
                (result,error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(title: "Error", message: "Username / password / email ?")
        }
        
    }
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != "" && emailText.text != ""{
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!){
                (auth,error) in
                if error != nil{
                    
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                    
                }else{
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email" : self.emailText.text!, "username" : self.userNameText.text!] as [String : Any]
                    
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error != nil{
                            self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                        }
                    }
                    
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(title: "Error", message: "Username / password / email ?")
        }
        
        
        
    }
    
    func makeAlert(title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

