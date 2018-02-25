//
//  AppDelegate.swift
//  Westeros
//
//  Created by Jaime Ventor on 8/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var houseListViewController : HouseListViewController?
    var seasonListViewController : SeasonListViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        //Crear los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        
        // Creamos los masterViews
        houseListViewController = HouseListViewController(model: houses)
        seasonListViewController = SeasonListViewController(model: seasons)
        
    
        // Creamos un combinador
        let tabBarViewController = UITabBarController()
        tabBarViewController.title = "Westeros"
        tabBarViewController.delegate = self
        tabBarViewController.viewControllers = [houseListViewController!, seasonListViewController!]
        tabBarViewController.tabBar.items?[0].image = UIImage(named: "castle.png")
        tabBarViewController.tabBar.items?[1].image = UIImage(named: "film.png")
        tabBarViewController.navigationController?.navigationBar.backgroundColor = UIColor.red
        
        // Creamos la vista de detalle que se abrira al arrancar
        let lastSelectedHouse = houseListViewController?.lastSelectedHouse()
        let houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse! )
        
        //let seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        
        // Asugnamos delegados
        houseListViewController?.delegate = houseDetailViewController
        //seasonListViewController?.delegate = seasonDetailViewController
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(masterDidChange), name: NSNotification.Name(rawValue: Const.MasterViewChangeNotificationName), object: nil)
    
        
        // Crear el UISPlitVC y le asignamos los VC (master y detail)
        let splitViewController = UISplitViewController()

        splitViewController.viewControllers = [tabBarViewController.wrappedInNavigation(), houseDetailViewController.wrappedInNavigation()]
       
        //Asignamos el rootVC
        window?.rootViewController = splitViewController
        
        
        setupUI()
        
        return true
    }

    func setupUI(){
        UINavigationBar.appearance().backgroundColor = UIColor.red
        UITabBar.appearance().backgroundColor = UIColor.red
        
    }
    
    @objc func masterDidChange(notification: Notification){
        
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

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is SeasonListViewController {
            let season = (viewController as! SeasonListViewController).model.first
            let seasonDetailViewController = SeasonDetailViewController(model: season!)
            seasonListViewController?.delegate = seasonDetailViewController
            self.window?.rootViewController?.showDetailViewController(seasonDetailViewController.wrappedInNavigation(), sender: nil)
           }
        else if viewController is HouseListViewController {
            let house = (viewController as! HouseListViewController).model.first
            let houseDetailViewController = HouseDetailViewController(model: house!)
            houseListViewController?.delegate = houseDetailViewController
            self.window?.rootViewController?.showDetailViewController(houseDetailViewController.wrappedInNavigation(), sender: nil)
        }
    }
}

