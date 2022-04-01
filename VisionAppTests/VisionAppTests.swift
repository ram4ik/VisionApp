//
//  VisionAppTests.swift
//  VisionAppTests
//
//  Created by ramil on 26.03.2022.
//

import XCTest
@testable import VisionApp
@testable import VisionAppSDK

class VisionAppTests: XCTestCase {

    let sdk = VisionSDK()
    let differentDocuments = ["1", "2", "3", "4", "5", "6", "7"]
    
    
    func testDifferentDocuments() throws {
        
        for document in differentDocuments {
            let list = sdk.getListOfRecognizedText(image: UIImage(named: document)!)
            
            XCTAssertTrue(!list.isEmpty)
        }
        
    }

}
