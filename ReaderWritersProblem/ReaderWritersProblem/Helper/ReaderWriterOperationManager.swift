//
//  ReadWritesManager.swift
//  ReaderWritersProblem
//
//  Created by Krasivo on 08.12.2023.
//

import UIKit

class ReaderWriterOperationManager {
    let readerQueue = OperationQueue()
    let writerQueue = OperationQueue()
    let MAX = OperationQueue.defaultMaxConcurrentOperationCount
    
    init () {
        // Все читатели должны выполняться параллельно
        readerQueue.maxConcurrentOperationCount = MAX
        
        // Все писатели должны выполняться последовательно
        writerQueue.maxConcurrentOperationCount = 1
    }
    
    func addReaderOperation(operation: BlockOperation) {
        // Каждый новый читатель должен дождаться выполнения всех писателей
        // С остальными читателями он выполняется параллельно
        for writerOperation in writerQueue.operations {
            operation.addDependency(writerOperation)
        }
        readerQueue.addOperation(operation)
    }
    
    func addWriterOperation(operation: BlockOperation) {
        // Последовательность выполнения писателей обеспечивается самой очередь
        // Всем существующим читателям добавляется зависимость на нового писателя
        for readerOperation in readerQueue.operations {
            readerOperation.addDependency(operation)
        }
        writerQueue.addOperation(operation)
    }
    
    //  Набор вспомогательных методов для демонстрации работы Scheduler'а
    func addReader(index: Int) {
        let operation = BlockOperation.init(block: {
            // Для большей убедительности заставим операции выполняться подольше
            sleep(1)
            print("Reader \(index) освобожден")
        })
        addReaderOperation(operation: operation)
    }
    
    func addWriter() {
        let operation = BlockOperation.init(block: {
            // Даем писателю больше времени на выполнение, чтобы убедиться в правильности расстановки приоритетов
            sleep(2)
            print("Writer освобожден")
        })
        addWriterOperation(operation: operation)
    }
}
