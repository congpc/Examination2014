//
//  SalaryController.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/16/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "SalaryController.h"
#import "PCSalaryException.h"

@implementation SalaryController

- (float)getContributionRate:(int)salary {
    if (salary <= 0) {
        [[PCSalaryException exceptionWithName:@"Invalid value" reason:@"Invalid salary valud!" userInfo:nil] raise];
    }
    
    if (salary < 2000) {
        return (5/100.0);
    }
    else if (salary >= 2000 && salary <= 6000) {
        return (6.5/100.0);
    }
    else if (salary > 6000 && salary <= 10000){
        return (7.5/100.0);
    }
    return 0;
}

- (float)getTaxRate:(int)salary {
    if (salary <= 0) {
        [[PCSalaryException exceptionWithName:@"Invalid value" reason:@"Invalid salary valud!" userInfo:nil] raise];
    }
    
    if (salary < 5000) {
        return (5/100.0);
    }
    else if (salary >= 5000 && salary <= 10000) {
        return (10/100.0);
    }
    else if (salary > 10000 && salary <= 20000){
        return (15/100.0);
    }
    return 0;
}

@end
