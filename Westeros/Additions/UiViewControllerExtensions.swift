//
//  File.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 13/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        //OJO! Esto crea una nueva instancia de UInavigationController
        return UINavigationController(rootViewController: self)
    }
}
