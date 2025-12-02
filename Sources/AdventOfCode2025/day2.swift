//
//  day2.swift
//  AdventOfCode2025
//
//  Created by Jim Martens on 02.12.25.
//  Copyright 2025 Jim Martens
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//

import Foundation

func day2(_ baseDirectory: URL) throws {
    let filePath = baseDirectory.appending(path: "inputs/day2.txt")
    let instructions = try String(contentsOf: filePath, encoding: .utf8)

    let startPart1 = Date()
    let sumPart1 = calculateSumOfInvalidIDs(
        instructions,
        filter: isInvalidPart1
    )
    let endPart1 = Date()
    let durationPart1: TimeInterval = endPart1.timeIntervalSince(startPart1)
    print("The sum of invalid IDs part 1: \(sumPart1)")
    print("Time taken part 1: \(durationPart1) seconds")

    let startPart2 = Date()
    let sumPart2 = calculateSumOfInvalidIDs(
        instructions,
        filter: isInvalidPart2
    )
    let endPart2 = Date()
    let durationPart2: TimeInterval = endPart2.timeIntervalSince(startPart2)
    print("The sum of invalid IDs part 2: \(sumPart2)")
    print("Time taken part 2: \(durationPart2) seconds")
}

struct ProductIDRange {
    let start: Int
    let end: Int
    let invalidFilter: (Int) -> Bool
    var invalidIDs: [Int] = []

    /**
     Returns number of invalid IDs
    
     - Returns: count of invalid IDs as identified by `invalidFilter`
     - Precondition: You need to call `identifyInvalidIDs` first
     */
    func getNumberOfInvalidIDs() -> Int {
        invalidIDs.count
    }

    mutating func identifyInvalidIDs() {
        let range = start...end
        let invalidIDs = range.filter(invalidFilter)
        self.invalidIDs = Array(invalidIDs)
    }
}

func isInvalidPart1(_ id: Int) -> Bool {
    let idAsString = String(id)
    let middleIndex = idAsString.index(
        idAsString.startIndex,
        offsetBy: idAsString.count / 2
    )
    let firstHalf = idAsString[..<middleIndex]
    let secondHalf = idAsString[middleIndex...]

    return firstHalf == secondHalf
}

func isInvalidPart2(_ id: Int) -> Bool {
    let idAsString = String(id)

    for offset in 1...Int(ceil(Double(idAsString.count) / 2.0)) {
        let index = idAsString.index(idAsString.startIndex, offsetBy: offset)
        let segment = idAsString[..<index]
        var remaining: any StringProtocol = idAsString
        repeat {
            remaining = remaining.dropFirst(segment.count)
        } while remaining.hasPrefix(segment) && remaining.count >= segment.count
        
        if remaining.isEmpty {
           return true
        }
    }

    return false
}

func calculateSumOfInvalidIDs(
    _ instructions: String,
    filter: @escaping (Int) -> Bool
) -> Int {
    var invalidIDs: [Int] = []

    instructions.trimmingCharacters(in: ["\n"]).split(separator: ",").forEach {
        instruction in
        let parts = instruction.split(separator: "-")
        let start = Int(parts[0])!
        let end = Int(parts[1])!

        var range = ProductIDRange(
            start: start,
            end: end,
            invalidFilter: filter
        )
        range.identifyInvalidIDs()
        invalidIDs.append(contentsOf: range.invalidIDs)
    }

    let sum = Set(invalidIDs).reduce(0, +)

    return sum
}
