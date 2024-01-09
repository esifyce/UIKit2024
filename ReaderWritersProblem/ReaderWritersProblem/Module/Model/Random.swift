//
//  Random.swift
//  ReaderWritersProblem
//
//  Created by Krasivo on 08.12.2023.
//

import Foundation

class Random {
    func nextInt(upperBound: Int) -> Int {
        return Int.random(in: 0..<upperBound)
    }
}
