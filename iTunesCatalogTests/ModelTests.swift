//
//  iTunesCatalogTests.swift
//  iTunesCatalogTests
//
//  Created by Adriano Goncalves on 19/06/2018.
//  Copyright © 2018 Adriano Goncalves. All rights reserved.
//

import XCTest

class ModelTests: XCTestCase {
    
    func testParseMovies() {
        let jsonMovies = JsonFileLoader.loadMovies()
        let moviesResource = ResourceFactory.createListMoviesResource()
        let list: ListResponse? = moviesResource.parse(jsonString: jsonMovies)
        
        XCTAssertNotNil(list)
        XCTAssertEqual(list!.feed.title, "Top Films")
        XCTAssertEqual(list!.feed.results.count, 50)
        XCTAssertEqual(list!.feed.results.first!.name, "Black Panther (2018)")
    }

    func testParseSongs() {
        let jsonSongs = JsonFileLoader.loadSongs()
        let songsResource = ResourceFactory.createListSongsResource()
        let list: ListResponse? = songsResource.parse(jsonString: jsonSongs)
        
        XCTAssertNotNil(list)
        XCTAssertEqual(list!.feed.title, "Today's Hits")
        XCTAssertEqual(list!.feed.results.count, 50)
        XCTAssertEqual(list!.feed.results.first!.name, "Shotgun")
    }

}
