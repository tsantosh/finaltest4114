//
//  ViewController.swift
//  FirebaseExamples
//
//  Created by parrot on 2018-11-17.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    // MARK: Outlets
    // ----------------------
    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var statusMessageLabel: UILabel!
    
    
    // MARK: Signup Button
    // ----------------------
    @IBAction func signupButtonPressed(_ sender: Any) {
        print("Pressed signup button")
        
        // UI: Get the email/password from the text boxes
        let email = emailTextBox.text!
        let password = passwordTextBox.text!
        
        // MARK: FB:  Try to create a user using Firebase Authentication
        // This is all boilerplate code copied and pasted from Firebase documentation
        Auth.auth().createUser(withEmail: email, password: password) {
    
            (user, error) in
        
            if (user != nil) {
                // 1. New user created!
                print("Created user: ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                //2. @TODO: You decide what you want to do next!
                // - do you want to send them to the next page?
                // - maybe ask them to fill in other forms?
                // - show a tutorial?
                
            }
            else {
                // 1. Error when creating a user
                print("ERROR!")
                print(error?.localizedDescription)
                
                // 2. Show the error in the UI
                self.statusMessageLabel.text = error?.localizedDescription
                
            }
        }
        
        
    }
    
    // MARK: Login button
    // ----------------------
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("login button pressed")
        
        
        // UI: Get the email/password from the text boxes
        let email = emailTextBox.text!
        let password = passwordTextBox.text!
        
        // MARK: FB:  Try to sign the user in using Firebase Authentication
        // This is all boilerplate code copied and pasted from Firebase documentation
        Auth.auth().signIn(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. Found a user!
                print("User signed in! ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                // 2. So send them to screen 2!
                self.performSegue(withIdentifier: "segueA", sender: nil)
            }
            else {
                // 1. A problem occured when looking up  the user
                // - doesn't meet password requirements
                // - user already exists
                print("ERROR!")
                print(error?.localizedDescription)
                
                // 2. Show the error in user interface
                self.statusMessageLabel.text = error?.localizedDescription
            }
        }
    }
    
    
    // MARK: Default functions
    // ----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Navigation - prepare() function!
    // ----------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("going to next page")
    }

}

