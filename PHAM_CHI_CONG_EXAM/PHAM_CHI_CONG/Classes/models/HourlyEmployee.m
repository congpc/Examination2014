//
//  HourlyEmployee.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "HourlyEmployee.h"

@implementation HourlyEmployee

- (instancetype)init {
    if (self = [super init]) {
        self.employeeInterface = self;
        _hourlyWage = 6; // $6
        _hoursWorked = 30; // 30 hours
    }
    return self;
}

#pragma mark - Properties
- (void)setHourlyWage:(int)hourlyWage {
    if (hourlyWage < 0) {
        [[PCEmployeeException exceptionWithName:@"Employee Exception"
                                         reason:@"HourlyWage is not negative value"
                                       userInfo:nil] raise];
    }
    _hourlyWage = hourlyWage;
}
- (void)setHoursWorked:(int)hoursWorked {
    if (hoursWorked < 0) {
        [[PCEmployeeException exceptionWithName:@"Employee Exception"
                                         reason:@"HoursWorked is not negative value"
                                       userInfo:nil] raise];
    }
    _hoursWorked = hoursWorked;
}

#pragma mark - Methods
/**
 * Comment of this method in EmployeeInterface.h file
 */
- (int)retrieveBasicSalary {
    return _hourlyWage;
}

/**
 * Comment of this method in EmployeeInterface.h file
 */
- (float)calculateGrossSalary {
    return _hourlyWage * _hoursWorked;
}

@end
