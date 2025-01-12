//
//  ChattingRoomViewController.swift
//  TravelTalk
//
//  Created by 박준우 on 1/10/25.
//

import UIKit

class ChattingRoomViewController: UIViewController {

    static let id = "ChattingRoomViewController"
    
    var chattingData: ChatRoom?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var chattingEnterSuperView: UIView!
    @IBOutlet weak var chattingEnterView: UIView!
    
    @IBOutlet weak var chattingEnterTextView: UITextView!
    
    @IBOutlet weak var chattingEnterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
        configureChattingEnterView()
        configureKeyboardLayout()
    }
    
    func configureNavigationItem() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = chattingData?.chatroomName ?? "알수없음"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    func configureChattingEnterView() {
        chattingEnterView.backgroundColor = UIColor.systemGray4
        chattingEnterView.layer.cornerRadius = 15
        chattingEnterButton.tintColor = UIColor.systemGray6
        chattingEnterTextView.tintColor = UIColor.black
        chattingEnterTextView.backgroundColor = UIColor.clear
        chattingEnterTextView.delegate = self
    }
    
    // TODO: TableView도 함께 올리기
    func configureKeyboardLayout() {
        view.keyboardLayoutGuide.topAnchor.constraint(equalTo: chattingEnterView.bottomAnchor, constant: 16).isActive = true
    }
    @IBAction func enterChat(_ sender: UIButton) {
//        view.endEditing(true)
        let chat = Chat(user: User.user, date: Date().getyyyyMMddHHmmDateString(), message: chattingEnterTextView.text)
        chattingData?.chatList.append(chat)
        chattingEnterTextView.text = ""
        tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: IndexPath(row: (self.chattingData?.chatList.count ?? 1) - 1 , section: 0), at: .bottom, animated: true)
        }
    }
}

extension ChattingRoomViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        tableView.bottomAnchor.constraint(equalTo: chattingEnterSuperView.topAnchor).isActive = true
        tableView.contentOffset = .init(x: 0, y: chattingEnterSuperView.frame.origin.y)
    }
}

extension ChattingRoomViewController: UITableViewDataSource, UITableViewDelegate {
    
    func configureTableView() {
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "MyChattingTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "MyChattingTableViewCell")
        let xib2 = UINib(nibName: "OtherChattingTableViewCell", bundle: nil)
        tableView.register(xib2, forCellReuseIdentifier: "OtherChattingTableViewCell")
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: IndexPath(row: (self.chattingData?.chatList.count ?? 1) - 1 , section: 0), at: .bottom, animated: false)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingData?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let chatData = chattingData?.chatList[indexPath.row] {
            if chatData.user == .user {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyChattingTableViewCell", for: indexPath) as! MyChattingTableViewCell
                cell.chatLabel.text = chatData.message
                cell.dateLabel.text = chatData.date.getHHmmDateString()
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OtherChattingTableViewCell", for: indexPath) as! OtherChattingTableViewCell
                
                DispatchQueue.main.async {
                    cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width / 2
                }
                cell.nameLabel.text = chatData.user.rawValue
                cell.chatLabel.text = chatData.message
                cell.dateLabel.text = chatData.date.getHHmmDateString()
                cell.profileImage.image = UIImage(named: chatData.user.profileImage)
                return cell
            }
        } else {
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
