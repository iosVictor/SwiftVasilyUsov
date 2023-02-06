//
//  TasksStorage.swift
//  To-Do Manager
//
//  Created by Victor Kimpel on 6.02.23.
//

import Foundation

// Протокол, описывающий сущность "Хранилище задач"
protocol TaskStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

// Сущность "Хранилище задач"
class TaskStorage: TaskStorageProtocol {
    func loadTasks() -> [TaskProtocol] {
        // временная реализация, возвращающая тестовую коллекцию задач
        let testTasks: [TaskProtocol] = [
            Task(title: "Выучить АйТи", type: .normal, status: .planned),
            Task(title: "Сполоснуть джонсон", type: .important, status: .planned),
            Task(title: "Подкачаться к лету", type: .important, status: .completed),
            Task(title: "Стать успешным", type: .normal, status: .completed),
            Task(title: "Зарабатывать в интернете без усилий", type: .important, status: .planned),
            Task(title: "Поглотить дыню", type: .important, status: .planned)
        ]
        return testTasks
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {
        <#code#>
    }
    
    
}
