//
//  ChattingListViewController.swift
//  TravelTalk
//
//  Created by 박준우 on 1/10/25.
//

import UIKit

class ChattingListViewController: UIViewController {

    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
    }
    
    func configureNavigationItem() {
        navigationItem.title = "TRAVEL TALK"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        navigationItem.scrollEdgeAppearance = appearance
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.delegate = self
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요."
        searchController.searchBar.tintColor = UIColor.black
    }
}

extension ChattingListViewController: UISearchControllerDelegate {
}
