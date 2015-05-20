//
//  Employee.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "Employee.h"
#import "SalaryController.h"

@implementation Employee
@synthesize employeeId;
@synthesize lastName;
@synthesize firstName;
@synthesize employeeInterface = _employeeInterface;

/**
 * Comment of this method in .h file
 */
- (int)calculateNetSalary {
    int netSalary = 0;
    if ([_employeeInterface conformsToProtocol:@protocol(EmployeeInterface)]) {
        @try {
            SalaryController *controller = [[SalaryController alloc] init];
            float grossSalary = [_employeeInterface calculateGrossSalary];
            float PN_rate = [controller getContributionRate:grossSalary];
            float salaryBeforeTax = (grossSalary - (PN_rate * grossSalary));
            float tax_rate = [controller getTaxRate:grossSalary];
            netSalary = (int)ceilf(salaryBeforeTax - (salaryBeforeTax * tax_rate));
        }
        @catch (NSException *exception) {
            DLog(@"Exception:%@",exception.description);
        }
    }
    return netSalary;
}
@end
