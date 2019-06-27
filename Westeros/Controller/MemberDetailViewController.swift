//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 27/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
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
