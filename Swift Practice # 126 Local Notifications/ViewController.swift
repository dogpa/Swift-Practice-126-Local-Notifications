//
//  ViewController.swift
//  Swift Practice # 126 Local Notifications
//
//  Created by Dogpa's MBAir M1 on 2022/1/13.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var initLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //options內為可以接受開啟的項目
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.carPlay,.sound]) { (granted, error) in
            if granted {
                print("允許開啟")
            }else{
                print("拒絕接受開啟")
            }
        }
        
        createNotificationContent ()
        UNUserNotificationCenter.current().delegate = self
    }
    

    func createNotificationContent () {
        let content = UNMutableNotificationContent()    //建立內容透過指派content來取得UNMutableNotificationContent功能
        content.title = "Swift的學習之路"                 //推播標題
        content.subtitle = "Apple開發者必了解"            //推播副標題
        content.body = "到底Swift難還是不難，你說呢"        //推播內文
        content.badge = 1                               //app的icon右上角跳出的紅色數字數量 line 999的那個
        content.sound = UNNotificationSound.defaultCritical     //推播的聲音
        
        let imageURL = Bundle.main.url(forResource: "appleImage", withExtension: "jpg")
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL!, options: nil)
        content.attachments = [attachment]
        
        content.userInfo = ["changeLabel" : "我被改變了"]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)   //設定透過時間來完成推播，另有日期地點跟遠端推播
        let uuidString = UUID().uuidString              //建立UNNotificationRequest所需要的ID
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil) //向UNUserNotificationCenter新增註冊這一則推播
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .list, .sound]) //app內推播想要看到的資訊
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let content: UNNotificationContent = response.notification.request.content
        initLabel.text = (content.userInfo["changeLabel"] as! String)
    }

}

