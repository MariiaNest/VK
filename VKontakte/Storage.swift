//
//  Storage.swift
//  VKontakte
//
//  Created by Maria on 19.05.2022.
//

import UIKit

class Storage: NSObject {
    static let shared = Storage() //записываем ссылку на класс Storage в свойство shared
    
    private override init(){
        super.init()
    }
    // если нужно создать single tone для хранения, лучше сделать свойства приватными
    private var myGroups = [Group]() // мы можем использовать этот массив из любого места программы
    
    func getMyGroups() -> [Group] {
        return myGroups
    }
    
    func addGroups(group: Group) {
        myGroups.append(group)
    }
}
