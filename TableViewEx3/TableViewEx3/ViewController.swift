//
//  ViewController.swift
//  TableViewEx3
//
//  Created by runnysun on 2022/10/13.
//

import UIKit

class ViewController: UIViewController {
    let flags = ["ec", "sn", "nl", "qa", "gb-wls", "ir", "us", "gb-eng", "sa", "pl", "mx", "ar", "au", "tn", "dk", "fr", "cr", "jp", "de", "es", "ca", "ma", "hr", "be", "cm", "rs", "ch", "br", "gh", "kr", "uy", "pt"]
    
    let countries = ["Ecuador", "Senegal", "Netherlands", "Qatar", "Wales", "Iran", "USA", "England", "Saudi Arabia", "Poland", "Mexico", "Argentina", "Australia", "Tunisia", "Denmark", "France", "Costa Rica", "Japan", "Germany", "Spain", "Canada", "Morocco", "Croatia", "Belgium", "Cameroon", "Serbia", "Switzerland", "Brazil", "Ghana", "South Korea", "Uruguay", "Portugal"]
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
extension ViewController: UITableViewDataSource {func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
//        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
//        if cell == nil {
//            cell = UITableViewCell()
//        }
//        //let cell1 = cell!
//        guard let cell1 = cell else{
//            fatalError()
//        }
        //재활용 코드2 메인가서 cell추가 후 identifier 이름 cell로 적기
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = countries[indexPath.row]
        content.textProperties.font = UIFont.systemFont(ofSize: 20)
        content.textProperties.color = .blue
        content.image = UIImage(named:flags[indexPath.row])
        content.imageProperties.maximumSize.width = 100
        content.imageProperties.maximumSize.height = 80
        content.secondaryText = "Qatar2022"
        content.secondaryTextProperties.color = .red
        cell.contentConfiguration = content
//        switch indexPath.row % 5{
//        case 0: cell1.accessoryType = .none
//        case 1: cell1.accessoryType = .checkmark
//        case 2: cell1.accessoryType = .detailButton
//        case 3: cell1.accessoryType = .disclosureIndicator
//        case 4: cell1.accessoryType = .detailDisclosureButton
//        default : cell?.accessoryType = .none
//        }
        if indexPath.row % 2 == 0 {
            cell.accessoryView = UIImageView(image: UIImage(systemName: "steamed"))
        }else{
            cell.accessoryView = UIImageView(image: UIImage(systemName: "steamed_on"))
        }
     
        return cell
    }
    
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        label.text = countries[indexPath.row]
    }
}
