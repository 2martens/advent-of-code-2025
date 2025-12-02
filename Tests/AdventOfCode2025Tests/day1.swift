//
//  Test.swift
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

import Testing
@testable import AdventOfCode2025

struct Day1Tests {

    @Test func shouldCountZeroRestPositions() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        var wheel = Wheel()
        let instructions = [
            Instruction(isLeft: false, steps: 50),
            Instruction(isLeft: false, steps: 100),
            Instruction(isLeft: true, steps: 50),
        ]
        
        instructions.forEach {
            wheel.turn(left: $0.isLeft, amount: $0.steps)
        }
        
        #expect(wheel.numberOfZeroRestPositions == 2)
    }
    
    @Test func shouldCountZeroPassPositions() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        var wheel = Wheel()
        let instructions = [
            Instruction(isLeft: false, steps: 100),
            Instruction(isLeft: true, steps: 50),
            Instruction(isLeft: true, steps: 1),
            Instruction(isLeft: true, steps: 100),
        ]
        
        instructions.forEach {
            wheel.turn(left: $0.isLeft, amount: $0.steps)
        }
        
        #expect(wheel.numberOfZeroPassPositions == 2)
    }

}
