//
//  main.swift
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

@main
@available(macOS 13, *)
struct AdventOfCode {

    @available(macOS 13, *)
    static func main() {
        print("Advent of code 2025.")
        var xcodePath = determineWorkingDirectory()
        let day = determineDay()

        do {
            try performDay(xcodePath, day)
        } catch {
            print("The input could not be found.")
            xcodePath = determineWorkingDirectory()
            try! performDay(xcodePath, day)
        }
    }

    @available(macOS 13, *)
    static func performDay(_ xcodePath: URL, _ day: String) throws {
        let startingTime = Date()

        switch day {
        case "day1":
            try day1(xcodePath)
        default:
            fatalError("Unknown day: \(day)")
        }

        let endTime = Date()
        let timeInterval: TimeInterval = endTime.timeIntervalSince(startingTime)
        print("Time taken: \(timeInterval) seconds.")
    }

    static func determineWorkingDirectory() -> URL {
        print("Please provide directory of advent-of-code-2025 repository:")
        let workingDirectoryURL = URL(
            fileURLWithPath: readLine(strippingNewline: true) ?? "~"
        )
        let xcodePath = URL(
            string: "\(workingDirectoryURL)"
        )!
        return xcodePath
    }

    static func determineDay() -> String {
        print("Please choose day. Available: day1")
        return readLine(strippingNewline: true) ?? "day1"
    }

}
