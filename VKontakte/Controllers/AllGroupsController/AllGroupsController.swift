//
//  AllGroupsController.swift
//  VKontakte
//
//  Created by Maria on 05.04.2022.
//

import UIKit

class AllGroupsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let reuseIdentifier = "reuseIdentifier"
    var sourceGroupsArray = [Group]() //нужно, что бы сохранить начальное состояние данных для поиска
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        createGroupsArray()
        groupsArray = sourceGroupsArray
        tableView.reloadData()
    }

    func createGroupsArray(){
       let group1 = Group(avatarImagePath: "group1", name: "Friends forever", description: "description")
        sourceGroupsArray.append(group1)
        let group2 = Group(avatarImagePath: "group2", name: "Jokes every day", description: "description")
        sourceGroupsArray.append(group2)
        let group3 = Group(avatarImagePath: "group3", name: "Like-minded club", description: "description")
        sourceGroupsArray.append(group3)
        let group4 = Group(avatarImagePath: "group4", name: "Painting by numbers", description: "description")
        sourceGroupsArray.append(group4)
        let group5 = Group(avatarImagePath: "group5", name: "Let your worries carry unicorns into the forest", description: "description")
        sourceGroupsArray.append(group5)
        let group6 = Group(avatarImagePath: "group6", name: "Anime fan club", description: "description")
        sourceGroupsArray.append(group6)
        let group7 = Group(avatarImagePath: "group7", name: "Mickey Mouse fan", description: "description")
        sourceGroupsArray.append(group7)
        let group8 = Group(avatarImagePath: "group8", name: "Puppies", description: "description")
        sourceGroupsArray.append(group8)
    }
}
// расширение для поисковика
extension AllGroupsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){ // вызывается каждый раз, когда что-то меняется в строке писка
        if searchText.isEmpty {
            groupsArray = sourceGroupsArray
        }
        else {
            groupsArray = sourceGroupsArray.filter({ groupItem in
                groupItem.name.lowercased().contains(searchText.lowercased())
            })
        }
//        обновление tableView
        tableView.reloadData()
    }
    
}
    

extension AllGroupsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70
    }
    
    //       еще одна альтернативная запись проверки группы на уникальность
    func isContain(group: Group) -> Bool {
        for item in Storage.shared.getMyGroups() {
            if item.name == group.name {
                return true
            }
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("selected \(groupsArray[indexPath.row].name) group")
//         NotificationCenter.default.post(name: allGroupsRowPressed, object: groupsArray[indexPath.row])
        if !isContain(group: groupsArray[indexPath.row]){ // условие добавления группы в myGroups
//        Storage.shared.myGroups.append(groupsArray[indexPath.row]) // выводим массив групп
            Storage.shared.addGroups(group: groupsArray[indexPath.row]) // используем single tone
        }
    }
}

extension AllGroupsController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(group: groupsArray[indexPath.row])
        return cell
    }
}
