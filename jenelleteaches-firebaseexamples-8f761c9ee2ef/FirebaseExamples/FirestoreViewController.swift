//
//  FirestoreViewController.swift
//  FirebaseExamples
//
//  Created by parrot on 2018-11-18.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Firebase
import WebKit

class FirestoreViewController: UIViewController {

    
    // MARK: Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var artistNameTextBox: UITextField!

    // MARK: Initialize firestore variable
    // ------------------------------------
    var db:Firestore!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("+++++= View did load function")
        // Setup firestore variable
        db = Firestore.firestore()
        
        // OPTIONAL:  Required when dealing with dates that are stored in Firestore
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loadDataPressed(_ sender: Any) {
        let citiesRef = db.collection("cities")
        
        citiesRef.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000,
            "regions": ["west_coast", "norcal"]
            ])
        citiesRef.document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 3900000,
            "regions": ["west_coast", "socal"]
            ])
        citiesRef.document("DC").setData([
            "name": "Washington D.C.",
            "country": "USA",
            "capital": true,
            "population": 680000,
            "regions": ["east_coast"]
            ])
        citiesRef.document("TOK").setData([
            "name": "Tokyo",
            "country": "Japan",
            "capital": true,
            "population": 9000000,
            "regions": ["kanto", "honshu"]
            ])
        citiesRef.document("BJ").setData([
            "name": "Beijing",
            "country": "China",
            "capital": true,
            "population": 21500000,
            "regions": ["jingjinji", "hebei"]
            ])
    }
    
    
    
    // MARK: Get data from Firestore
    // -------------------------------
    @IBAction func getDataPressed(_ sender: Any) {
        print("Get Data pressed!")
        
        db.collection("songs").getDocuments() {
            (querySnapshot, err) in
            
            // MARK: FB - Boilerplate code to get data from Firestore
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }

    }
    
    
    
    // MARK: Open a Youtube video
    // ------------------------------
    @IBAction func openYoutubePressed(_ sender: Any) {
        print("trying to open url")
        
        
        let artistName = artistNameTextBox.text!
       
        /*
        // Static
        let songsRef = db.collection("songs").whereField("artist", isEqualTo: "Fetty Wap")
        */
        
        // dyanmic
        let songsRef = db.collection("songs").whereField("artist", isEqualTo: artistName)
        
        print("Querying database")
        
        songsRef.getDocuments() {
            (snapshot, error) in
            
            if (error != nil) {
                print("Error getting results from query")
            }
            else {
                print("Got something!")
                print("Num items in database matching query: \(snapshot!.count)")
                
                // 1. Get one result from database
                let results = snapshot!.documents
                let data = results[0].data()
                print(data["link"]!)
                
                // 2. Create a url from the database link
                let link = data["link"] as! String      // convert the database info to a string
                let videoURL = URL(string:link)!
                let req = URLRequest(url: videoURL)
                
                // 3. Show the url in a webview
                self.webView.load(req)
                
                
                /*
                // Loop through all the results
                for document in snapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
                */
            }
        }

        print("done!")
        
        
        
        
        /*
        // 1. Create a url
        var videoURL = URL(string:"https://www.youtube.com/watch?v=i_kF4zLNKio")!
        let req = URLRequest(url: videoURL)
        
        // 2. Show the url in a webview
        webView.load(req)
         */
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
