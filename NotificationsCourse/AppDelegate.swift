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
    let notificationCenter = UNUserNotificationCenter.current()

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        requestAutorization()
        notificationCenter.delegate = self
        return true
    }

    func requestAutorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            guard granted else { return }
            self.getNotificationsSettings()
        }
    }
    func getNotificationsSettings() {
        notificationCenter.getNotificationSettings { settings in
            
        }
    }
    func scheduleNotification(notificationType:String) {
        let content = UNMutableNotificationContent()
        
        content.title = notificationType
        content.body = "This is example how to create " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let id = "Local Notification"
        let request = UNNotificationRequest(identifier: id,
                                            content: content,
                                            trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error  {
                print("Error \(error.localizedDescription)")
            }
        }
    }

}
extension AppDelegate:UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound,.alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "Local Notification" {
            print("Handling notification with the Local Notifiaction Identifier")
        }
        completionHandler()
    }
}
