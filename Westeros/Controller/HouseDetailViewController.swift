//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 13/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

final class HouseDetailViewController: UIViewController {
    
    // Mark: Outlets
    
    @IBOutlet private weak var houseNameLabel: UILabel!
    @IBOutlet private weak var sigilImageView: UIImageView!
    @IBOutlet private weak var wordsLabel: UILabel!
    
    
    //Mark: Properties
    private let model: House
    
    
    //Mark: Initialization
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil) //SI le pasamos nil hace que busque un xib que se llame igual que el nombre de la clase //bundle es la carpeta de la aplicación, con Nil hace que busque este fichero dentro de la carpeta principal Bundle(for: type(of: self))
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    
    private func syncModelWithView(){
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }
}
