//
//  LoginViewController.swift
//  Twitter
//
//  Created by Hayley Robinson on 2/24/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true
        {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    //log in
    @IBAction func onLoginButton(_ sender: Any)//runs anytime someone taps button
    {
        let myUrl = "https://api.twitter.com/oauth/request_token" //url for api
        
        
        
        //call api caller using url
        TwitterAPICaller.client?.login(url: myUrl, success:{
            
            UserDefaults.standard.set(true, forKey:"userLoggedIn") //creates variable when someone logs in
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in.")
        }) //if login succeeds, segues to home,if fails, print
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
