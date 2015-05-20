//
//  EmployeeController.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/15/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeController : NSObject

/**
 * Get all employee types
 * @param: None
 * @return: employee type list (Dictionary: key is id, value is name)
 * @throws exception: None
 */
- (NSDictionary *)retrieveAllEmployeeType;

/**
 * Get all employees
 * @param: None
 * @return: employee list (NSArray)
 * @throws exception: None
 */
- (NSArray *)retrieveAllEmployees;
@end
