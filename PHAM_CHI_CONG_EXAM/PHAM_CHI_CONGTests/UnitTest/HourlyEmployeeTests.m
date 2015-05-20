//
//  HourlyEmployeeTests.m
//  PHAM_CHI_CONG
//
//  Test cases for HourlyEmployee
//
//  Created by TTA-Brown-006 on 4/27/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "HourlyEmployee.h"

/**
 * Todo list:
 * - Test init object, should return not nil, when create object.
 *
 * - Test hourlyWage property, should raise exception, when input negative values.
 * - Test hourlyWage property by int value, should return the difference values, when input the difference values.
 * - Test hourlyWage property by int value, should return the same values, when input the same values.
 * - Test hoursWorked property, should raise exception, when input negative values.
 * - Test hoursWorked property by int value, should return the difference values, when input the difference values.
 * - Test hoursWorked property by int value, should return the same values, when input the same values.
 *
 * - Test get basic salary, should return default value, when create object of HourlyEmployee class.
 * - Test get basic salary, should return the modified value, when modify hourlyWage and hoursWorked.
 *
 * - Test calculate gross salary, should return wrong value, when input default values of HourlyEmployee class.
 * - Test calculate gross salary, should return right value, when input default values of HourlyEmployee class.
 */

@interface HourlyEmployeeTests : XCTestCase

@property (strong, nonatomic) HourlyEmployee *testedObject;

@end

@implementation HourlyEmployeeTests

- (void)setUp {
    [super setUp];
    self.testedObject = [[HourlyEmployee alloc] init];
}

- (void)tearDown {
    self.testedObject = nil;
    [super tearDown];
}

#pragma mark - tests
- (void)testInitObject_ShouldReturnNotNil_WhenCreateObjectInSetUpMethod {
    //GIVEN + WHEN in setUp method
    
    //THEN
    XCTAssertNotNil(self.testedObject,@"Test object not instantiated!");
}
- (void)testHourlyWageProperty_ShouldReturnRaiseException_WhenInputNagativeValue {
    //GIVEN + Create object in setUp method
    //WHEN
    //THEN
    XCTAssertThrowsSpecific(self.testedObject.hourlyWage = -100, PCEmployeeException, @"Test exception!");
}
- (void)testHourlyWageProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 222;
    
    //WHEN
    self.testedObject.hourlyWage = 200;
    
    //THEN
    XCTAssertNotEqual(expected, self.testedObject.hourlyWage,@"Test the difference values!");
}
- (void)testHourlyWageProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    int expected = 220;
    
    //WHEN
    self.testedObject.hourlyWage = 220;
    
    //THEN
    XCTAssertEqual(expected, self.testedObject.hourlyWage,@"Test the same values!");
}
- (void)testHoursWorkedProperty_ShouldReturnRaiseException_WhenInputNagativeValue {
    //GIVEN + Create object in setUp method
    //WHEN
    //THEN
    XCTAssertThrowsSpecific(self.testedObject.hoursWorked = -100, PCEmployeeException, @"Test exception!");
}
- (void)testHoursWorkedProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 44;
    
    //WHEN
    self.testedObject.hoursWorked = 40;
    
    //THEN
    XCTAssertNotEqual(expected, self.testedObject.hoursWorked,@"Test the difference values!");
}
- (void)testHoursWorkedProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    int expected = 40;
    
    //WHEN
    self.testedObject.hoursWorked = 40;
    
    //THEN
    XCTAssertEqual(expected, self.testedObject.hoursWorked,@"Test the same values!");
}

- (void)testBasicSalary_ShouldReturnDefaultValue_WhenInputDefaultSalaryOfHourlyEmployee {
    //GIVEN
    int expected = 6;
    
    //WHEN
    
    //THEN
    XCTAssertEqual(expected, [self.testedObject retrieveBasicSalary],@"Test default values!");
}
- (void)testBasicSalary_ShouldReturnModiedValue_WhenInputDefaultSalaryOfHourlyEmployee {
    //GIVEN
    int expected = 10;
    
    //WHEN
    self.testedObject.hourlyWage = 10;
    self.testedObject.hoursWorked = 40;
    
    //THEN
    XCTAssertEqual(expected, [self.testedObject retrieveBasicSalary],@"Test modified values!");
}

- (void)testCalculateGrossSalary_ShouldReturnWrongValue_WhenInputDefaultSalaryOfHourlyEmployee {
    //GIVEN
    int salaryExpected = 201;
    
    //WHEN
    int salary = [self.testedObject calculateGrossSalary];
    
    //THEN
    XCTAssertNotEqual(salaryExpected, salary, @"Test gross salary of HourlyEmployee");
}
- (void)testCalculateGrossSalary_ShouldReturnRightValue_WhenInputDefaultSalaryOfHourlyEmployee {
    //GIVEN
    int salaryExpected = 180;
    
    //WHEN
    int salary = [self.testedObject calculateGrossSalary];
    
    //THEN
    XCTAssertEqual(salaryExpected, salary, @"Test gross salary of HourlyEmployee");
}

@end
