//
//  HourlyEmployee.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "Employee.h"
#import "PCEmployeeException.h"

@interface HourlyEmployee : Employee <EmployeeInterface> {
    
}
@property (nonatomic, assign) int hourlyWage; //USD currency
@property (nonatomic, assign) int hoursWorked; //hour

@end
