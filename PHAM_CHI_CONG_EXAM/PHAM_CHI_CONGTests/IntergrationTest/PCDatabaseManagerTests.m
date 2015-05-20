//
//  PCDatabaseManagerTests.m
//  PHAM_CHI_CONG
//
//  Test cases for PCDatabaseManager
//
//  Created by TTA-Brown-006 on 4/27/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PCDatabaseManager.h"
#import "Employee.h"
#import "NormalEmployee.h"
#import "HourlyEmployee.h"
#import "SaleEmployee.h"

/**
 * Todo list:
 * - Test singleton pattern, should return not nil, when shared instance created.
 * - Test singleton pattern, should return not nil, when unique instance created.
 * - Test singleton pattern, should return same shared instance, when same shared instance created.
 * - Test singleton pattern, should return not equal, when shared instance separate from unique instance.
 * - Test singleton pattern, should return not equal, when two separate unique instances created.
 * - Test insert employee information, should return true, when input normal employee information and comment.
 * - Test insert employee information, should return true, when input hourly employee information and comment.
 * - Test insert employee information, should return true, when input sale employee information and comment.
 * - Test insert employee information, should return false, when input employee is nil value.
 * - Test insert employee information, should return false, when input comment is nil value.
 */

@interface PCDatabaseManagerTests : XCTestCase

@end

@implementation PCDatabaseManagerTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - helper methods
- (id)createUniqueInstance {
    return [[PCDatabaseManager alloc] init];
    
}
- (id)getSharedInstance {
    return [PCDatabaseManager sharedInstance];
    
}
- (NormalEmployee*)createNormalEmployee {
    NormalEmployee *employee = [[NormalEmployee alloc] init];
    employee.employeeType = 1;
    employee.lastName = @"Tester";
    employee.firstName = @"Normal";
    return employee;
}
- (HourlyEmployee*)createHourlyEmployee {
    HourlyEmployee *employee = [[HourlyEmployee alloc] init];
    employee.employeeType = 2;
    employee.lastName = @"Tester";
    employee.firstName = @"Hourly";
    return employee;
}
- (SaleEmployee*)createSaleEmployee {
    SaleEmployee *employee = [[SaleEmployee alloc] init];
    employee.employeeType = 3;
    employee.lastName = @"Tester";
    employee.firstName = @"Sale";
    return employee;
}

#pragma mark - tests
- (void)testSingleton_ShouldReturnNotNil_WhenSharedInstanceCreated {
    //GIVEN + WHEN
    PCDatabaseManager *returnedObject = [self getSharedInstance];
    
    //THEN
    XCTAssertNotNil(returnedObject);
}

- (void)testSingleton_ShouldReturnNotNil_WhenUniqueInstanceCreated {
    //GIVEN + WHEN
    PCDatabaseManager *returnedObject = [self createUniqueInstance];
    
    //THEN
    XCTAssertNotNil(returnedObject);
}

- (void)testSingleton_ShouldReturnSameSharedInstance_WhenSameSharedInstanceCreated {
    //GIVEN + WHEN
    PCDatabaseManager *object1 = [self getSharedInstance];
    PCDatabaseManager *object2 = [self getSharedInstance];
    
    //THEN
    XCTAssertEqual(object1, object2);
}

- (void)testSingleton_ShouldReturnNotEqual_WhenSharedInstanceSeparateFromUniqueInstance {
    //GIVEN + WHEN
    PCDatabaseManager *object1 = [self getSharedInstance];
    PCDatabaseManager *object2 = [self createUniqueInstance];
    
    //THEN
    XCTAssertNotEqual(object1, object2);
}

- (void)testSingleton_ShouldReturnNotEqual_WhenTwoSeparateUniqueInstancesCreated {
    //GIVEN + WHEN
    PCDatabaseManager *object1 = [self createUniqueInstance];
    PCDatabaseManager *object2 = [self createUniqueInstance];
    
    //THEN
    XCTAssertNotEqual(object1, object2);
}

- (void)testInsertDatabase_ShouldReturnTrue_WhenInputNormalEmployeeInformationAndComment {
    //GIVEN
    PCDatabaseManager *object = [self getSharedInstance];
    Employee *employee = [self createNormalEmployee];
    NSString *comment = @"Test insert normal employee!";
    
    //WHEN
    int result = (int)[object insertSalaryWithEmployee:employee comment:comment];
    
    //THEN
    XCTAssertTrue((result > 0) ? YES : NO, @"Test insert into database");
}
- (void)testInsertDatabase_ShouldReturnTrue_WhenInputHourlyEmployeeInformationAndComment {
    //GIVEN
    PCDatabaseManager *object = [self getSharedInstance];
    Employee *employee = [self createHourlyEmployee];
    NSString *comment = @"Test insert hourly employee!";
    
    //WHEN
    int result = (int)[object insertSalaryWithEmployee:employee comment:comment];
    
    //THEN
    XCTAssertTrue((result > 0)?YES:NO, @"Test insert into database");
}
- (void)testInsertDatabase_ShouldReturnTrue_WhenInputSaleEmployeeInformationAndComment {
    //GIVEN
    PCDatabaseManager *object = [self getSharedInstance];
    Employee *employee = [self createSaleEmployee];
    NSString *comment = @"Test insert sale employee!";
    
    //WHEN
    int result = (int)[object insertSalaryWithEmployee:employee comment:comment];
    
    //THEN
    XCTAssertTrue((result > 0)?YES:NO, @"Test insert into database");
}
- (void)testInsertDatabase_ShouldReturnFalse_WhenInputNilEmployeeType {
    //GIVEN
    PCDatabaseManager *object = [self getSharedInstance];
    Employee *employee = nil;
    NSString *comment = @"Test insert wrong employee information!";
    
    //WHEN
    int result = (int)[object insertSalaryWithEmployee:employee comment:comment];
    
    //THEN
    XCTAssertFalse((result > 0) ? YES : NO, @"Test insert into database");
}
- (void)testInsertDatabase_ShouldReturnFalse_WhenInputNilComment {
    //GIVEN
    PCDatabaseManager *object = [self getSharedInstance];
    Employee *employee = [self createNormalEmployee];
    NSString *comment = nil;
    
    //WHEN
    int result = (int)[object insertSalaryWithEmployee:employee comment:comment];
    
    //THEN
    XCTAssertFalse((result > 0) ? YES : NO, @"Test insert into database");
}
@end
