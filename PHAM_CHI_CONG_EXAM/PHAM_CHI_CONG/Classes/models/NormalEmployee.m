//
//  NormalEmployee.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "NormalEmployee.h"

@implementation NormalEmployee

- (instancetype)init {
    if (self = [super init]) {
        self.employeeInterface = self;
        _normalSalary = 200; //$200
    }
    return self;
}

#pragma mark - Properties
- (void)setNormalSalary:(int)normalSalary {
    if (normalSalary < 0) {
        [[PCEmployeeException exceptionWithName:@"Employee Exception"
                                         reason:@"NormalSalary is not negative value"
                                       userInfo:nil] raise];
    }
    _normalSalary = normalSalary;
}

#pragma mark - Methods
/**
 * Comment of this method in EmployeeInterface.h file
 */
- (int)retrieveBasicSalary {
    return _normalSalary;
}

/**
 * Comment of this method in EmployeeInterface.h file
 */
- (float)calculateGrossSalary {
    return _normalSalary;
}

@end
