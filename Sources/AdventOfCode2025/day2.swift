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

struct ProductIDRange {
    let start: Int
    let end: Int
    var invalidIDs: [Int] = []
    
    /// You need to call identifyInvalidIDs first.
    func getNumberOfInvalidIDs() -> Int {
        invalidIDs.count
    }
    
    mutating func identifyInvalidIDs() {
        let range = start...end
        let invalidIDs = range.filter(ProductIDRange.isInvalidID)
        self.invalidIDs = Array(invalidIDs)
    }
    
    static func isInvalidID(_ id: Int) -> Bool {
        let idAsString = String(id)
        let middleIndex = idAsString.index(idAsString.startIndex, offsetBy: idAsString.count / 2)
        let firstHalf = idAsString[..<middleIndex]
        let secondHalf = idAsString[middleIndex...]
        
        return firstHalf == secondHalf
    }
}

func day2(_ baseDirectory: URL) throws {
    let filePath = baseDirectory.appending(path: "inputs/day2.txt")
    let instructions = try String(contentsOf: filePath, encoding: .utf8)
    var invalidIDs: [Int] = []
    
    instructions.trimmingCharacters(in: ["\n"]).split(separator: ",").forEach { instruction in
        let parts = instruction.split(separator: "-")
        let start = Int(parts[0])!
        let end = Int(parts[1])!
        
        var range = ProductIDRange(start: start, end: end)
        range.identifyInvalidIDs()
        invalidIDs.append(contentsOf: range.invalidIDs)
    }
    
    let sum = Set(invalidIDs).reduce(0, +)
    print("The sum of invalid IDs: \(sum)")
}
