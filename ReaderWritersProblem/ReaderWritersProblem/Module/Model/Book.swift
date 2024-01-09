//
//  Book\.swift
//  ReaderWritersProblem
//
//  Created by Krasivo on 08.12.2023.
//

import Foundation

class Book {
    var id: Int
    var title: String
    var author: String
    var numberOnShelf: Int

    init(id: Int, author: String, title: String, numberOnShelf: Int) {
        self.id = id
        self.title = title
        self.author = author
        self.numberOnShelf = numberOnShelf
    }

    var description: String {
        return "ID: \(id) Книга: \(title) Автор: \(author) Доступно: \(numberOnShelf)"
    }
}
