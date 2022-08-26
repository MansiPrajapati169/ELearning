//
//  ELearningTests.swift
//  ELearningTests
//
//  Created by Mansi Prajapati on 30/04/22.
//

import XCTest
@testable import ELearning

class ELearningTests: XCTestCase {

    //MARK: - Variables
    var signUpViewModel: SignUpViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        signUpViewModel = SignUpViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        signUpViewModel = nil
    }

    
    func test_Name_Is_Empty() throws {
        XCTAssertFalse(
            signUpViewModel.validateUserInput (
                signupModel: SignupModel(name: "", email: "mansi@gmail.com", password: "Mansi@Jimin7")
            ),
            "Name is empty"
        )
    }
    
    func test_Email_Is_Empty() throws {
        XCTAssertFalse(
            signUpViewModel.validateUserInput (
                signupModel: SignupModel(name: "mansi", email: "", password: "Mansi@Jimin7")
            ),
            "Email is empty"
        )
    }
    
    func test_Password_Is_Empty() throws {
        XCTAssertFalse(
            signUpViewModel.validateUserInput (
                signupModel: SignupModel(name: "mansi", email: "mansi@gmail.com", password: "")
            ),
            "Password is empty"
        )
    }
    
    func test_Password_Is_Short() throws {
        XCTAssertFalse(
            signUpViewModel.validateUserInput (
                signupModel: SignupModel(name: "mansi", email: "mansi@gmail.com", password: "Jimin")
            ),
            "Password is short"
        )
    }
    
    func test_Valid_Credentials() throws {
         XCTAssert(
            signUpViewModel.validateUserInput(
                 signupModel: SignupModel(name: "mansi", email: "mansi@gmail.com", password: "Mansi@Jimin7")),
             "Credentials are valid"
         )
     }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
