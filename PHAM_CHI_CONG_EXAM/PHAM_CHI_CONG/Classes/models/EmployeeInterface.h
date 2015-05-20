//
//  EmployeeInterfaces.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/16/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

@protocol EmployeeInterface <NSObject>

@required

/**
 * Retrieve basic salary of the employee
 * @param: None
 * @return: basic salary (int)
 * @throws exception: None
 */
- (int)retrieveBasicSalary;

/**
 * Calculate gross salary of each employee
 * @param: None
 * @return: gross salary (float)
 * @throws exception: None
 */
- (float)calculateGrossSalary;
@end
