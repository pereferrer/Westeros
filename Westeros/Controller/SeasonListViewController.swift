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

class SeasonListViewController: UIViewController {
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "SeasonCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let season = model[indexPath.row]
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        //Sincronizar model(casa) y la vista(celda)
        cell.textLabel?.text = season.nombre
        cell.detailTextLabel?.text = "Fecha de lanzamiento: \(season.fechaLanzamiento)"
        
        //Devolver la celda
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Averiguar que Season se ha pulsado
        let season = model[indexPath.row]
        
        //Crear el wiki vc
        let seasonDetailViewController = SeasonDetailViewController(model: season)
        
        //Mostrarlo mediante un push navigation Controller
        navigationController?.pushViewController(seasonDetailViewController, animated: true)
    }
}

