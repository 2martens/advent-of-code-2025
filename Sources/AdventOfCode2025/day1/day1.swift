//
//  day1.swift
//  AdventOfCode2025
//
//  Created by Jim Martens on 01.12.25.
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

import Foundation

struct Instruction {
    let isLeft: Bool
    let steps: Int
}

struct Wheel {
    let lowestPosition: Int
    let highestPosition: Int
    let numberOfPositions: Int
    var currentPosition: Int
    var numberOfZeroRestPositions: Int = 0
    var numberOfZeroPassPositions: Int = 0
    
    init() {
        self.currentPosition = 50
        self.lowestPosition = 0
        self.highestPosition = 99
        self.numberOfPositions = 100
    }
    
    init(currentPosition: Int, lowestPosition: Int, highestPosition: Int) {
        self.currentPosition = currentPosition
        self.lowestPosition = lowestPosition
        self.highestPosition = highestPosition
        self.numberOfPositions = highestPosition - lowestPosition + 1
    }
    
    mutating func turn(left: Bool, amount: Int) {
        let normalizedAmount: Int = amount % numberOfPositions
        let completeTurns: Int = amount / numberOfPositions
        numberOfZeroPassPositions += completeTurns
        
        let previousPosition = currentPosition
        currentPosition += left ? -normalizedAmount : normalizedAmount
        if currentPosition < lowestPosition {
            currentPosition += numberOfPositions
            if previousPosition != 0 && currentPosition != 0 {
                numberOfZeroPassPositions += 1
            }
        }
        
        if currentPosition > highestPosition {
            currentPosition -= numberOfPositions
            if previousPosition != 0 && currentPosition != 0 {
                numberOfZeroPassPositions += 1
            }
        }
        
        if currentPosition == 0 {
            numberOfZeroRestPositions += 1
        }
    }
}

@available(macOS 13, *)
func readWheelInstructions(_ baseDirectory: URL) throws -> [Instruction] {
    var resultInstructions = [Instruction]()
    let filePath = baseDirectory.appending(path: "inputs/day1.csv")
    let instructions = try String(contentsOf: filePath, encoding: .utf8)
    instructions.split(separator: "\n").forEach { line in
        let index = line.index(after: line.startIndex)
        let direction = line[line.startIndex..<index]
        let steps = line[index...]
        let isLeft = direction == "L"
        let instruction = Instruction(isLeft: isLeft, steps: Int(steps)!)
        resultInstructions.append(instruction)
    }
    
    return resultInstructions
}

@available(macOS 13, *)
func day1(_ baseDirectory: URL) throws {
    let instructions = try readWheelInstructions(baseDirectory)
    var wheel = Wheel()
    instructions.forEach { instruction in
        wheel.turn(left: instruction.isLeft, amount: instruction.steps)
    }
    
    print("Number of zero rest positions")
    print(wheel.numberOfZeroRestPositions)
    
    print("Number of zero pass positions")
    print(wheel.numberOfZeroPassPositions)
    
    let total = wheel.numberOfZeroPassPositions + wheel.numberOfZeroRestPositions
    print("Number of total zero positions")
    print(total)
}

