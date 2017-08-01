//
//  AppDelegate.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/5/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // Crear Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        // creamos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // creamos la tabla
        let houseVC = HouseViewController(model: houses.first!)
        let navHouse = UINavigationController(rootViewController: houseVC)
        
        let seasonVC = SeasonViewController(model: seasons.first!)
        let navSeason = UINavigationController(rootViewController: seasonVC)
        
        
        var housesVC : UINavigationController?
        var seasonsVC : UINavigationController?
        
        // analizamos el dispositivo, para crear un SplitView en caso de usar ipad
        // rawValue == 0: iphone. rawValue==1 ipad
        if(UIDevice.current.userInterfaceIdiom.rawValue == 0 ){
            housesVC = HousesTableViewController(model: houses).wrappedInNavigation()
            seasonsVC = SeasonsTableViewController(model: seasons).wrappedInNavigation()
        } else{
            housesVC = HousesTableViewController(model: houses, delegate: houseVC).wrappedInNavigation()
            seasonsVC = SeasonsTableViewController(model: seasons, delegate: seasonVC).wrappedInNavigation()
        }
    
        // Se crea el Tab para Houses y Seasons
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [housesVC!, seasonsVC!]
        
        // Creamos el splitViewController
        let splitVC = UISplitViewController()
        
        // añadimos el tabBar y por defecto, obtenemos el detalle de la primera casa
        splitVC.viewControllers = [tabBarVC, navHouse, navSeason]
        
        //asignamos el rootVC
        window?.rootViewController = splitVC
        
        
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
    }
    

}

