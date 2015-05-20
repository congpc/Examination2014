//
//  SaleEmployee.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "SaleEmployee.h"

@implementation SaleEmployee

- (instancetype)init {
    if (self = [super init]) {
        self.employeeInterface = self;
        _grossSale = 5000; // $5000
        _commissionRate = 0.05;
        _baseSalary = 150; //$150
    }
    return self;
}

#pragma mark - Properties
- (void)setGrossSale:(int)grossSale {
    if (grossSale < 0) {
        [[PCEmployeeException exceptionWithName:@"Employee Exception"
                                         reason:@"GrossSale is not negative value"
                                       userInfo:nil] raise];
    }
    _grossSale = grossSale;
}
- (void)setCommissionRate:(float)commissionRate {
    if (commissionRate < 0) {
        [[PCEmployeeException exceptionWithName:@"Employee Exception"
                                         reason:@"CommissionRate is not negative value"
                                       userInfo:nil] raise];
    }
    _commissionRate = commissionRate;
}
- (void)setBaseSalary:(int)baseSalary {
    if (baseSalary < 0) {
        [[PCEmployeeException exceptionWithName:@"Employee Exception"
                                         reason:@"BaseSalary is not negative value"
                                       userInfo:nil] raise];
    }
    _baseSalary = baseSalary;
}

#pragma mark - Methods
/**
 * Comment of this method in EmployeeInterface.h file
 */
- (int)retrieveBasicSalary {
    return _baseSalary;
}

/**
 * Comment of this method in EmployeeInterface.h file
 */
- (float)calculateGrossSalary {
    return (_baseSalary + (_grossSale * _commissionRate));
}

@end
