//
//  ViewController.swift
//  coremotion001
//
//  Copyright © 2016年 FaBo, Inc. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    var myMotionManager: CMMotionManager!
    var count = 0
    
    override func viewDidLoad() {

        let dateFormatter = DateFormatter()
        
        super.viewDidLoad()
        
        let myXLabel: UILabel = UILabel()
        myXLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myXLabel.backgroundColor = UIColor.blue
        myXLabel.layer.masksToBounds = true
        myXLabel.layer.cornerRadius = 10.0
        myXLabel.textColor = UIColor.white
        myXLabel.shadowColor = UIColor.gray
        myXLabel.textAlignment = NSTextAlignment.center
        myXLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)

        let myYLabel: UILabel = UILabel()
        myYLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myYLabel.backgroundColor = UIColor.orange
        myYLabel.layer.masksToBounds = true
        myYLabel.layer.cornerRadius = 10.0
        myYLabel.textColor = UIColor.white
        myYLabel.shadowColor = UIColor.gray
        myYLabel.textAlignment = NSTextAlignment.center
        myYLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 280)

        let myZLabel: UILabel = UILabel()
        myZLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myZLabel.backgroundColor = UIColor.red
        myZLabel.layer.masksToBounds = true
        myZLabel.layer.cornerRadius = 10.0
        myZLabel.textColor = UIColor.white
        myZLabel.shadowColor = UIColor.gray
        myZLabel.textAlignment = NSTextAlignment.center
        myZLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 360)
        
        let myxxLabel: UILabel = UILabel()
        myxxLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myxxLabel.backgroundColor = UIColor.purple
        myxxLabel.layer.masksToBounds = true
        myxxLabel.layer.cornerRadius = 10.0
        myxxLabel.textColor = UIColor.white
        myxxLabel.shadowColor = UIColor.gray
        myxxLabel.textAlignment = NSTextAlignment.center
        myxxLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 440)
        
        let myyyLabel: UILabel = UILabel()
        myyyLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myyyLabel.backgroundColor = UIColor.purple
        myyyLabel.layer.masksToBounds = true
        myyyLabel.layer.cornerRadius = 10.0
        myyyLabel.textColor = UIColor.white
        myyyLabel.shadowColor = UIColor.gray
        myyyLabel.textAlignment = NSTextAlignment.center
        myyyLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 520)
        
        let myzzLabel: UILabel = UILabel()
        myzzLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myzzLabel.backgroundColor = UIColor.purple
        myzzLabel.layer.masksToBounds = true
        myzzLabel.layer.cornerRadius = 10.0
        myzzLabel.textColor = UIColor.white
        myzzLabel.shadowColor = UIColor.gray
        myzzLabel.textAlignment = NSTextAlignment.center
        myzzLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 600)

        self.view.backgroundColor = UIColor.white

        self.view.addSubview(myXLabel)
        self.view.addSubview(myYLabel)
        self.view.addSubview(myZLabel)
        self.view.addSubview(myxxLabel)
        self.view.addSubview(myyyLabel)
        self.view.addSubview(myzzLabel)


        myMotionManager = CMMotionManager()

        myMotionManager.accelerometerUpdateInterval = 0.1

        myMotionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: {(accelerometerData, error) in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            guard let data = accelerometerData else {
                return
            }
            myXLabel.text = "x=\(data.acceleration.x)"
            myYLabel.text = "y=\(data.acceleration.y)"
            myZLabel.text = "z=\(data.acceleration.z)"
            
            
            if(-0.1 <= data.acceleration.x && data.acceleration.x <= 0.1){
                myxxLabel.text = "success"
                
            }else{
                myxxLabel.text = "failed"
            }
            
            if(-0.1 <= data.acceleration.y && data.acceleration.y <= 0.1){
                myyyLabel.text = "success"
            }else{
                myyyLabel.text = "failed"
            }
            
            if(-0.1 <= data.acceleration.x && data.acceleration.x <= 0.1 && -0.1 <= data.acceleration.y && data.acceleration.y <= 0.1){
                dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"

                dateFormatter.locale = Locale(identifier: "en_US_POSIX")

                dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")

                let str = dateFormatter.string(from: Date())

                myzzLabel.text = "t=\(str)"
            }
            
            if #available(iOS 10.0, *) {
                // iOS 10
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                    if error != nil {
                        return
                    }

                    if granted {
                        print("通知許可")

                        let center = UNUserNotificationCenter.current()
                        center.delegate = self
                        
                        let content = UNMutableNotificationContent()
                        content.title = "休憩TIME"
                        content.body = "ストレッチをしましょう！"
                        content.sound = UNNotificationSound.default
    
                        // トリガーを設定。５秒後に通知がくる
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                        // UNNotificationRequestに設定したトリガー指定する
                        let request = UNNotificationRequest(identifier: "localPushTest2", content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

                    } else {
                        print("通知拒否")
                    }
                })

            } else {
                // iOS 9以下
                let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
                UIApplication.shared.registerUserNotificationSettings(settings)
            }
            
//            if(test == 1){
//                self.performSegue(withIdentifier: "toSecond", sender: nil)
//            }
        
        
        })
        

    }
    
    @IBAction func button(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    

}
