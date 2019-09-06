//
//  MobileDetailTestInteractorTests.swift
//  MobilePhoneBuyersGuideCleanSwift
//
//  Created by Patchariya Piyaaromrat on 5/9/2562 BE.
//  Copyright (c) 2562 SCB. All rights reserved.
//

@testable import MobilePhoneBuyersGuideCleanSwift
import XCTest

class MobileDetailTestInteractorTests: XCTestCase {

  // MARK: - Subject under test

  var sut: MobileDetailTestInteractor!

  // MARK: - Test lifecycle

  override func setUp() {
    super.setUp()
    setupMobileDetailTestInteractor()
  }

  override func tearDown() {
    super.tearDown()
  }

  // MARK: - Test setup

  func setupMobileDetailTestInteractor() {
    sut = MobileDetailTestInteractor()
  }

  // MARK: - Test doubles

  // MARK: - Tests

  func testSomething() {
    // Given

    // When

    // Then
  }
}
