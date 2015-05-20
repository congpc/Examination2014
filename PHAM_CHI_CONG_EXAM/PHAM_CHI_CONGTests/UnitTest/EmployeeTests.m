//
//  EmployeeTests.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/27/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Employee.h"
#import "NormalEmployee.h"
#import "HourlyEmployee.h"
#import "SaleEmployee.h"

/**
 * Todo list:
 * - Test init object, should return not nil, when create object.
 *
 * - Test employeeId property by int value, should return the difference values, when input the difference values.
 * - Test employeeId property by int value, should return the same values, when input the same values.
 * - Test employeeType property by int value, should return the difference values, when input the difference values.
 * - Test employeeType property by int value, should return the same values, when input the same values.
 * - Test lastName property by string value, should return the difference values, when input the difference values.
 * - Test lastName property by string value, should return the same values, when input the same values.
 * - Test firstName property by string value, should return the difference values, when input the difference values.
 * - Test firstName property by string value, should return the same values, when input the same values.
 *
 * - Test calculate net salary, should return wrong value, when input default salary of Normal employee.
 * - Test calculate net salary, should return right value, when input default salary of Normal employee.
 * - Test calculate net salary, should return wrong value, when input default salary of Hourly employee.
 * - Test calculate net salary, should return right value, when input default salary of Hourly employee.
 * - Test calculate net salary, should return wrong value, when input default salary of Sale employee.
 * - Test calculate net salary, should return right value, when input default salary of Sale employee.
 */

@interface EmployeeTests : XCTestCase

@property (strong, nonatomic) Employee *employee;

@end

@implementation EmployeeTests

- (void)setUp {
    [super setUp];
    self.employee = [[Employee alloc] init];
}

- (void)tearDown {
    self.employee = nil;
    [super tearDown];
}


#pragma mark - Tests
- (void)testInitObject_ShouldReturnNotNil_WhenCreateObjectInSetUpMethod {
    //GIVEN + WHEN in setUp method
    
    //THEN
    XCTAssertNotNil(self.employee,@"Test object not instantiated!");
}
- (void)testEmployeeIdProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 22;
    
    //WHEN
    self.employee.employeeId = 20;
    
    //THEN
    XCTAssertNotEqual(expected, self.employee.employeeId,@"Test the difference values!");
}
- (void)testEmployeeIdProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    int expected = 22;
    
    //WHEN
    self.employee.employeeId = 22;
    
    //THEN
    XCTAssertEqual(expected, self.employee.employeeId,@"Test the same values!");
}
- (void)testEmployeeTypeProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 2;
    
    //WHEN
    self.employee.employeeType = 1;
    
    //THEN
    XCTAssertNotEqual(expected, self.employee.employeeType,@"Test the difference values!");
}
- (void)testEmployeeTypeProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    int expected = 1;
    
    //WHEN
    self.employee.employeeType = 1;
    
    //THEN
    XCTAssertEqual(expected, self.employee.employeeType,@"Test the same values!");
}
- (void)testLastNameProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    NSString *expected = @"Pham";
    
    //WHEN
    self.employee.lastName = @"Cong";
    
    //THEN
    XCTAssertNotEqual(expected, self.employee.lastName,@"Test the difference values!");
}
- (void)testLastNameProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    NSString *expected = @"Pham";
    
    //WHEN
    self.employee.lastName = @"Pham";
    
    //THEN
    XCTAssertEqual(expected, self.employee.lastName,@"Test the same values!");
}
- (void)testFirstNameProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    NSString *expected = @"Nguyen";
    
    //WHEN
    self.employee.firstName = @"Pham";
    
    //THEN
    XCTAssertNotEqual(expected, self.employee.firstName,@"Test the difference values!");
}
- (void)testFirstNameProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    NSString *expected = @"Cong";
    
    //WHEN
    self.employee.firstName = @"Cong";
    
    //THEN
    XCTAssertEqual(expected, self.employee.firstName,@"Test the same values!");
}

- (void)testCalculateNetSalary_ShouldReturnWrongValue_WhenInputDefaultSalaryOfNormalEmployee {
    //GIVEN
    int salaryExpected = 180;
    self.employee = [[NormalEmployee alloc] init];
    
    //WHEN
    int salary = [self.employee calculateNetSalary];
    
    //THEN
    XCTAssertNotEqual(salaryExpected, salary, @"Test the wrong value");
}
- (void)testCalculateNetSalary_ShouldReturnRightValue_WhenInputDefaultSalaryOfNormalEmployee {
    //GIVEN
    int salaryExpected = 181;
    self.employee = [[NormalEmployee alloc] init];
    
    //WHEN
    int salary = [self.employee calculateNetSalary];
    
    //THEN
    XCTAssertEqual(salaryExpected, salary, @"Test the right value");
}
- (void)testCalculateNetSalary_ShouldReturnWrongValue_WhenInputDefaultSalaryOfHourlyEmployee {
    //GIVEN
    int salaryExpected = 164;
    self.employee = [[HourlyEmployee alloc] init];
    
    //WHEN
    int salary = [self.employee calculateNetSalary];
    
    //THEN
    XCTAssertNotEqual(salaryExpected, salary, @"Test the wrong value");
}
- (void)testCalculateNetSalary_ShouldReturnRightValue_WhenInputDefaultSalaryOfHourlyEmployee {
    //GIVEN
    int salaryExpected = 163;
    self.employee = [[HourlyEmployee alloc] init];
    
    //WHEN
    int salary = [self.employee calculateNetSalary];
    
    //THEN
    XCTAssertEqual(salaryExpected, salary, @"Test the right value");
}
- (void)testCalculateNetSalary_ShouldReturnWrongValue_WhenInputDefaultSalaryOfSaleEmployee {
    //GIVEN
    int salaryExpected = 360;
    self.employee = [[SaleEmployee alloc] init];
    
    //WHEN
    int salary = [self.employee calculateNetSalary];
    
    //THEN
    XCTAssertNotEqual(salaryExpected, salary, @"Test the wrong value");
}
- (void)testCalculateNetSalary_ShouldReturnRightValue_WhenInputDefaultSalaryOfSaleEmployee {
    //GIVEN
    int salaryExpected = 361;
    self.employee = [[SaleEmployee alloc] init];
    
    //WHEN
    int salary = [self.employee calculateNetSalary];
    
    //THEN
    XCTAssertEqual(salaryExpected, salary, @"Test the right value");
}
@end
