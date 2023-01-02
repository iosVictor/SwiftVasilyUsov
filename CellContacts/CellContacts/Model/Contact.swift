//
//  Contact.swift
//  CellContacts
//
//  Created by Victor Kimpel on 2.01.23.
//

protocol ContactProtocol {
    /// Имя
    var title: String { get set }
    /// Номер телефона
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    var title: String
    var phone: String
}


