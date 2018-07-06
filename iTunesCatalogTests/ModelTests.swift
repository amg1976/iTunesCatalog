//
//  iTunesCatalogTests.swift
//  iTunesCatalogTests
//
//  Created by Adriano Goncalves on 19/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import XCTest
@testable import iTunesCatalog

struct AnyItem: FeedItem {
    let id: String
    let name: String
    let artistName: String
    let artworkUrl100: String
}

func createMockResource() -> Resource<ListResponse<AnyItem>> {
    return Resource<ListResponse<AnyItem>>(withUrl: "https://apple.com", httpMethod: .get)
}

class ModelTests: XCTestCase {
    
    let jsonLoader = JsonFileLoader(withBundle: Bundle(for: ModelTests.self))
    
    func testParseMovies() {
        let jsonMovies = jsonLoader.movies()
        let moviesResource = ResourceFactory.createListMoviesResource()
        let list: ListResponse? = moviesResource.parse(jsonString: jsonMovies)
        
        XCTAssertNotNil(list)
        XCTAssertEqual(list!.feed.title, "Top Films")
        XCTAssertEqual(list!.feed.results.count, 50)
        
        let firstItem = list!.feed.results.first!
        XCTAssertEqual(firstItem.id, "1342077359")
        XCTAssertEqual(firstItem.name, "Black Panther (2018)")
        XCTAssertEqual(firstItem.artworkUrl100, "https://is1-ssl.mzstatic.com/image/thumb/Video118/v4/7e/ae/6f/7eae6f6a-e11d-3221-4648-a0848fd2cf14/pr_source.lsr/200x200bb.png")
    }

    func testParseSongs() {
        let jsonSongs = jsonLoader.songs()
        let songsResource = ResourceFactory.createListSongsResource()
        let list: ListResponse? = songsResource.parse(jsonString: jsonSongs)
        
        XCTAssertNotNil(list)
        XCTAssertEqual(list!.feed.title, "Today's Hits")
        XCTAssertEqual(list!.feed.results.count, 50)

        let firstItem = list!.feed.results.first!
        XCTAssertEqual(firstItem.id, "1331589486")
        XCTAssertEqual(firstItem.name, "Shotgun")
        XCTAssertEqual(firstItem.artworkUrl100, "https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/a9/5c/67/a95c6764-ccf4-2e23-0a63-06332d2a2f98/source/200x200bb.png")
        XCTAssertEqual(firstItem.artistName, "George Ezra")
        XCTAssertEqual(firstItem.collectionName, "Staying at Tamara's")
    }
    
    func testInvalidResponseFailsToParse() {
        let jsonInvalid = jsonLoader.invalidResponse()
        let mockResource = createMockResource()
        
        let result = mockResource.parse(jsonString: jsonInvalid)
        XCTAssertNil(result)
    }

    func testInvalidFeedsFailsToParseResults() {
        let jsonInvalid = jsonLoader.invalidFeed()
        let mockResource = createMockResource()
        
        let result = mockResource.parse(jsonString: jsonInvalid)
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.feed.title, "Some feed")
        XCTAssertEqual(result!.feed.results.count, 0)
    }

    func testInvalidFeedItemReturnsEmptyResults() {
        let jsonInvalid = jsonLoader.invalidFeedItem()
        let mockResource = createMockResource()
        
        let result = mockResource.parse(jsonString: jsonInvalid)
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.feed.title, "Some feed")
        XCTAssertEqual(result!.feed.results.count, 0)
    }
}
