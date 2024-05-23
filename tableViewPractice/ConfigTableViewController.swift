//
//  ConfigTableViewController.swift
//  tableViewPractice
//
//  Created by 유철원 on 5/23/24.
//

import UIKit

class ConfigTableViewController: UITableViewController {
    
    private let sections: [String] = ["전체 설정" , "개인 설정", "기타"]
    
    private let allConfigItems = ["공지사항", "실험실", "버전 정보"]
    private let privateConfigItems = ["개인/보안", "알림", "채팅", "멀티프로필"]
    private let etcItems = ["고객센터/도움말"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "configTable")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTableViewUI()
    }
    
    func setTableViewUI() {
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .darkGray
        tableView.sectionHeaderTopPadding = 30
        for section in 0...sections.count-1 {
            
            if let header = tableView.headerView(forSection: section) {
                header.frame.size = CGSize(width: 150, height: 20)
                header.textLabel?.font = .systemFont(ofSize: 20)
                header.textLabel?.textColor = .darkGray
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        var rows: Int = 0
        
        switch section {
        case 0: rows = allConfigItems.count
        case 1: rows = privateConfigItems.count
        case 2: rows = etcItems.count
        default: rows = 0
        }
        
        return rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var rowList: [String] = []
        
        switch indexPath.section {
        case 0: rowList = allConfigItems
        case 1: rowList = privateConfigItems
        case 2: rowList = etcItems
        default: rowList = []
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "configTable") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = rowList[indexPath.row]
        cell.textLabel?.textColor = .lightGray
        cell.backgroundColor = .black
        
        return cell
    }

}
