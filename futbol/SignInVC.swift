//
//  ViewController.swift
//  futbol
//
//  Created by Erol Kiroglu on 06/03/17.
//  Copyright © 2017 Potato Apps. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("EROL: unable to auth facebook - \(error)")
            } else if result?.isCancelled == true {
                print("EROL: User cancelled Facebook auth")
            } else {
                print("EROL: Oldu bu is")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("EROL: Iste simdi sictik auth with firebase - \(error)")
            } else {
                print("EROL: Yasadik kullanici geldi auth with firebase")
            }
        })
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let password = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("EROL: email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("EROL: Unable to auth with Firebase using mail")
                        } else {
                            print("EROL: Cak bi beslik yeni kullanici geldi Firebase auth")
                        }
                    })
                }
            })
        
        }
    }
}

