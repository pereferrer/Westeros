//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 27/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

final class MemberDetailViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var aliasLabel: UILabel!
    
    private var model: Person
    
    init(model: Person){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    deinit {
        self.unsubscribeNotifications()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
        self.subscribeToNotifications()
    }
}

extension MemberDetailViewController{
    private func syncModelWithView(){
        fullNameLabel.text = model.fullName
        nameLabel.text = model.name
        houseLabel.text = model.house.name
        aliasLabel.text = model.alias
    }
}


//Parte de la solucion Podeis hacer algo para que, en ese caso, se muestre de nuevo la lista de members de la casa que has seleccionado
extension MemberDetailViewController{
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
        if let vc = navigationController?.viewControllers.filter({ $0 is MemberListViewController }).first {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
}

