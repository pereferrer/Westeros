//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var model: Season
    
    init(model: Season){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.nombre
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
}

extension SeasonDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension SeasonDetailViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.sortedEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "SeasonDetailCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let episode = model.sortedEpisodes[indexPath.row]
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        //Sincronizar model(casa) y la vista(celda)
        cell.textLabel?.text = episode.titulo
        cell.detailTextLabel?.text = "Fecha de lanzamiento: \(episode.fechaEmision)"
        
        //Devolver la celda
        return cell
    }
}

//Mark: - Season List View Controller Delegate
extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason season: Season) {
        model = season
        tableView.reloadData()
    }
}

extension SeasonDetailViewController {
    private func setupUI(){
        //Creo mi boton
        let episodesButton = UIBarButtonItem(title: "Episodes",
                                            style: .done,
                                            target: self,
                                            action: #selector(displayEpisodes))
        

        //Lo añado a la navigation bar
        navigationItem.rightBarButtonItems = [episodesButton]
    }
    
    @objc private func displayEpisodes(){
        //Crear el wiki vc
        let episodeListViewController = EpisodeListViewController(model: model.sortedEpisodes)
        
        //Mostrarlo mediante un push navigation Controller
        navigationController?.pushViewController(episodeListViewController, animated: true)
    }
}
