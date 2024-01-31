//
//  AppDelegate.swift
//  NotificationsCourse
//
//  Created by Ботурбек Имомдодов on 30/01/24.
//

import UIKit
import UserNotifications
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let notifications:Notifications = Notifications()
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        notifications.requestAutorization()
        notifications.notificationCenter.delegate = notifications
        return true
    }

    

}
