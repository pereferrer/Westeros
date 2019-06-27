//
//  HouseListTableViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 18/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit


protocol HouseListViewControllerDelegate: class{
    
    //should
    //will
    //did
    func houseListViewController(_ viewController: HouseListViewController, didSelectHouse house: House)
}

class HouseListViewController: UITableViewController {
    
    enum Constants{
        static let houseKey = "HouseKey"
        static let LastHouseKey = "LastHouseKey"
    }
    
    private let model: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
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
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "HouseCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        //Sincronizar model(casa) y la vista(celda)
        cell.textLabel?.text = house.name
        cell.imageView?.image = house.sigil.image
        
        //Devolver la celda
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Averiguar que casa se ha pulsado
        let house = model[indexPath.row]
        
        //Avisar al delegado
        //Enviamos la infomarcion de que se ha selecciona una casa
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        
        //Mandamos la misma información a través de las notificaciones
        let dictionary = [Constants.houseKey: house]
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: .houseDidNotificationName,
                                        object: self,
                                        userInfo: dictionary)
        notificationCenter.post(notification)
        
        //Mandamos la misma información a través de las notificaciones
        let members = [Constants.houseKey: house.sortedMembers]
        let nc = NotificationCenter.default
        let n = Notification(name: .houseDidNotificationName,
                                        object: self,
                                        userInfo: members)
        nc.post(n)
        
        //Guardar la última casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListViewController {
    private func saveLastSelectedHouse(at index: Int){
        //Escribimos en UserDefaults
        let userDefaults = UserDefaults.standard
        userDefaults.set(index, forKey: Constants.LastHouseKey)
        userDefaults.synchronize()
    }
    
    func lastSelectedHouse()->House{
        //Leer de UserDefaults
        let userDefaults = UserDefaults.standard
        let lastIndex = userDefaults.integer(forKey: Constants.LastHouseKey)
        return model[lastIndex]
    }
}
