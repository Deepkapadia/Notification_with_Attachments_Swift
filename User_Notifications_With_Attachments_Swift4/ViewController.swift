//
//  ViewController.swift
//  User_Notifications_With_Attachments_Swift4
//
//  Created by DeEp KapaDia on 23/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (success, error) in
            
            if error != nil {
                
                print("Authorizations Successful")
                
            }
            
        }
    
    }
   
    @IBAction func NotifyBTN(_ sender: UIButton) {
        
        
        TimedNotification(inSeconds: 5) { (success) in
            if success {
                
                print("Mast yaar")
                
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func TimedNotification(inSeconds : TimeInterval , complition: @escaping (_ success: Bool) -> ()) {
        
        guard let imgeURL = Bundle.main.url(forResource: "image", withExtension: "gif") else {
            complition(false)
            return
        }
        
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imgeURL, options: .none)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let content = UNMutableNotificationContent()
        
        content.title = "New Stuff Notification"
        
        content.subtitle = "New Stuff"
        
        content.body = "This is new GIF Image check it out now...."
        
        content.attachments = [attachment]
        
        let request = UNNotificationRequest(identifier: "CustNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error == nil{
                
                complition(true)
                
            }else {
                
                complition(false)
                
            }
        }
        
    }
    

}

