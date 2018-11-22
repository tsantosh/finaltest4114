//
//  HomeScreenViewController.swift
//  FirebaseExamples
//
//  Created by parrot on 2018-11-18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: FB: get the current user (if one exists!)
        let currentUser = Auth.auth().currentUser;
        if (currentUser != nil) {
            print("We have a user!")
            print("User id: \(currentUser?.uid)")
            print("Email: \(currentUser?.email)")
        }
        else {
            print("no user is signed in.")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signoutButtonPressed(_ sender: Any) {
        
        print("signout button pressed!")
        
        // MARK: Try to log the user out
        do {
            // FB: Built in function to log the user out
            try Auth.auth().signOut()
            print("++++ User logged out!")
            
            // UI: Bring user back to the login screen
            dismiss(animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
