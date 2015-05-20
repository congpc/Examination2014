//
//  SaleEmployeeTests.m
//  PHAM_CHI_CONG
//
//  Test cases for SaleEmployee
//
//  Created by TTA-Brown-006 on 4/27/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SaleEmployee.h"

/**
 * Todo list:
 * - Test init object, should return not nil, when create object.
 *
 * - Test grossSale property, should raise exception, when input negative values.
 * - Test grossSale property by float value, should return the difference values, when input the difference values.
 * - Test grossSale property by float value, should return the same values, when input the same values.
 * - Test commissionRate property, should raise exception, when input negative values.
 * - Test commissionRate property by float value, should return the difference values, when input the difference values.
 * - Test commissionRate property by float value, should return the same values, when input the same values.
 * - Test baseSalary property, should raise exception, when input negative values.
 * - Test baseSalary property by float value, should return the difference values, when input the difference values.
 * - Test baseSalary property by float value, should return the same values, when input the same values.
 *
 * - Test get basic salary, should return default value, when create object of SaleEmployee class.
 * - Test get basic salary, should return the modified value, when modify grossSale, commissionRate, and baseSalary.
 *
 * - Test calculate gross salary, should return wrong value, when input default values of SaleEmployee class.
 * - Test calculate gross salary, should return right value, when input default values of SaleEmployee class.
 */

@interface SaleEmployeeTests : XCTestCase

@property (strong, nonatomic) SaleEmployee *testedObject;

@end

@implementation SaleEmployeeTests

- (void)setUp {
    [super setUp];
    self.testedObject = [[SaleEmployee alloc] init];
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
- (void)testGrossSaleProperty_ShouldReturnRaiseException_WhenInputNagativeValue {
    //GIVEN + Create object in setUp method
    //WHEN
    //THEN
    XCTAssertThrowsSpecific(self.testedObject.grossSale = -100, PCEmployeeException, @"Test exception!");
}
- (void)testGrossSaleProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 5500;
    
    //WHEN
    self.testedObject.grossSale = 5000;
    
    //THEN
    XCTAssertNotEqual(expected, self.testedObject.grossSale,@"Test the difference values!");
}
- (void)testGrossSaleProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    int expected = 5000;
    
    //WHEN
    self.testedObject.grossSale = 5000;
    
    //THEN
    XCTAssertEqual(expected, self.testedObject.grossSale,@"Test the same values!");
}
- (void)testCommissionRateProperty_ShouldReturnRaiseException_WhenInputNagativeValue {
    //GIVEN + Create object in setUp method
    //WHEN
    //THEN
    XCTAssertThrowsSpecific(self.testedObject.commissionRate = -100, PCEmployeeException, @"Test exception!");
}
- (void)testCommissionRateProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 5;
    
    //WHEN
    self.testedObject.commissionRate = 0.05;
    
    //THEN
    XCTAssertNotEqual(expected, self.testedObject.commissionRate,@"Test the difference values!");
}
- (void)testCommissionRateProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    float expected = 0.05;
    
    //WHEN
    self.testedObject.commissionRate = 0.05;
    
    //THEN
    XCTAssertEqual(expected, self.testedObject.commissionRate,@"Test the same values!");
}
- (void)testBaseSalaryProperty_ShouldReturnRaiseException_WhenInputNagativeValue {
    //GIVEN + Create object in setUp method
    //WHEN
    //THEN
    XCTAssertThrowsSpecific(self.testedObject.baseSalary = -100, PCEmployeeException, @"Test exception!");
}
- (void)testBaseSalaryProperty_ShouldReturnTheDifferenceValue_WhenInputTheDifferenceValue {
    //GIVEN + Create object in setUp method
    int expected = 350;
    
    //WHEN
    self.testedObject.baseSalary = 300;
    
    //THEN
    XCTAssertNotEqual(expected, self.testedObject.baseSalary,@"Test the difference values!");
}
- (void)testBaseSalaryProperty_ShouldReturnTheSameValue_WhenInputTheSameValue {
    //GIVEN + Create object in setUp method
    int expected = 300;
    
    //WHEN
    self.testedObject.baseSalary = 300;
    
    //THEN
    XCTAssertEqual(expected, self.testedObject.baseSalary,@"Test the same values!");
}

- (void)testBasicSalary_ShouldReturnDefaultValue_WhenInputDefaultSalaryOfSaleEmployee {
    //GIVEN
    int expected = 150;
    
    //WHEN
    
    //THEN
    XCTAssertEqual(expected, [self.testedObject retrieveBasicSalary],@"Test default values!");
}
- (void)testBasicSalary_ShouldReturnModiedValue_WhenInputDefaultSalaryOfSaleEmployee {
    //GIVEN
    int expected = 200;
    
    //WHEN
    self.testedObject.baseSalary = 200;
    self.testedObject.grossSale = 4000;
    self.testedObject.commissionRate = 0.1;
    
    //THEN
    XCTAssertEqual(expected, [self.testedObject retrieveBasicSalary],@"Test modified values!");
}

- (void)testCalculateGrossSalary_ShouldReturnWrongValue_WhenInputDefaultSalaryOfSaleEmployee {
    //GIVEN
    int salaryExpected = 401;
    
    //WHEN
    int salary = [self.testedObject calculateGrossSalary];
    
    //THEN
    XCTAssertNotEqual(salaryExpected, salary, @"Test gross salary of SaleEmployee");
}
- (void)testCalculateGrossSalary_ShouldReturnRightValue_WhenInputDefaultSalaryOfSaleEmployee {
    //GIVEN
    int salaryExpected = 400;
    
    //WHEN
    int salary = [self.testedObject calculateGrossSalary];
    
    //THEN
    XCTAssertEqual(salaryExpected, salary, @"Test gross salary of SaleEmployee");
}
@end
