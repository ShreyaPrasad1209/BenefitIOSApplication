//
//  SelectMenuViewController.swift
//  Benefit
//
//  Created by Lakshay Chhabra on 31/05/18.
//  Copyright © 2018 IOSD. All rights reserved.
//

import UIKit

class SelectMenuViewController: UIViewController, SegueProtocol{
    func coachSegue() {
        //performSegue(withIdentifier: "toCoachTab", sender: self)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "coachViewController") as! CoachTabViewController
        
        self.present(newViewController, animated: true, completion: nil)
    }
    func notificationSegue() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "notifiViewController") as! NotificationTabViewController
        
        self.present(newViewController, animated: true, completion: nil)
        
    }
    func menuSegue() {
       print("menu Module")
        
    }
    func homeSegue() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MyDashboard") as! HomeScreenViewController
        
        let navController : UINavigationController = UINavigationController(rootViewController: newViewController)
        
        self.present(navController, animated: true, completion: nil)
        
        
    }

    

    @IBOutlet var tabBarView: TabBar!
    @IBOutlet var chatButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarView.delegate = self
        
        chatButton.layer.borderColor = UIColor.white.cgColor
        chatButton.layer.borderWidth = 2
        chatButton.layer.cornerRadius = chatButton.frame.size.width/2
        chatButton.layer.masksToBounds = true
       // tabBarView.menuButtonPressed((Any).self)
        tabBarView.buttonPressed(UIButton.self())
        tabBarView.menuButtonPressed()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar for current view controller
        self.navigationController?.isNavigationBarHidden = true;
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //display alerts
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func chatButtonPressed(_ sender: Any) {
        displayAlert(title: "Premium Feature", message: "Chat is a Paid Feature, Be The premium user")
    }
    

}
