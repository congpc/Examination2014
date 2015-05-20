//
//  SaleEmployee.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "Employee.h"
#import "PCEmployeeException.h"

@interface SaleEmployee : Employee <EmployeeInterface> {
    
}
@property (nonatomic, assign) int grossSale;
@property (nonatomic, assign) float commissionRate;
@property (nonatomic, assign) int baseSalary;

@end
