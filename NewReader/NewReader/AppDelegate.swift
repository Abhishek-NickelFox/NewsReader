//
//  AppDelegate.swift
//  NewReader
//
//  Created by Abhishek Thapliyal on 1/23/17.
//  Copyright © 2017 Abhishek Thapliyal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
		
		FoxAPIClient.getArticles { articleResponse in
			
//			if let articles = articleResponse.value?.articles {
//				for news in articles {
//					print("NEWS \(news.title)")
//				}
//				
//			}
			
			switch articleResponse {
			
			case .success(let response):
				for news in response.articles {
					print("NEWS \(news.title)")
				}
			case .failure(let error):
				print("ERROR \(error.localizedDescription)")
				break
			}
			
		}
		
//		FoxAPIClient.getSources { (sources) in
//			if let sources = sources.value?.sources {
//				for source in sources {
//					print("SOURCE \(source.name)")
//				}
//			}
//		}
		
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        NRDBManager().saveContext()
    }



}

