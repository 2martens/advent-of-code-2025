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
        arguments: [111111, 123123, 99, 11, 1010]
    ) func shouldIdentifyAsInvalidPart1(id: Int) async throws {
        let isInvalid = isInvalidPart1(id)
        
        #expect(isInvalid == true)
    }
    
    @Test(
        arguments: [111111, 121212, 999, 111, 1010, 2121212121]
    ) func shouldIdentifyAsInvalidPart2(id: Int) async throws {
        let isInvalid = isInvalidPart2(id)
        
        #expect(isInvalid == true)
    }
    
    @Test(
        arguments: [123412, 991, 121, 1011, 1698522, 1698523, 1698524]
    ) func shouldNotIdentifyAsInvalidPart2(id: Int) async throws {
        let isInvalid = isInvalidPart2(id)
        
        #expect(isInvalid == false)
    }
    
    @Test(
        arguments: [(11, 22, 2), (1188511880, 1188511890, 1), (2121212118, 2121212124, 0)]
    ) func shouldCountInvalidIDsPart1(start: Int, end: Int, count: Int) async throws {
        var productRange = ProductIDRange(start: start, end: end, invalidFilter: isInvalidPart1)
        
        productRange.identifyInvalidIDs()
        
        #expect(productRange.getNumberOfInvalidIDs() == count)
    }
    
    @Test(
        arguments: [(95, 115, 2), (565653, 565659, 1), (2121212118, 2121212124, 1), (1698522, 1698528, 0)]
    ) func shouldCountInvalidIDsPart2(start: Int, end: Int, count: Int) async throws {
        var productRange = ProductIDRange(start: start, end: end, invalidFilter: isInvalidPart2)
        
        productRange.identifyInvalidIDs()
        
        #expect(productRange.getNumberOfInvalidIDs() == count)
    }
}
