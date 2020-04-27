//
//  NetworkTesting.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/27/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

//: Playground - noun: a place where people can play

import UIKit
//import XCTest
//import PlaygroundSupport
import Foundation


class MockSession: URLSession {

    var completionHandler: ((Data, URLResponse, Error) -> Void)?
    static var mockResponse: (data: Data?, URLResponse: URLResponse?, error: Error?)

    override class var shared: URLSession {
        return MockSession()
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.completionHandler = completionHandler
        return MockTask(response: MockSession.mockResponse, completionHandler: completionHandler)
    }

}


class MockTask: URLSessionDataTask {

    typealias Response = (data: Data?, URLResponse: URLResponse?, error: Error?)
    var mockResponse: Response
    let completionHandler: ((Data?, URLResponse?, Error?) -> Void)?

    init(response: Response, completionHandler: ((Data?, URLResponse?, Error?) -> Void)?) {
        self.mockResponse = response
        self.completionHandler = completionHandler
    }

    override func resume() {
        completionHandler!(mockResponse.data, mockResponse.URLResponse, mockResponse.error)
    }
}


//func testRetrieveProductsValidResponse() {
//    // we have a locally stored product list in JSON format to test against.
//    let testBundle = Bundle(forClass: type(of: self))
//    let filepath = testBundle.pathForResource("products", ofType: "txt")
//    let data = Data(contentsOfFile: filepath!)
//    let urlResponse = HTTPURLResponse(url: URL(string: "https://anyurl.doesntmatter.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
//    // setup our mock response with the above data and fake response.
//    MockSession.mockResponse = (data, urlResponse: urlResponse, error: nil)
//    //MARK: Create Request
//    let requestsClass = RequestManager()
//    // All our network calls are in here.
//    requestsClass.Session = MockSession.self
//    // Replace NSURLSession with our own MockSession.
//    // We still need to test as if it's asynchronous. Because well, it is.
//    //MARK: Test Expectation
//    let expectation = XCTestExpectation(description: "ready")
//    // For this test, no need to pass in anything useful since it doesn't affect our mocked response.
//    // This particular function fetches JSON, converts it to custom objects, and returns them.
//    requestsClass.retrieveProducts("N/A", products: { (products) -> () in //1h40
//        XCTAssertTrue(products.count == 7)
//        expectation.fulfill()
//    }) { (error) -> () in //1h43
//        XCTAssertFalse(error == Errors.NetworkError, "Its a network error")
//        XCTAssertFalse(error == Errors.ParseError, "Its a parsing error")
//        XCTFail("Error not covered by previous asserts.")
//        expectation.fulfill()
//    }
//    //MARK: Test for 3 seconds
//    waitForExpectations(timeout: 3.0, handler: nil)
//}
