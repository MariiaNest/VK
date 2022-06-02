//
//  FriendsViewController.swift
//  VKontakte
//
//  Created by Maria on 01.06.2022.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friendsArray = [Friend]()
    let reuseIdentifier = "reuseIdentifier"
    let fromFriendsToGallery = "fromFriendsToGallery"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        createFriendsArray()
        tableView.reloadData()
    }
    
    func createFriendsArray(){
        let friend1 = Friend(name: "Anna", avatar: "friend1", foto: ["foto1", "foto2"])
        friendsArray.append(friend1)
        let friend2 = Friend(name: "Ivan", avatar: "friend2", foto: ["foto3", "foto4"])
        friendsArray.append(friend2)
        let friend3 = Friend(name: "Mia", avatar: "friend3", foto: ["foto5"])
        friendsArray.append(friend3)
        let friend4 = Friend(name: "Mark", avatar: "friend4", foto: ["foto6"])
        friendsArray.append(friend4)
        let friend5 = Friend(name: "Helga", avatar: "friend5", foto: ["foto7", "foto8"])
        friendsArray.append(friend5)
        let friend6 = Friend(name: "Stive", avatar: "friend6", foto: ["foto9"])
        friendsArray.append(friend6)
        let friend7 = Friend(name: "Emily", avatar: "friend7", foto: ["foto10"])
        friendsArray.append(friend7)
        let friend8 = Friend(name: "Anastasia", avatar: "friend8", foto: nil)
        friendsArray.append(friend8)
    }
    
//вмешиваемся в работу segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToGallery {
            guard let destinationVC = segue.destination as? GalleryViewController,
                  let fotoArray = sender as? [String]
            else {return}
            
            destinationVC.fotoArray = fotoArray
        }
    }
}


extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("selected \(friendsArray[indexPath.row].name) friend")
        performSegue(withIdentifier: fromFriendsToGallery, sender: friendsArray[indexPath.row].foto)//активируем segue
    }
}

extension FriendsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(friend: friendsArray[indexPath.row])
        return cell
    }
}
