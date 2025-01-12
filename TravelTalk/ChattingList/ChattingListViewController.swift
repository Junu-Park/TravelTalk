//
//  ChattingListViewController.swift
//  TravelTalk
//
//  Created by 박준우 on 1/10/25.
//

import UIKit

class ChattingListViewController: UIViewController {

    let searchController = UISearchController()
    
    let allChattingList: [ChatRoom] = mockChatList
    
    var filteredChattingList: [ChatRoom] {
        let checkedSearchText = checkSearchText(searchController.searchBar.text)
        
        if checkedSearchText == "" {
            return allChattingList
        } else {
            let filteredChattings = allChattingList.filter { chatting in
                chatting.chatroomUser.contains { user in
                    return user.rawValue.lowercased().contains(checkedSearchText)
                } || chatting.chatroomName.lowercased().contains(checkedSearchText)
            }
            return filteredChattings
        }
    }
    
    @IBOutlet weak var chattingListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureCollectionView()
    }
    
    func checkSearchText(_ text: String?) -> String {
        if let searchText = text?.lowercased() {
            return searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            return ""
        }
    }
    
    func configureNavigationItem() {
        navigationItem.title = "TRAVEL TALK"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.searchController = searchController
        setSearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

// TODO: UISearchBar의 text가 빈 문자열일 때, enter키를 누르면 UISearchBar isActive = false로 만들기(키보드는 내려가는데,,,)
// TODO: Keyboard가 dismiss되면 UISearchBar isActive = false로 만들기
extension ChattingListViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    func setSearchController() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요."
        searchController.searchBar.tintColor = UIColor.black
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        chattingListCollectionView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        chattingListCollectionView.reloadData()
    }
}

extension ChattingListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCollectionView() {
        chattingListCollectionView.delegate = self
        chattingListCollectionView.dataSource = self
        chattingListCollectionView.keyboardDismissMode = .onDrag
        
        let xib = UINib(nibName: ChattingListCollectionViewCell.id, bundle: nil)
        chattingListCollectionView.register(xib, forCellWithReuseIdentifier: ChattingListCollectionViewCell.id)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 9)
        
        chattingListCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredChattingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChattingListCollectionViewCell.id, for: indexPath) as! ChattingListCollectionViewCell
        
        DispatchQueue.main.async {
            cell.imageView.layer.cornerRadius = cell.imageView.frame.width / 2
        }
        
        cell.imageView.image = UIImage(named: filteredChattingList[indexPath.item].chatroomImage[0])
        cell.nameLabel.text = filteredChattingList[indexPath.item].chatroomName
        cell.lastChatLabel.text = filteredChattingList[indexPath.item].chatList.last?.message
        cell.dataLabel.text = filteredChattingList[indexPath.item].chatList.last?.date.getyyMMddDateString()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function, indexPath)
    }
}
