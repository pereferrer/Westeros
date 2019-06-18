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
    private let model: House
    
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
