//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerDelegate: class{
    
    func episodeListViewController(_ viewController: EpisodeListViewController, didSelectSeason episode: Episode)
}

class EpisodeListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var model: [Episode]
    weak var delegate: EpisodeListViewControllerDelegate?
    
    init(model: [Episode]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
    }
    
    deinit {
        unsubscribeNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //Siempre que nos subscribirnos, debemos desubscribirnos
        subscribeToNotifications()
    }
}

extension EpisodeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension EpisodeListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "EpisodeCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let episode = model[indexPath.row]
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        //Sincronizar model(casa) y la vista(celda)
        cell.textLabel?.text = episode.titulo
        cell.detailTextLabel?.text = "Fecha de emisión: \(episode.fechaEmision)"
        
        //Devolver la celda
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Averiguar que episodio se ha pulsado
        let season = model[indexPath.row]
        
        //Crear el episodeDetai vc
        let episodeDetailViewController = EpisodeDetailViewController(model: season)
        
        //Mostrarlo mediante un push navigation Controller
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
    }
}

extension EpisodeListViewController{
    private func subscribeToNotifications(){
        let notificationCenter = NotificationCenter.default
        //Nos damos de alta de las notifications
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange), name: Notification.Name.seasonDidNotificationName, object: nil)//Objeto que envia la notification
    }
    
    private func unsubscribeNotifications(){
        //nos damos de baja de las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc private func seasonDidChange(notification: Notification){
        
        guard let dictionary = notification.userInfo else{
            return
        }
        
        guard let episodes = dictionary[SeasonListViewController.Constants.seasonKey] as? [Episode] else{
            return
        }
        
        //Actualizar modelo
        self.model = episodes
        
        //Sincronizar modelo y vista
        tableView.reloadData()
    }
}
