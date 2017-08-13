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
        
        // creamos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        /* MODELO GENERICO*/
        
        // creamos los controladores
        
        // ViewController para Houses
        let housesDataSource = DataSources.houseDataSource(model: houses)
        let housesDelegate = HousesDelegate(model: houses.first!)
        let housesVC = ArrayTableViewController(dataSource: housesDataSource,
                                                delegate: housesDelegate,
                                                title: "Houses",
                                                style: .plain).wrappedInNavigation()
        
        // ViewController para Seasons
        let seasonDataSource = DataSources.seasonDataSource(model: seasons)
        let seasonsDelegate = SeasonsDelegate(model: seasons.first!)
        let seasonsVC = ArrayTableViewController(dataSource: seasonDataSource,
                                                 delegate: seasonsDelegate,
                                                 title: "Seasons",
                                                 style: .plain).wrappedInNavigation()
        
        // Se crea el Tab para los VC de Houses y Seasons
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [housesVC, seasonsVC]
        
        // Aplicamos estilo al TabBar
        setTabBarAppearance()
        
        
        
        // creamos los NavigationController para houses y seasons
        let navHouse = housesDelegate.getNavVC()
        let navSeason = seasonsDelegate.getNavVC()
        
        // Añadimos Split View en caso de estar viendo la app con iPad
        if (UIDevice.current.userInterfaceIdiom == .pad){
            
            // Creamos el splitViewController
            let splitVC = UISplitViewController()
            splitVC.viewControllers = [tabBarVC, navHouse, navSeason]
            
            //asignamos el rootVC
            window?.rootViewController = splitVC
        } else {
            // En cualquier otro dispositivo, se decide no mostrar el split view
            window?.rootViewController = tabBarVC
        }
        
        
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

