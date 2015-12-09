//
//  ViewController.swift
//  Snitch
//
//  Created by Boban Davidovic on 11/29/15.
//  Copyright © 2015 Boban Davidovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SINMessageClientDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeSinch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeSinch()
    {
        // Instantiate a Sinch client object
        let sinchClient = Sinch.clientWithApplicationKey("a06304ab-729a-47f4-815a-efdae47d7582", applicationSecret: "A33uE9+pUUyaw39WzQ8nnw==", environmentHost: "sandbox.sinch.com", userId: "user1")
        sinchClient.setSupportMessaging(true)
        sinchClient.start()
        
        let messageClient = sinchClient.messageClient()
        
        let message = SINOutgoingMessage(recipient: "user2", text: "Test 123, test 123")
        messageClient.sendMessage(message)
    }

    // Tells the delegate that a message has been received.
    func messageClient(messageClient: SINMessageClient, didReceiveIncomingMessage message: SINMessage) {
        // Present a Local Notification if app is in background
        if UIApplication.sharedApplication().applicationState == .Background {
            var notification: UILocalNotification = UILocalNotification()
            notification.alertBody = "Message from \(message.recipientIds[0])"
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        }
        else {
            // Update UI in-app
        }

    }
    
    // Tells the delegate that a message for a specific recipient has been sent by the local user.
    func messageSent(message: SINMessage, recipientId: String) {
//        var a = 1
    }
//
    // Tells the delegate that a message has been delivered (to a particular recipient).
    func messageDelivered(info: SINMessageDeliveryInfo) {
//        var a = 1
    }

    func messageFailed(message: SINMessage, info messageFailureInfo: SINMessageFailureInfo) {
//        var a = 1
    }

}

