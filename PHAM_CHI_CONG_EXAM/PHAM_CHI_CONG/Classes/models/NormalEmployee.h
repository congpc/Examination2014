//
//  NormalEmployee.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "Employee.h"
#import "PCEmployeeException.h"

@interface NormalEmployee : Employee <EmployeeInterface> {
    
}
@property (nonatomic, assign) int normalSalary; //USD currency


@end
