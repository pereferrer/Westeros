//
//  WikiViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 18/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit
import WebKit

final class WikiViewController: UIViewController {
    
    //Mark: Outlets
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    //Mark Properties
    private var model: House
    
    //Mark: Initialization
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asignar delegados
        webView.navigationDelegate = self
        syncModelWithView()
        
        //Siempre que nos subscribirnos, debemos desubscribirnos
        subscribeToNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeNotifications()
    }
}

extension WikiViewController{
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
        
        guard let house = dictionary[HouseListViewController.Constants.houseKey] as? House else{
            return
        }
        
        //Actualizar modelo
        self.model = house
        
        //Sincronizar modelo y vista
        syncModelWithView()
    }
}

extension WikiViewController {
    private func syncModelWithView(){
        title = model.name
        
        //Mostramos y arrancamos loading
        loadingView.isHidden = false
        loadingView.startAnimating()
        //Cargar URL
        let request = URLRequest(url: model.wikiURL)
        webView.load(request)
    }
}

extension WikiViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //Detener
        loadingView.stopAnimating()
        
        //ocultar
        loadingView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated:
            decisionHandler(.cancel)
        case .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}
