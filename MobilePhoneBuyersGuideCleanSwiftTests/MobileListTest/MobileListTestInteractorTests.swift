//
//  MobileListTestInteractorTests.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 5/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

@testable import MobilePhoneBuyersGuideCleanSwift
import XCTest

class MobileListTestInteractorTests: XCTestCase {

  // MARK: - Subject under test

  var sut: MobileListTestInteractor!

  // MARK: - Test lifecycle

  override func setUp() {
    super.setUp()
    setupMobileListTestInteractor()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Test setup

  func setupMobileListTestInteractor() {
    sut = MobileListTestInteractor()
  }

  // MARK: - Test doubles

  // MARK: - Tests

  func testSomething() {
    // Given

    // When

    // Then
  }
}
