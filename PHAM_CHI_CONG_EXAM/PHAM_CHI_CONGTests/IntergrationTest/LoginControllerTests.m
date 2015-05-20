//
//  AccountantLoginTest.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LoginController.h"
#import "NSString+IPaSecurity.h"
#import "User.h"

/*
 Todo list:
 - Test login fuction, Should Return False, When Username And Password Are Nil Value
 - Test login fuction, Should Return False, When Username Is Nil Value And Password Is Valid Value
 - Test login fuction, Should Return False, When Username Is Valid Value And Password Is Nil Value
 - Test login fuction, Should Return False, When Username Is Valid Value And Password Is Invalid Value
 - Test login fuction, Should Return False, When Username Is Zero Length And Password Is Valid Value
 - Test login fuction, Should Return False, When Username Is Invalid Length And Password Is Valid Value
 - Test login fuction, Should Return False, When Username Valid Value And Password Is Zero Length
 - Test login fuction, Should Return False, When Username Valid Value And Password Is Invalid Length
 - Test login fuction, Should Return False, When Username Valid Value And Password Is Valid Value And Non Accountant Type
 - Test login fuction, Should Return True, When Username Valid Value And Password Is Valid Value And Accountant Type
 - Test login fuction, Should Return False, When Username IsSQLInjection Value And Password Is SQLInjection Value
 */


@interface LoginControllerTests : XCTestCase {
    LoginController *_loginController;
    User *_user;
}

@end

@implementation LoginControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _loginController = [[LoginController alloc] init];
    _user = [[User alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _loginController = nil;
    _user = nil;
}

- (void)testShouldReturnFalse_WhenUsernameAndPasswordAreNilValue {
    //GIVEN
    _user.username = nil;
    _user.password = nil;
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameIsNilValueAndPasswordIsValidValue {
    //GIVEN
    _user.username = nil;
    _user.password = @"hieu";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameIsValidValueAndPasswordIsNilValue {
    //GIVEN
    _user.username = @"hieu";
    _user.password = nil;
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameIsValidValueAndPasswordIsInvalidValue {
    //GIVEN
    _user.username = @"cong";
    _user.password = @"cong";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameIsZeroLengthAndPasswordIsValidValue {
    //GIVEN
    _user.username = @"";
    _user.password = @"hieu";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameIsInvalidLengthAndPasswordIsValidValue {
    //GIVEN
    _user.username = @"123456789012345678901234567890123";
    _user.password = @"hieu";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameValidValueAndPasswordIsZeroLength {
    //GIVEN
    _user.username = @"hieu";
    _user.password = @"";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameValidValueAndPasswordIsInvalidLength {
    //GIVEN
    _user.username = @"hieu";
    _user.password = @"12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnFalse_WhenUsernameValidValueAndPasswordIsValidValueAndNonAccountantType {
    //GIVEN
    _user.username = @"long";
    _user.password = @"long";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}
- (void)testShouldReturnTrue_WhenUsernameValidValueAndPasswordIsValidValueAndAccountantType {
    //GIVEN
    _user.username = @"hieu";
    _user.password = @"hieu";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertTrue(result);
}
- (void)testShouldReturnFalse_WhenUsernameIsSQLInjectionValueAndPasswordIsSQLInjectionValue {
    //GIVEN
    _user.username = @"hieu' or '1'='1;";
    _user.password = @"hieu' or '1'='1;";
    
    //WHEN
    BOOL result = [_loginController signInWithUser:_user];
    
    //THEN
    XCTAssertFalse(result);
}

@end
