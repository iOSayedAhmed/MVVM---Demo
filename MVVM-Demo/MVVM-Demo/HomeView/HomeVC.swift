//
//  HomeVC.swift
//  MVVM-Demo
//
//  Created by iOSayed on 31/10/2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    private let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        
    }
    func setupBinders() {
        viewModel.welcomeMessage.bind { [weak self] message in
            self?.welcomeLabel.text = message
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.getLoggedIn()
    }


}
