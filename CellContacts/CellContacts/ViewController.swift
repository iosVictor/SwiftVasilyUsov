//
//  ViewController.swift
//  CellContacts
//
//  Created by Victor Kimpel on 30.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var contacts = [ContactProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadContacts()
    }

    private func loadContacts() {
        contacts.append(
        Contact(title: "Катя Мачуга", phone: "+375298765432"))
        contacts.append(
        Contact(title: "Петя Синицын", phone: "+375298765433"))
        contacts.append(
        Contact(title: "Косой", phone: "+375298765434"))
        contacts.sort { $0.title < $1.title }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Используем старую ячейку для строки с индексом \(indexPath.row)")
            cell = reuseCell
        } else {
            print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }
        configure(cell: &cell, for: indexPath)
        return cell
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        // имя контакта
        configuration.text = contacts[indexPath.row].title
        // номер телефона контакта
        configuration.secondaryText = contacts[indexPath.row].phone
        cell.contentConfiguration = configuration
    }
}

