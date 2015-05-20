//
//  SalaryControllerTest.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/16/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SalaryController.h"
#import "PCSalaryException.h"

#import "Employee.h"
#import "NormalEmployee.h"
#import "HourlyEmployee.h"
#import "SaleEmployee.h"

/**
 Todo list:
 - Test Contribution Rate, ShouldRaiseException, WhenSalaryIsZero
 - Test Contribution Rate, ShouldRaiseException, WhenSalaryIsNegativeValue;
 - Test ContributionRate, ShouldReturn5Percent, WhenSalaryIs1
 - Test ContributionRate, ShouldReturn5Percent, WhenSalaryIs1999
 - Test ContributionRate, ShouldReturn6Dot5Percent, WhenSalaryIs2000
 - Test ContributionRate, ShouldReturn6Dot5Percent, WhenSalaryIs6000
 - Test ContributionRate, ShouldReturn7Dot5Percent, WhenSalaryIs6001
 - Test ContributionRate, ShouldReturn7Dot5Percent, WhenSalaryIs10000
 - Test ContributionRate, ShouldReturn0Percent, WhenSalaryIs10001
 
 - Test Tax Rate, ShouldRaiseException, WhenSalaryIsZero
 - Test Tax Rate, ShouldRaiseException, WhenSalaryIsNegativeValue
 - Test Tax Rate, ShouldReturn5Percent, WhenSalaryIs1
 - Test Tax Rate, ShouldReturn5Percent, WhenSalaryIs4999
 - Test Tax Rate, ShouldReturn10Percent, WhenSalaryIs5000
 - Test Tax Rate, ShouldReturn10Percent, WhenSalaryIs10000
 - Test Tax Rate, ShouldReturn15Percent, WhenSalaryIs10001
 - Test Tax Rate, ShouldReturn15Percent, WhenSalaryIs20000
 - Test Tax Rate, ShouldReturn0Percent, WhenSalaryIs20001
 */

@interface SalaryControllerTests : XCTestCase {
    SalaryController *_salaryController;
}

@end

@implementation SalaryControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _salaryController = [[SalaryController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _salaryController = nil;
}


#pragma mark Contribution rate
- (void)testContributionRate_ShouldRaiseException_WhenSalaryIsZero {
    //GIVEN
    int salary = 0;
    
    //WHEN + THEN
    XCTAssertThrowsSpecific([_salaryController getContributionRate:salary], PCSalaryException);
}

- (void)testContributionRate_ShouldRaiseException_WhenSalaryIsNegativeValue {
    //GIVEN
    int salary = -2000;
    
    //WHEN + THEN
    XCTAssertThrowsSpecific([_salaryController getContributionRate:salary], PCSalaryException);
}

- (void)testContributionRate_ShouldReturn5Percent_WhenSalaryIs1 {
    //GIVEN
    int salary = 1;
    float contributionRateExpected = 0.05;
    
    //WHEN
    float contributionRate = [_salaryController getContributionRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testContributionRate_ShouldReturn5Percent_WhenSalaryIs1999 {
    //GIVEN
    int salary = 1999;
    float contributionRateExpected = 0.05;
    
    //WHEN
    float contributionRate = [_salaryController getContributionRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testContributionRate_ShouldReturn6Dot5Percent_WhenSalaryIs2000 {
    //GIVEN
    int salary = 2000;
    float contributionRateExpected = 0.065;
    
    //WHEN
    float contributionRate = [_salaryController getContributionRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testContributionRate_ShouldReturn6Dot5Percent_WhenSalaryIs6000 {
    //GIVEN
    int salary = 6000;
    float contributionRateExpected = 0.065;
    
    //WHEN
    float contributionRate = [_salaryController getContributionRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testContributionRate_ShouldReturn7Dot5Percent_WhenSalaryIs6001 {
    //GIVEN
    int salary = 6001;
    float contributionRateExpected = 0.075;
    
    //WHEN
    float contributionRate = [_salaryController getContributionRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testContributionRate_ShouldReturn7Dot5Percent_WhenSalaryIs10000 {
    //GIVEN
    int salary = 10000;
    float contributionRateExpected = 0.075;
    
    //WHEN
    float contributionRate = [_salaryController getContributionRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testContributionRate_ShouldReturn0Percent_WhenSalaryIs10001 {
    //GIVEN
    int salary = 10001;
    float contributionRateExpected = 0;
    
    //WHEN
    float contributionRate = [_salaryController getContributionRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

#pragma mark Tax rate
- (void)testTaxRate_ShouldRaiseException_WhenSalaryIsZero {
    //GIVEN
    int salary = 0;
    
    //WHEN + THEN
    XCTAssertThrowsSpecific([_salaryController getTaxRate:salary], PCSalaryException);
}

- (void)testTaxRate_ShouldRaiseException_WhenSalaryIsNegativeValue {
    //GIVEN
    int salary = -2000;
    
    //WHEN + THEN
    XCTAssertThrowsSpecific([_salaryController getTaxRate:salary], PCSalaryException);
}

- (void)testTaxRate_ShouldReturn5Percent_WhenSalaryIs1 {
    //GIVEN
    int salary = 1;
    float contributionRateExpected = 0.05;
    
    //WHEN
    float contributionRate = [_salaryController getTaxRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testTaxRate_ShouldReturn5Percent_WhenSalaryIs4999 {
    //GIVEN
    int salary = 4999;
    float contributionRateExpected = 0.05;
    
    //WHEN
    float contributionRate = [_salaryController getTaxRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testTaxRate_ShouldReturn10Percent_WhenSalaryIs5000 {
    //GIVEN
    int salary = 5000;
    float contributionRateExpected = 0.1;
    
    //WHEN
    float contributionRate = [_salaryController getTaxRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testTaxRate_ShouldReturn10Percent_WhenSalaryIs10000 {
    //GIVEN
    int salary = 10000;
    float contributionRateExpected = 0.1;
    
    //WHEN
    float contributionRate = [_salaryController getTaxRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testTaxRate_ShouldReturn15Percent_WhenSalaryIs10001 {
    //GIVEN
    int salary = 10001;
    float contributionRateExpected = 0.15;
    
    //WHEN
    float contributionRate = [_salaryController getTaxRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testTaxRate_ShouldReturn15Percent_WhenSalaryIs20000 {
    //GIVEN
    int salary = 20000;
    float contributionRateExpected = 0.15;
    
    //WHEN
    float contributionRate = [_salaryController getTaxRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

- (void)testTaxRate_ShouldReturn0Percent_WhenSalaryIs20001 {
    //GIVEN
    int salary = 20001;
    float contributionRateExpected = 0;
    
    //WHEN
    float contributionRate = [_salaryController getTaxRate:salary];
    
    //THEN
    XCTAssertEqual(contributionRateExpected, contributionRate);
}

@end
