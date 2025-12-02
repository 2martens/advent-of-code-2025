//
//  day2.swift
//  AdventOfCode2025
//
//  Created by Jim Martens on 02.12.25.
//

import Testing
@testable import AdventOfCode2025


struct Day2Tests {
    
    @Test(
        arguments: [111111, 123123, 99, 11, 1010, 999]
    ) func shouldIdentifyAsInvalid(id: Int) async throws {
        let isInvalid = ProductIDRange.isInvalidID(id)
        
        #expect(isInvalid == true)
    }
    
    @Test(
        arguments: [(11, 22, 2), (1188511880, 1188511890, 1)]
    ) func shouldCountInvalidIDs(start: Int, end: Int, count: Int) async throws {
        var productRange = ProductIDRange(start: start, end: end)
        
        productRange.identifyInvalidIDs()
        
        #expect(productRange.getNumberOfInvalidIDs() == count)
    }
}
