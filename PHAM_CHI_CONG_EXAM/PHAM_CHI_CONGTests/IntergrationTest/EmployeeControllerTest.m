//
//  EmployeeControllerTest.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/29/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EmployeeController.h"
#import "Employee.h"
#import "NormalEmployee.h"
#import "SaleEmployee.h"
#import "HourlyEmployee.h"

/**
 * Todo list:
 * - Test retrieve all employee types, should return the same object, when query database.
 * - Test retrieve all employee types, should return match content value, when query database.
 * - Test retrieve all employee list, should return the same object, when query database.
 * - Test retrieve all employee list, should return all employee list, when controller is created.
 */
@interface EmployeeControllerTest : XCTestCase
@property (strong,nonatomic) EmployeeController *testedController;
@end

@implementation EmployeeControllerTest

- (void)setUp {
    [super setUp];
    self.testedController = [[EmployeeController alloc] init];
}

- (void)tearDown {
    self.testedController = nil;
    [super tearDown];
}
#pragma mark - Helpers
- (NSDictionary*)createEmployeeTypes {
    return @{@"1":@"Normal Employee",@"2":@"Hourly Employee",@"3":@"Sale Employee"};
}
- (Employee*)createEmployeeWithEmployeeId:(int)employeeId employeeType:(int)employeeType
                                firstName:(NSString*)firstName lastName:(NSString*)lastName {
    Employee *employee;
    if (employeeType == 1) {
        employee = [[NormalEmployee alloc] init];
    }
    else if (employeeType == 2) {
        employee = [[HourlyEmployee alloc] init];
    }
    else {
        employee = [[SaleEmployee alloc] init];
    }
    employee.employeeId = employeeId;
    employee.employeeType = employeeType;
    employee.firstName = firstName;
    employee.lastName = lastName;
    return employee;
}
- (NSArray*)createEmployeeList {
    NSMutableArray *employeeArray = [[NSMutableArray alloc] init];
    [employeeArray addObject:[self createEmployeeWithEmployeeId:1 employeeType:1 firstName:@"Nguyen" lastName:@"Hieu"]];
    [employeeArray addObject:[self createEmployeeWithEmployeeId:2 employeeType:1 firstName:@"Tran" lastName:@"Long"]];
    [employeeArray addObject:[self createEmployeeWithEmployeeId:3 employeeType:2 firstName:@"Nguyen" lastName:@"Hung"]];
    [employeeArray addObject:[self createEmployeeWithEmployeeId:4 employeeType:3 firstName:@"Pham" lastName:@"Lan"]];
    [employeeArray addObject:[self createEmployeeWithEmployeeId:5 employeeType:3 firstName:@"Member" lastName:@"Admin"]];
    
    return (NSArray*)employeeArray;
}

#pragma mark - Tests
- (void)testRetrieveAllEmployeeTypes_ShouldReturnTrue_WhenQueryDatabase {
    //GIVEN
    NSDictionary *expected = [self createEmployeeTypes];
    
    //WHEN
    NSDictionary *result = [self.testedController retrieveAllEmployeeType];
    
    //THEN
    XCTAssertEqualObjects(expected, result, @"Test objects!");
}
- (void)testRetrieveAllEmployeeTypes_ShouldReturnMatchContentValue_WhenQueryDatabase {
    //GIVEN
    NSDictionary *expected = [self createEmployeeTypes];
    
    //WHEN
    NSDictionary *result = [self.testedController retrieveAllEmployeeType];
    
    //THEN
    for (NSString *key in expected) {
        XCTAssertNotNil(result[key], @"Key must be present.");
        XCTAssertTrue([result[key] isEqualToString:((NSString*)expected[key])], @"Result value string must match expected value string.");
    }
}
- (void)testRetrieveAllEmployeeList_ShouldReturnTrue_WhenQueryDatabase {
    //GIVEN
    NSArray *expected = [self createEmployeeList];
    
    //WHEN
    NSArray *result = [self.testedController retrieveAllEmployees];
    
    //THEN
    XCTAssertTrue([expected isKindOfClass:[result class]], @"Test object type!");
}
- (void)testRetrieveAllEmployeeList_ShouldReturnMatchContentValue_WhenQueryDatabase {
    //GIVEN
    NSArray *expected = [self createEmployeeList];
    
    //WHEN
    NSArray *result = [self.testedController retrieveAllEmployees];
    
    //THEN
    for (int i = 0; i < expected.count; i++) {
        Employee *employee = result[i];
        Employee *expectedEmployee = expected[i];
        
        XCTAssertNotNil(employee,@"Must not nil");
        XCTAssertNotNil(expectedEmployee,@"Must not nil");
        XCTAssertEqual(employee.employeeId, expectedEmployee.employeeId,@"Result value must match expected value.");
        XCTAssertEqual(employee.employeeType, expectedEmployee.employeeType,@"Result value must match expected value.");
        XCTAssertTrue([employee.firstName isEqualToString:expectedEmployee.firstName], @"Result value must match expected value.");
        XCTAssertTrue([employee.lastName isEqualToString:expectedEmployee.lastName], @"Result value must match expected value.");
    }
}


@end
