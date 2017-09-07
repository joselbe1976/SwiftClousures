//
//  ShopTest.swift
//  MadridShopsTests
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 7/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import XCTest
import MadridShops


 class ShopTest: XCTest {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGivenEmptyShopsNumberShopsIsZero(){
        let sut = Shops()
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenEmptyShopsNumberShopsIsNotZero(){
        let sut = Shops()
        sut.add(shop: Shop(name: "Corte Ingles"))
        XCTAssertEqual(1, sut.count())
    }
    
}
