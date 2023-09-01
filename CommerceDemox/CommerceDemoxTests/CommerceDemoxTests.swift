//
//  CommerceDemoxTests.swift
//  CommerceDemoxTests
//
//  Created by Consultant on 7/20/23.
//

import XCTest
@testable import CommerceDemox

final class CommerceDemoxTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenTheUrlIsInvalid() async throws {
        let vm = await ProductsListViewModel(networkManager: NetworkManager())
        await vm.getDevicesResponseList(urlString: "")
        let items = await vm.productsResponseList["default"]?.products
        let number = items?.count ?? 0
        let error = await vm.customError
        XCTAssertEqual(error, NetworkError.invalidUrlError)
    }
    
    func testWhenYouDontHaveData() async throws {
        let vm = await ProductsListViewModel(networkManager: NetworkManager())
        await vm.getDevicesResponseList(urlString: ApiManager.api(.search(text: "jkagskjhasgdj")))
        let items = await vm.productsResponseList["default"]?.products
        let number = items?.count ?? 0
        XCTAssertEqual(number, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
