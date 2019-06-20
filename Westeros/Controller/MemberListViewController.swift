//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 19/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit



class MemberListViewController: UIViewController {

    //Mark: -Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: Properties
    let model: [Person]
    
    //Mark-: Initialization
    init(model: [Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: Life ccle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
}

//Todo: Implementar los protocolos delegate y datasource

extension MemberListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let member = model[indexPath.row]
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        //Sincronizar model(casa) y la vista(celda)
        cell.textLabel?.text = member.fullName
        
        //Devolver la celda
        return cell
    }
    
    
}
