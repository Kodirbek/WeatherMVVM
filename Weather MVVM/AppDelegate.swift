//
//  AppDelegate.swift
//  Weather MVVM
//
//  Created by Abduqodir's MacPro on 2022/10/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    if #available(iOS 15, *) {
      
      UIBarButtonItem.appearance().tintColor = UIColor.black
      
      let navigationBarAppearance = UINavigationBarAppearance()
      navigationBarAppearance.configureWithOpaqueBackground()
      navigationBarAppearance.largeTitleTextAttributes = [
        NSAttributedString.Key.foregroundColor : UIColor.black
      ]
      navigationBarAppearance.titleTextAttributes = [
        NSAttributedString.Key.foregroundColor : UIColor.black
      ]
      
      navigationBarAppearance.backgroundColor = UIColor(displayP3Red: 188/255, green: 206/255, blue: 248/255, alpha: 1.0)
      UINavigationBar.appearance().standardAppearance = navigationBarAppearance
      UINavigationBar.appearance().compactAppearance = navigationBarAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
      
      let tabBarApperance = UITabBarAppearance()
      tabBarApperance.configureWithOpaqueBackground()
      tabBarApperance.backgroundColor = UIColor(displayP3Red: 188/255, green: 206/255, blue: 248/255, alpha: 1.0)
      UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
      UITabBar.appearance().standardAppearance = tabBarApperance
    }
    
    return true
  }
  
  private func setupDefaultSettings() {
    let userDefaults = UserDefaults.standard
    if userDefaults.value(forKey: "unit") == nil {
      userDefaults.set(Unit.fahrenheit.rawValue, forKey: "unit")
    }
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


}

