//
//  AppDelegate.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 11/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?
    
    //Propiedades que debemos usar en varios metodos
    var splitViewController: UISplitViewController!
    var houseDetailNavigation: UINavigationController!
    var seasonDetailNavigation: UINavigationController!
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Lanzar la App Aquí
        
        window = UIWindow(frame: UIScreen.main.bounds)//Decimos que espacio va ocupar la pantalla. Aqui el tamaño de la pantalla
        window?.makeKeyAndVisible() //Toda window necesita un root view controller
        
        //Crear el model
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        //Creamos los controladores
        let houseListViewController = HouseListViewController(model: houses)
        let seasonListViewController = SeasonListViewController(model: seasons)
        
        let lastHouseSelected = houseListViewController.lastSelectedHouse()
        let houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
        let seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        
        //asignamos el delegado
        houseListViewController.delegate = houseDetailViewController
        seasonListViewController.delegate = seasonDetailViewController
        
        //Los envolvemos en navigation
        let houseListNavigation = houseListViewController.wrappedInNavigation()
        let seasonListNavigation = seasonListViewController.wrappedInNavigation()
        houseDetailNavigation = houseDetailViewController.wrappedInNavigation()
        seasonDetailNavigation = seasonDetailViewController.wrappedInNavigation()
        
        //Creamos el TabBarController
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [houseListNavigation, seasonListNavigation]
        

        //Creamos el split
        splitViewController = UISplitViewController()
        splitViewController.viewControllers = [tabBarController, houseDetailNavigation]
        
        //Asignamos el delegate del TabBarController
        tabBarController.delegate = self
        
        //Asignamos el root view controller
        window?.rootViewController = splitViewController

        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        switch tabBarIndex {
        case 0:
            splitViewController.viewControllers = [tabBarController, houseDetailNavigation]
            break
        case 1:
            splitViewController.viewControllers = [tabBarController, seasonDetailNavigation]
            break
        default:
            break
        }
    }
}

