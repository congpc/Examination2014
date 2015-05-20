//
//  NormalEmployeeTests.m
//  PHAM_CHI_CONG
//
//  Test cases for NormalEmployee
//
//  Created by TTA-Brown-006 on 4/27/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NormalEmployee.h"

/**
 * Todo list:
 * - Test init object, should return not nil, when create object.
 *
 * - Test normalSalary property, should raise exception, when input negative values.
 * - Test normalSalary property, should return the difference values, when input the difference values.
 * - Test normalSalary property, should return the same values, when input the same values.
 *
 * - Test get basic salary, should return default value, when create object of NormalEmployee class.
 * - Test get basic salary, should return the modified value, when modify normal salary.
 *
 * - Test calculate gross salary, should return wrong value, when input default values of NormalEmployee class.
 * - Test calculate gross salary, should return right value, when input default values of NormalEmployee class.
 */

@interface NormalEmployeeTests : XCTestCase

@property (strong, nonatomic) NormalEmployee *testedObject;

@end

@implementation NormalEmployeeTests

- (void)setUp {
    [super setUp];
    self.testedObject = [[NormalEmployee alloc] init];
}

- (void)tearDown {
    self.testedObject = nil;
    [super tearDown];
}

#pragma mark - tests
/**
 * Test init object, should return not nil, when create object.
 */
- (void)testInitObject_ShouldReturnNotNil_WhenCreateObjectInSetUpMethod {
    //GIVEN + WHEN in setUp method
    
    //THEN
    XCTAssertNotNil(self.testedObject,@"Test object not instantiated!");
}

- (void)testNormalSalaryProperty_ShouldReturnRaiseException_WhenInputNagativeValue {
    //GIVEN + Create object in setUp method
    //WHEN
    //THEN
    XCTAssertThrowsSpecific(self.testedObject.normalSalary = -100, PCEmployeeException, @"Test exception!");
}

/**
 * Test normalSalary property by int value, should return the difference values, when input the difference values.
 */
- (void)testNormalSalaryProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 22;
    
    //WHEN
    self.testedObject.normalSalary = 20;
    
    //THEN
    XCTAssertNotEqual(expected, self.testedObject.normalSalary,@"Test the difference values!");
}

/**
 * Test normalSalary property by int value, should return the same values, when input the same values.
 */
- (void)testNormalSalaryProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    int expected = 22;
    
    //WHEN
    self.testedObject.normalSalary = 22;
    
    //THEN
    XCTAssertEqual(expected, self.testedObject.normalSalary,@"Test the same values!");
}

/**
 * Test get basic salary, should return default value, when create object of NormalEmployee class.
 */
- (void)testBasicSalary_ShouldReturnDefaultValue_WhenInputDefaultSalaryOfNormalEmployee {
    //GIVEN
    int expected = 200;
    
    //WHEN
    
    //THEN
    XCTAssertEqual(expected, [self.testedObject retrieveBasicSalary],@"Test default values!");
}

/**
 * Test get basic salary, should return the modified value, when modify normal salary.
 */
- (void)testBasicSalary_ShouldReturnModiedValue_WhenModifyNormalSalary {
    //GIVEN
    int expected = 400;
    
    //WHEN
    self.testedObject.normalSalary = 400;
    
    //THEN
    XCTAssertEqual(expected, [self.testedObject retrieveBasicSalary],@"Test modified values!");
}

/**
 * Test calculate gross salary, should return wrong value, when input default values of NormalEmployee class.
 */
- (void)testCalculateGrossSalary_ShouldReturnWrongValue_WhenInputDefaultSalaryOfNormalEmployee {
    //GIVEN
    int salaryExpected = 201;
    
    //WHEN
    int salary = [self.testedObject calculateGrossSalary];
    
    //THEN
    XCTAssertNotEqual(salaryExpected, salary, @"Test gross salary of NormalEmployee");
}

/**
 * Test calculate gross salary, should return right value, when input default values of NormalEmployee class.
 */
- (void)testCalculateGrossSalary_ShouldReturnRightValue_WhenInputDefaultSalaryOfNormalEmployee {
    //GIVEN
    int salaryExpected = 200;
    
    //WHEN
    int salary = [self.testedObject calculateGrossSalary];
    
    //THEN
    XCTAssertEqual(salaryExpected, salary, @"Test gross salary of NormalEmployee");
}
@end
