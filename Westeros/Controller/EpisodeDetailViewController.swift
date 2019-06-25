//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Pere Josep Ferrer Ventura on 25/06/2019.
//  Copyright © 2019 Pere Josep Ferrer Ventura. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var fechaEmisionLabel: UILabel!
    @IBOutlet weak var temporadaLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private var model: Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.titulo
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        descriptionTextView.isEditable = false
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

//Mark: - Episode List View Controller Delegate
extension EpisodeDetailViewController: EpisodeListViewControllerDelegate{
    func episodeListViewController(_ viewController: EpisodeListViewController, didSelectSeason episode: Episode) {
        model = episode
        syncModelWithView()
    }
}

