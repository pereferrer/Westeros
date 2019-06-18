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

        // Do any additional setup after loading the view.
    }
}

//Todo: Implementar los protocolos delegate y datasource
