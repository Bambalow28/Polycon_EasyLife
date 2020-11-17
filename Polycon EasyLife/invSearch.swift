//
//  invSearch.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-11-16.
//

import UIKit

class invSearch: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchView.layer.cornerRadius = 10
        searchBar.layer.cornerRadius = 10
        searchBtn.layer.cornerRadius = 10
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
            tap.numberOfTapsRequired = 1
            view.addGestureRecognizer(tap)

    }
    
    @objc func tapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
