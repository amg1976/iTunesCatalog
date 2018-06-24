//
//  ClientApiTests.swift
//  iTunesCatalogTests
//
//  Created by Adriano Goncalves on 24/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import XCTest
@testable import iTunesCatalog

class ClientApiTests: XCTestCase {
    
    func testFetchingMoviesSucceeds() {
        
        let expectation = XCTestExpectation(description: "Fetch movies")
        
        let clientApi = ClientApi(withResourceLoader: MoviesResourceLoader())
        
        clientApi.getMovies { result in
            if case let Result.succeeded(movieList) = result {
                XCTAssert(type(of: movieList) == ListResponse<Movie>.self, "Expected ListResponse<Movie> type")
            } else {
                XCTFail("Expected Result.succeeded")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchingMoviesHandlesParseError() {
        
        let expectation = XCTestExpectation(description: "Fetch movies")
        
        let clientApi = ClientApi(withResourceLoader: ErroredResourceLoader())
        
        clientApi.getMovies { result in
            if case let Result.errored(error) = result {
                switch error {
                case NetworkError.parseError:
                    XCTAssertTrue(true)
                default:
                    XCTFail("Expected NetworkError.parseError")
                }
            } else {
                XCTFail("Expected Result.errored")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchingMoviesHandlesNetworkError() {
        
        let expectation = XCTestExpectation(description: "Fetch movies")
        
        let clientApi = ClientApi(withResourceLoader: NetworkErroredResourceLoader())
        
        clientApi.getMovies { result in
            if case let Result.errored(error) = result {
                let nsError = error as NSError
                XCTAssertEqual(nsError.domain, "com.amg.itunescatalog.error")
                XCTAssertEqual(nsError.code, 100)
            } else {
                XCTFail("Expected Result.errored")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchingSongsSucceeds() {
        
        let expectation = XCTestExpectation(description: "Fetch songs")
        
        let clientApi = ClientApi(withResourceLoader: SongsResourceLoader())
        
        clientApi.getSongs { result in
            if case let Result.succeeded(songList) = result {
                XCTAssert(type(of: songList) == ListResponse<Song>.self, "Expected ListResponse<Song> type")
            } else {
                XCTFail("Expected Result.succeeded")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchingSongsHandlesParseError() {
        
        let expectation = XCTestExpectation(description: "Fetch songs")
        
        let clientApi = ClientApi(withResourceLoader: ErroredResourceLoader())
        
        clientApi.getSongs { result in
            if case let Result.errored(error) = result {
                switch error {
                case NetworkError.parseError:
                    XCTAssertTrue(true)
                default:
                    XCTFail("Expected NetworkError.parseError")
                }
            } else {
                XCTFail("Expected Result.errored")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchingSongsHandlesNetworkError() {
        
        let expectation = XCTestExpectation(description: "Fetch songs")
        
        let clientApi = ClientApi(withResourceLoader: NetworkErroredResourceLoader())
        
        clientApi.getSongs { result in
            if case let Result.errored(error) = result {
                let nsError = error as NSError
                XCTAssertEqual(nsError.domain, "com.amg.itunescatalog.error")
                XCTAssertEqual(nsError.code, 100)
            } else {
                XCTFail("Expected Result.errored")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

}
