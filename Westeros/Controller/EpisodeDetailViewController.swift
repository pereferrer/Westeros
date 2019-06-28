//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

final class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var fechaEmisionLabel: UILabel!
    @IBOutlet weak var temporadaLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private var model: Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.titulo
    }
    
    deinit {
        unsubscribeNotifications()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        descriptionTextView.isEditable = false
        subscribeToNotifications()
        syncModelWithView()
    }
}

extension EpisodeDetailViewController{
    private func syncModelWithView(){
        fechaEmisionLabel.text = model.fechaEmision.description
        temporadaLabel.text = model.season?.nombre
        descriptionTextView.text = model.resumen
    }
}


extension EpisodeDetailViewController{
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
        if let vc = navigationController?.viewControllers.filter({ $0 is EpisodeListViewController }).first {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
}
