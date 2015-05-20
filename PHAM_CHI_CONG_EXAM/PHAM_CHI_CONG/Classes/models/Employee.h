//
//  Employee.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SalaryController.h"
#import "EmployeeInterface.h"
#import "PCEmployeeException.h"

typedef enum {
    NormalEmployeeType = 1,
    HourlyEmployeeType = 2,
    SaleEmployeeType = 3,
}EmployeeType;

@interface Employee : NSObject {
    
}

@property (nonatomic, assign) int employeeId;
@property (nonatomic, assign) int employeeType;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, assign) id <EmployeeInterface> employeeInterface;

/**
 * Calculate net salary of each employee
 * @param: None
 * @return: net salary (int)
 * @throws exception: None
 */
- (int)calculateNetSalary;

@end
