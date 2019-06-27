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
    var model: [Person]
    
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
        
        //Siempre que nos subscribirnos, debemos desubscribirnos
        subscribeToNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeNotifications()
    }
}

extension MemberListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

//Mark: Table view data source
extension MemberListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let person = model[indexPath.row]
        
        //Crear una celda
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        //Sincronizar model(casa) y la vista(celda)
        cell.textLabel?.text = person.fullName
        cell.detailTextLabel?.text = person.alias
        
        //Devolver la celda
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averiguar que Miembro se ha pulsado
        let member = model[indexPath.row]
        
        //Crear el wiki vc
        let memberDetailVieController = MemberDetailViewController(model: member)
        
        //Mostrarlo mediante un push navigation Controller
        navigationController?.pushViewController(memberDetailVieController, animated: true)
    }
}

extension MemberListViewController{
    private func subscribeToNotifications(){
        let notificationCenter = NotificationCenter.default
        //Nos damos de alta de las notifications
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name.houseDidNotificationName, object: nil)//Objeto que envia la notification
    }
    
    private func unsubscribeNotifications(){
        //nos damos de baja de las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc private func houseDidChange(notification: Notification){
        //averiguar lacasa
        guard let dictionary = notification.userInfo else{
            return
        }
        
        guard let member = dictionary[HouseListViewController.Constants.houseKey] as? [Person] else{
            return
        }
        
        //Actualizar modelo
        self.model = member
        
        //Sincronizar modelo y vista
        tableView.reloadData()
    }
}
