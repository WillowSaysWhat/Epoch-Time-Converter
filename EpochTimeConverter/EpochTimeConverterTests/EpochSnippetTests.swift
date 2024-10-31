//
//  EpochSnippetTests.swift
//  EpochTimeConverterTests
//
//  Created by Huw Williams on 03/09/2024.
//

import XCTest
@testable import EpochTimeConverter
final class EpochSnippetTests: XCTestCase {

    func testSetEpoch() {
        // Given (Arrange)
        
        let dateInfo = DateFormatter()
        
        dateInfo.dateFormat = "dd/MM/yyyy HH:mm"
        dateInfo.timeZone = TimeZone(secondsFromGMT: 0)
        
        
        let date = dateInfo.date(from: "01/01/2024 09:00")
        let tag = "long"
        let controller = HomeViewController()
        controller.date = date ?? Date.now
        // When (ACT)
        let epoch = controller.setEpoch(tag: tag)
        let checkEpoch = "<t:1704099600:f>"
        // Then (Assert)
        XCTAssertEqual(epoch, checkEpoch)
        
    }

}

