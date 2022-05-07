//
//  UserNotifications.swift
//  ELearning
//
//  Created by Mansi Prajapati on 03/06/22.
//

import Foundation
import UserNotifications
import UIKit

func addNotification(
    content: UNNotificationContent,
    trigger: UNNotificationTrigger?,
    indentifier: String) {
    let request = UNNotificationRequest( identifier: indentifier,content: content,trigger: trigger)
    UNUserNotificationCenter.current().add(request,
        withCompletionHandler: { (errorObject) in
            if let error = errorObject{
                print("Error \(error.localizedDescription) in notification \(indentifier)")
            }
        }
     )
}

enum Actions {
    case accept,decline,reply,open
    
        var actions: UNNotificationAction {
            switch self {
            case .accept: return UNNotificationAction(identifier: Constant.acceptAction,
                                                       title: "Accept",
                                                       options: [])
            case .decline: return UNNotificationAction(identifier: Constant.declineAction,
                                                title: "Decline",
                                                options: [])
            case .reply: return UNTextInputNotificationAction(identifier: Constant.replyAction,
                                title: "Reply",
                                textInputButtonTitle: "Send",
                                textInputPlaceholder: "Input text here")
            case .open: return UNNotificationAction(identifier: Constant.openAction,
                                                      title: "Open app",
                                                      options: [.foreground])
            }
        }
}

