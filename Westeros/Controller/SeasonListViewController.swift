//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

protocol SeasonListViewControllerDelegate: class{
    
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason season: Season)
}

final class SeasonListViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    enum Constants{
        static let seasonKey = "SeasonKey"
    }
    
    private let model: [Season]
    weak var delegate: SeasonListViewControllerDelegate?
    
    init(model: [Season]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
    }
}

extension SeasonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension SeasonListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "SeasonCell"
        
        //Descubrir cual es la Season que tenemos que mostrar
        let season = model[indexPath.row]
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        //Sincronizar model(Season) y la vista(celda)
        cell.textLabel?.text = season.nombre
        cell.detailTextLabel?.text = "Fecha de lanzamiento: \(season.fechaLanzamiento)"
        
        //Devolver la celda
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Averiguar que Season se ha pulsado
        let season = model[indexPath.row]
        
        //Averiguamos el tipo de dispositivo que se está utilizando
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            let seasonDetailViewController = SeasonDetailViewController(model: season)
            navigationController?.pushViewController(seasonDetailViewController, animated: true)
            break
        case .pad:
            //Avisar al delegado
            //Enviamos la infomarcion de que se ha selecciona una casa
            delegate?.seasonListViewController(self, didSelectSeason: season)
            
            //Mandamos la misma información a través de las notificaciones
            let dictionary = [Constants.seasonKey: season.sortedEpisodes]
            let notificationCenter = NotificationCenter.default
            let notification = Notification(name: .seasonDidNotificationName,
                                            object: self,
                                            userInfo: dictionary)
            notificationCenter.post(notification)
            break
        
        case .unspecified: break
        
        case .tv:
            break
        case .carPlay:
            break
        @unknown default:
            break
        }
    }
}

