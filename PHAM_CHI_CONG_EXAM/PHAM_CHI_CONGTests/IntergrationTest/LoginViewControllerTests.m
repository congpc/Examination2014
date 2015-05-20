//
//  LoginViewControllerTests.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/29/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LoginViewController.h"
#import "EmployeesViewController.h"
#import "AppDelegate.h"
#import "Constants.h"

/**
 * Todo list:
 * - Test username property, should return correct content, when input a username.
 * - Test password property, should return correct content, when input a password.
 * - Test input username, should return false, when input username is nil and password is not nil.
 * - Test input username, should return false, when input username is zero length and password is not nil.
 * - Test input password, should return false, when input password is nil and username is not nil.
 * - Test input password, should return false, when input password is zero length and username is not nil.
 * - Test login fail, should return false, when input wrong username and password.
 * - Test login successful, should return true, when input right username and password.
 * - Test display two alert view, should return true, when two alert view are displayed.
 
 * - Test get app delegate, should return true, when call delegate instance.
 * - Test check login status, should return false, when not login.
 * - Test check login status, should return true, when was logined.
 */
@interface LoginViewControllerTests : XCTestCase

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) LoginViewController *loginViewController;
@property (strong, nonatomic) UIView *loginView;
@property (strong, nonatomic) EmployeesViewController *employeesViewController;


@end

@implementation LoginViewControllerTests
@synthesize appDelegate;
@synthesize loginViewController;
@synthesize loginView;
@synthesize employeesViewController;

- (void)setUp {
    [super setUp];
    self.appDelegate = kAppDelegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:STORYBOARD_NAME bundle:nil];
    self.loginViewController = [storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_LOGIN_VIEW_CONTROLLER];
    self.employeesViewController = [storyboard instantiateViewControllerWithIdentifier:STORYBOARD_ID_EMPLOYEES_VIEW_CONTROLLER];
    self.loginView = self.loginViewController.view;
}

- (void)tearDown {
    self.appDelegate = nil;
    self.loginViewController = nil;
    self.employeesViewController = nil;
    self.loginView = nil;
    [super tearDown];
}

#pragma mark - Helpers

#pragma mark - Tests
- (void)testGetAppDelegate_ShouldReturnTrue_WhenCallInstance {
    //GIVEN in setUp
    
    //WHEN + THEN
    XCTAssertNotNil(self.appDelegate, @"Test get app delegate");
}

- (void)testLoginViewController_ShouldReturnTrue_WhenCallInstance {
    //GIVEN in setUp
    
    //WHEN + THEN
    XCTAssertNotNil(self.loginViewController, @"Test object not nil");
}
- (void)testEmployeesViewController_ShouldReturnTrue_WhenCallInstance {
    //GIVEN in setUp
    
    //WHEN + THEN
    XCTAssertNotNil(self.employeesViewController, @"Test object not nil");
}

- (void)testUsernameProperty_ShouldReturnCorrectContent_WhenInputAUsername {
    //GIVEN
    NSString *expected = @"Cong";
    
    //WHEN
    UITextField *usernameTextField = (UITextField*)[loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = @"Cong";
    
    //THEN
    XCTAssertEqualObjects(self.loginViewController.usernameTextField.text, expected, @"Test property");
}
- (void)testPasswordProperty_ShouldReturnCorrectContent_WhenInputAPassword {
    //GIVEN
    NSString *expected = @"Cong";
    
    //WHEN
    UITextField *passwordTextField = (UITextField*)[loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = @"Cong";
    
    //THEN
    XCTAssertEqualObjects(self.loginViewController.passwordTextField.text, expected, @"Test property");
}

- (void)testInputUsername_ShouldReturnFalse_WhenInputUsernameIsNilAndPasswordIsNotNil {
    //GIVEN
    UITextField *usernameTextField = (UITextField*)[loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = nil;
    UITextField *passwordTextField = (UITextField*)[loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = @"Cong";
    
    //WHEN
    UIButton *loginButton = (UIButton*)[loginView viewWithTag:TAG_LOGIN_BUTTON];
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNotNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
}
- (void)testInputUsername_ShouldReturnFalse_WhenInputUsernameIsZeroLengthAndPasswordIsNotNil {
    //GIVEN
    UITextField *usernameTextField = (UITextField*)[loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = @"";
    UITextField *passwordTextField = (UITextField*)[loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = @"Cong";
    
    //WHEN
    UIButton *loginButton = (UIButton*)[loginView viewWithTag:TAG_LOGIN_BUTTON];
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNotNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
}
- (void)testInputPassword_ShouldReturnFalse_WhenInputPasswordIsNilAndUsernameIsNotNil {
    //GIVEN
    UITextField *usernameTextField = (UITextField*)[loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = @"";
    UITextField *passwordTextField = (UITextField*)[loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = nil;
    
    //WHEN
    UIButton *loginButton = (UIButton*)[loginView viewWithTag:TAG_LOGIN_BUTTON];
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNotNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
}
- (void)testInputPassword_ShouldReturnFalse_WhenInputPasswordIsZeroLengthAndUsernameIsNotNil {
    //GIVEN
    UITextField *usernameTextField = (UITextField*)[self.loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = @"Cong";
    UITextField *passwordTextField = (UITextField*)[self.loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = @"";
    
    //WHEN
    UIButton *loginButton = (UIButton*)[self.loginView viewWithTag:TAG_LOGIN_BUTTON];
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNotNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
}
- (void)testLoginFail_ShouldReturnFalse_WhenInputWrongUsernameAndPassword {
    //GIVEN
    UITextField *usernameTextField = (UITextField*)[self.loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = @"Cong";
    UITextField *passwordTextField = (UITextField*)[self.loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = @"Cong";
    
    //WHEN
    UIButton *loginButton = (UIButton*)[self.loginView viewWithTag:TAG_LOGIN_BUTTON];
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNotNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
}
- (void)testLoginSuccessful_ShouldReturnTrue_WhenInputRightUsernameAndPassword {
    //GIVEN
    UITextField *usernameTextField = (UITextField*)[self.loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = @"hieu";
    UITextField *passwordTextField = (UITextField*)[self.loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = @"hieu";
    
    //WHEN
    UIButton *loginButton = (UIButton*)[self.loginView viewWithTag:TAG_LOGIN_BUTTON];
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
}
- (void)testLoginFail_ShouldReturnFalse_WhenTwoAlertViewAreDisplayed {
    //GIVEN
    UITextField *usernameTextField = (UITextField*)[self.loginView viewWithTag:TAG_USERNAME_TEXTFIELD];
    usernameTextField.text = @"";
    UITextField *passwordTextField = (UITextField*)[self.loginView viewWithTag:TAG_PASSWORD_TEXTFIELD];
    passwordTextField.text = @"Cong";
    
    //WHEN
    UIButton *loginButton = (UIButton*)[self.loginView viewWithTag:TAG_LOGIN_BUTTON];
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNotNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
    
    //GIVEN
    usernameTextField.text = @"Cong";
    passwordTextField.text = @"";
    
    //WHEN
    [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    //THEN
    XCTAssertNotNil(self.loginViewController.warningAlertView, @"Test alert view displayed!");
}

- (void)testLoginStatus_ShouldReturnFalse_WhenNotLogin {
    //GIVEN
    BOOL expected = NO;
    
    //WHEN
    BOOL result = [self.appDelegate checkLoginStatus:self.employeesViewController];
    
    //THEN
    XCTAssertEqual(expected, result);
}

- (void)testLoginStatus_ShouldReturnTrue_WhenWasLogined {
    //GIVEN
    BOOL expected = YES;
    //Login system
    [self testLoginSuccessful_ShouldReturnTrue_WhenInputRightUsernameAndPassword];
    
    //WHEN
    BOOL result = [self.appDelegate checkLoginStatus:self.employeesViewController];
    
    //THEN
    XCTAssertEqual(expected, result);
}
@end
