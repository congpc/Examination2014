//
//  PCDatabaseManager.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/10/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Employee;
@interface PCDatabaseManager : NSObject {
    
}

/**
 * Contructor by singeton pattern
 * @param: None
 * @return: object of this class
 * @throws exception: None
 */
+ (instancetype)sharedInstance;

/**
 * Check database is exist, check login status with username and password
 * @param: username (NSString) and password (NSString)
 * @return: result (BOOL)
 * @throws exception: None
 */
- (BOOL)checkLoginWithUsername:(NSString*)username password:(NSString*)password;

/**
 * Check database is exist, get all employees on database
 * @param: None
 * @return: Employees list (NSArray)
 * @throws exception: None
 */
- (NSArray *)retrieveAllEmployees;

/**
 * Get all employee type
 * @param: None
 * @return: Employee type list by NSDictionary (Key is id and Value is employee type name)
 * @throws exception: None
 */
- (NSDictionary *)retrieveAllEmployeeType;

/**
 * After calculate salary of that employee, then user insert employee information into database
 * @param: Employee information and comment
 * @return: Result by int value
 * @throws exception: None
 */
- (NSInteger)insertSalaryWithEmployee:(Employee*)employee comment:(NSString*)comment;

@end
