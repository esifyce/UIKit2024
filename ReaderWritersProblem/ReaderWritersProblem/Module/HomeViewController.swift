//
//  HomeViewController.swift
//  ReaderWritersProblem
//
//  Created by Krasivo on 06.12.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let library = Library()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let reader1Queue = DispatchQueue(label: "Вася", qos: .background)
        let reader2Queue = DispatchQueue(label: "Петя", qos: .background)
        let reader3Queue = DispatchQueue(label: "Саша", qos: .background)
        let reader4Queue = DispatchQueue(label: "Коля", qos: .background)
        let reader5Queue = DispatchQueue(label: "Миша", qos: .background)
        
        reader1Queue.async { self.actionsInLibrary(threadName: "Вася") }
        reader2Queue.async { self.actionsInLibrary(threadName: "Петя") }
        reader3Queue.async { self.actionsInLibrary(threadName: "Саша") }
        reader4Queue.async { self.actionsInLibrary(threadName: "Коля") }
        reader5Queue.async { self.actionsInLibrary(threadName: "Миша") }
    }
    
    
}

// MARK: - Private methods

private extension HomeViewController {
    func actionsInLibrary(threadName: String) {
        let random = Random()
        for _ in 0..<50 {
            let bookId = random.nextInt(upperBound: 20) + 1
            
            if library.askForBook(id: bookId) {
                if let book = library.getBook(id: bookId) {
                    print("\(threadName) : есть в наличии \(book)")
                } else {
                    print("\(threadName) : книги с id \(bookId) нет в наличии")
                }
            } else {
                print("\(threadName) : книга с id \(bookId) не найдена")
            }
            
            Thread.sleep(forTimeInterval: 1.5)
        }
    }
}
