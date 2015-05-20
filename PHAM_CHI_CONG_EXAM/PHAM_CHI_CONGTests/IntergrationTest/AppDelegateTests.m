//
//  AppDelegateTests.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/29/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EmployeesViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Constants.h"
//#import "LoginViewControllerTests.m"

/**
 * Todo list:

 */

@interface AppDelegateTests : XCTestCase

@property (strong, nonatomic) AppDelegate *testedAppDelegate;

@end

@implementation AppDelegateTests

- (void)setUp {
    [super setUp];
    self.testedAppDelegate = kAppDelegate;
}

- (void)tearDown {
    self.testedAppDelegate = nil;
    [super tearDown];
}

- (void)testGetAppDelegate_ShouldReturnTrue_WhenCallInstance {
    //GIVEN in setUp
    
    //WHEN + THEN
    XCTAssertNotNil(self.testedAppDelegate, @"Test get app delegate");
}

@end
