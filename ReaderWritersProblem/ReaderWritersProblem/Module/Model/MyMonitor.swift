//
//  MyMonitor.swift
//  ReaderWritersProblem
//
//  Created by Krasivo on 08.12.2023.
//

import Foundation

class MyMonitor {
    private var isWriting = false
    private var readers = 0
    private var waitingReaders = 0
    private var waitingWriters = 0

    private let canRead = NSCondition()
    private let canWrite = NSCondition()

    func startReading() {
        canRead.lock()
        if isWriting || waitingWriters > 0 {
            waitingReaders += 1
            canRead.wait()
            waitingReaders -= 1
        }
        readers += 1
        canRead.signal()
        canRead.unlock()
    }

    func endReading() {
        canWrite.lock()
        readers -= 1
        if readers == 0 {
            canWrite.signal()
        }
        canWrite.unlock()
    }

    func startWriting() {
        canWrite.lock()
        if readers > 0 || isWriting {
            waitingWriters += 1
            canWrite.wait()
            waitingWriters -= 1
        }
        isWriting = true
        canWrite.unlock()
    }

    func endWriting() {
        isWriting = false
        if waitingReaders > 0 {
            canRead.lock()
            canRead.signal()
            canRead.unlock()
        } else {
            canWrite.lock()
            canWrite.signal()
            canWrite.unlock()
        }
    }
}
