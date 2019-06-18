//
//  HouseListTableViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 18/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

class HouseListTableViewController: UITableViewController {
    
    private let model: [House]
    
    init(model: [House]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    //El datasource provee de datos
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "HouseCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        //Sincronizar model(casa) y la vista(celda)
        cell?.textLabel?.text = house.name
        cell?.imageView?.image = house.sigil.image
        
        //Devolver la celda
        return cell!
    }
}
