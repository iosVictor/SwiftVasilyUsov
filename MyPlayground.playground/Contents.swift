import Foundation

protocol MessageProtocol {
    // текст сообщения
    var text: String? { get set }
    // прикрепленное изображение
    var image: Data? { get set }
    // прикрепленный аудиофайл
    var audio: Data? { get set }
    // прикрепленный видеофайл
    var video: Data? { get set }
    // дата отправки
    var sendDate: Date { get set }
    // отправитель
    var senderID: UInt { get set }
}

struct Message: MessageProtocol {
    var text: String?
    var image: Data?
    var audio: Data?
    var video: Data?
    var sendDate: Date
    var senderID: UInt
}

protocol StatisticDelegate: AnyObject {
    func handle(message: MessageProtocol)
}

protocol MessengerProtocol {
    // массив всех сообщений
    var messages: [MessageProtocol] { get set }
    // делегат для ведения статистики
    var statisticDelegate: StatisticDelegate? { get set }
    // делегат для загрузки сообщения
    var dataSource: MessengerDataSourceProtocol? { get set }
    // инициализатор
    init()
    // принять сообщение
    mutating func receive(message: MessageProtocol)
    // отправить сообщение
    mutating func send(message: MessageProtocol)
}

class Messenger: MessengerProtocol {
    var messages: [MessageProtocol]
    weak var statisticDelegate: StatisticDelegate?
    
    weak var dataSource: MessengerDataSourceProtocol? {
        didSet {
            if let source = dataSource {
                messages = source.getMessages()
            }
        }
    }

    required init() {
        messages = []
    }

    func receive(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // прием сообщения
        // ...
    }

    func send(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // отправка сообщения
        // ...
    }
}

extension Messenger: StatisticDelegate {
    func handle(message: MessageProtocol) {
        // ...
        // обработка сообщения
        // ...
        print("обработка сообщения от User # \(message.senderID) завершена")
    }
}

//var messenger = Messenger()
//messenger.statisticDelegate = messenger.self
//
//messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))
//messenger.messages.count
//(messenger.statisticDelegate as! Messenger).messages.count


protocol MessengerDataSourceProtocol: AnyObject {
    func getMessages() -> [Message]
}

extension Messenger: MessengerDataSourceProtocol {
    func getMessages() -> [Message] {
        return [Message(text: "Как дела?", sendDate: Date(), senderID: 2)]
    }
}

var messenger = Messenger()
messenger.dataSource = messenger.self
messenger.messages.count
