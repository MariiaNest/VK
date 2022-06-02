//
//  ViewController.swift
//  TableViewTest
//
//  Created by Maria on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Mark", "Irina", "Ivan", "Dasha", "Artem", "Olga", "Nikita", "Mark", "Irina", "Ivan", "Dasha", "Artem", "Olga", "Nikita", "Mark", "Irina", "Ivan", "Dasha", "Artem", "Olga", "Nikita", "Mark", "Irina", "Ivan", "Dasha", "Artem", "Olga", "Nikita", "Mark", "Irina", "Ivan", "Dasha", "Artem", "Olga", "Nikita", "Mark", "Irina", "Ivan", "Dasha", "Artem", "Olga", "Nikita"]
    let reuseIdentifier = "reuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row % 1 == 0 {
        return 70
//    }
//    return 30
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print ("select \(indexPath.row) row")
    }
    
    
}



extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
//        cell.textLabel?.text = names [indexPath.row]
//        if indexPath.row % 2 == 0 {
//            cell.fotoImageView.image = UIImage(systemName: "heart")
//            cell.nameLabel.text = names[indexPath.row]
//        } else {
//            cell.descriptionLabel.text = "description"
//            cell.fotoImageView.image = UIImage(systemName: "heart.fill")
//        }
        
//        cell.nameLabel.text = names[indexPath.row]
//        cell.descriptionLabel.text = "description"
        
        cell.configure(image: indexPath.row % 2 == 0 ? UIImage(systemName: "heart"): nil, name: indexPath.row % 2 == 0 ? names[indexPath.row]: nil, discription: indexPath.row % 2 == 0 ? nil : names[indexPath.row])
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        names.remove(at: indexPath.row)
       tableView.deleteRows(at: [indexPath], with: .top)
//        tableView.reloadData()
    }
    
}
