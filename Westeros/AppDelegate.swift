//
//  AppDelegate.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 11/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Lanzar la App Aquí
        
        window = UIWindow(frame: UIScreen.main.bounds)//Decimos que espacio va ocupar la pantalla. Aqui el tamaño de la pantalla
        window?.makeKeyAndVisible() //Toda window necesita un root view controller
        
        //Crear el model
        let houses = Repository.local.houses
        
        //Creamos los controladores
        let houseListViewController = HouseListViewController(model: houses)
        
        //Asignamos el root view controller
        window?.rootViewController = houseListViewController.wrappedInNavigation()

        return true
    }
}

