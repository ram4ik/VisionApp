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
    
    
    func testTextRecognizeDifferentDocuments() throws {
        
        for document in differentDocuments {
            let list = sdk.getListOfRecognizedText(image: UIImage(named: document)!)
            
            XCTAssertTrue(!list.isEmpty)
        }
        
    }
    
    func testHumanRecognizeWithDifferentDocuments() throws {
        
        for document in differentDocuments {
            let response: () = sdk.getRecognizedHuman(image: UIImage(named: document)!)
            
            print(response)
        }
    }

}
