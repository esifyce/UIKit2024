//
//  Library.swift
//  ReaderWritersProblem
//
//  Created by Krasivo on 08.12.2023.
//

import Foundation

class Library: MyMonitor {
    private var booksInLibrary: [Book]

    override init() {
        booksInLibrary = [
            Book(id: 1, author: "Лев Толстой", title: "Война и мир том 1", numberOnShelf: 10),
            Book(id: 2, author: "Лев Толстой", title: "Война и мир том 2", numberOnShelf: 10),
            Book(id: 3, author: "Тургенев", title: "Отцы и дети", numberOnShelf: 10),
            Book(id: 4, author: "Генри Дэвид Торо", title: "Уолден", numberOnShelf: 10),
            Book(id: 5, author: "Айтматов", title: "Плаха", numberOnShelf: 10),
            Book(id: 6, author: "Марк Твен", title: "Приключения Тома Сойера", numberOnShelf: 10),
            Book(id: 7, author: "Пушкин", title: "Дубровский", numberOnShelf: 10),
            Book(id: 8, author: "Лермонтов", title: "Герой нашего времени", numberOnShelf: 10),
            Book(id: 9, author: "Жюль Верн", title: "Дети капитана Гранта", numberOnShelf: 10),
            Book(id: 10, author: "Артур Конан Дойл", title: "Записки о Шерлоке Холмсе", numberOnShelf: 10),
            Book(id: 11, author: "Гоголь", title: "Мертвые души", numberOnShelf: 10)
        ]
        super.init()
    }

    func askForBook(id: Int) -> Bool {
        startReading()

        let desiredBook = booksInLibrary.first { $0.id == id }
        let ok = desiredBook != nil

        endReading()

        return ok
    }

    func getBook(id: Int) -> String? {
        startWriting()

        if let desiredBook = booksInLibrary.first(where: { $0.id == id && $0.numberOnShelf > 0 }) {
            desiredBook.numberOnShelf -= 1
            endWriting()

            return desiredBook.description
        } else {
            endWriting()
            return nil
        }
    }
}
