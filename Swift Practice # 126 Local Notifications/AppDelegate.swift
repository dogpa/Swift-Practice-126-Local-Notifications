//
//  AppDelegate.swift
//  Swift Practice # 126 Local Notifications
//
//  Created by Dogpa's MBAir M1 on 2022/1/13.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
// 原本放在這裡的UserNotifications程式碼 現在在ViewCOntroller
//        //options內為可以接受開啟的項目
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.carPlay,.sound]) { (granted, error) in
//            if granted {
//                print("允許開啟")
//            }else{
//                print("拒絕接受開啟")
//            }
//        }
        //UNUserNotificationCenter.current().delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
//  原本放在這裡的UserNotifications程式碼 現在在ViewCOntroller
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.badge, .banner, .list, .sound]) //app內推播想要看到的資訊
//    }


}

