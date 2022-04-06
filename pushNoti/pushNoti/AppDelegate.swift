//
//  AppDelegate.swift
//  pushNoti
//
//  Created by Cumulations Technologies on 05/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

      func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        registerForPushNotifications()
        UIApplication.shared.registerForRemoteNotifications()
        return true
      }
      func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
          let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
          let token = tokenParts.joined()
          print("Device Token: \(token)")
      }
      func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
          print("error",error)
      }
      func registerForPushNotifications() {
        UNUserNotificationCenter.current()
          .requestAuthorization(options: [.sound, .badge
                                          , .alert]) { granted, Error in
            print("Permission granted: \(granted)")
          }
      }




}

