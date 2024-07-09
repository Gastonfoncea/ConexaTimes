//
//  HomeViewModel_Tests.swift
//  ConexaTimes_Tests
//
//  Created by Gaston Foncea on 08/07/2024.
//

import XCTest
@testable import ConexaTimes


// Naming Structure: test_UnitOfWork_StateUnderState_ExpectedBehavior

//  Testing Structure: Given, When, Then
final class Service_Tests: XCTestCase {
    
    var homeViewModel: HomeViewModel!
    var usersViewModel: UsersViewModel!
    var service: Service!
    
    override func setUp() {
        super.setUp()
        service = Service()
        homeViewModel = HomeViewModel(service: service)
    }
    
    override func tearDown() {
        homeViewModel = nil
        service = nil
        super.tearDown()
    }
    
    //MARK: HomeViewMOdel-
    func testFetchNewsSuccess() {
        // Given
        
        // When
        let expectation = self.expectation(description: "Fetch 100 news success")
        homeViewModel.fetchAllNews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Then
            XCTAssertEqual(self.homeViewModel.arrayNews.count, 100)
            XCTAssertNil(self.homeViewModel.error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testFetchNewsFailure() {
        // Given
        // Simular un error en el servicio
        let failingService = MockServiceFailure(shouldReturnError: true)
        let viewModel = HomeViewModel(service: failingService)
        
        // When
        let expectation = self.expectation(description: "Fetch news failure")
        viewModel.fetchAllNews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Then
            XCTAssertEqual(viewModel.arrayNews.count, 0)
            XCTAssertNotNil(viewModel.error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    
    //MARK: UserViewModel -
    func testFetchUsersSucces() {
        let succesService = MockServiceSucces()
        let viewModel = UsersViewModel(service: succesService)
        
        let expectation = self.expectation(description: "Fetch Users Succes")
        viewModel.fetchAllUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(viewModel.users.count, 2)
            XCTAssertNil(viewModel.error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        
    }
    
    
    func testFetchUsersFailure() {
        let failinService = MockServiceFailure(shouldReturnError: true)
        let viewModel = UsersViewModel(service: failinService)
        
        let expectation = self.expectation(description: "Fetch users Failure")
        viewModel.fetchAllUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            XCTAssertEqual(viewModel.users.count, 0)
            XCTAssertNotNil(viewModel.error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        
    }
    
    
    
}
