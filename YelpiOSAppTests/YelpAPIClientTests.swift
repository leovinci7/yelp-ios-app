//
//  YelpAPIClientTests.swift
//  YelpiOSAppTests
//
//  Created by Medhad Ashraf Islam on 16/4/23.
//

import XCTest
import YelpiOSApp

final class YelpAPIClientTests: XCTestCase {

    var apiClient: YelpAPIClient!
    // Test API key
    let apiKey = "PjRMoYB90qb67Mi_VlBdJspiSoF3WnrbzvXVZusNU3PenhCd-81afiV8n4YAeIl0q8_CxGTbDaamTsA-4bmrSGBcPb2E3L7GSVCiNcH10nSFK-Zq6H027ePZevg6ZHYx"
    
    override func setUpWithError() throws {
        super.setUp()
        apiClient = YelpAPIClient(apiKey: apiKey)
    }

    override func tearDownWithError() throws {
        apiClient = nil
        super.tearDown()
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchBusinesses() {
           let expectation = self.expectation(description: "Search businesses")
           apiClient.searchBusinesses(location: "Toronto", categories: "restaurants", sortBy: "best_match", limit: 10) { result in
               switch result {
               case .success(let businesses):
                   XCTAssertNotNil(businesses)
                   XCTAssertTrue(businesses.count > 0)
                   expectation.fulfill()
               case .failure(let error):
                   XCTFail("Search businesses failed with error: \(error)")
               }
           }
           waitForExpectations(timeout: 10, handler: nil)
       }
    
    
    func testGetBusinessDetails() {
            let businessId = "r_BrIgzYcwo1NAuG9dLbpg"
            let expectation = self.expectation(description: "Get business details")
            apiClient.getBusinessDetails(businessId: businessId) { result in
                switch result {
                case .success(let businessDetails):
                    XCTAssertNotNil(businessDetails)
                    XCTAssertEqual(businessDetails.id, businessId)
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Get business details failed with error: \(error)")
                }
            }
            waitForExpectations(timeout: 10, handler: nil)
        }

    
    
    

}
