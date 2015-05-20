//
//  EmployeeController.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/15/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "EmployeeController.h"

@implementation EmployeeController

- (NSDictionary *)retrieveAllEmployeeType {
    return [[PCDatabaseManager sharedInstance] retrieveAllEmployeeType];
}

- (NSArray *)retrieveAllEmployees {
    return [[PCDatabaseManager sharedInstance] retrieveAllEmployees];
}

@end
