//
//  EmployeeCell.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/15/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "EmployeeCell.h"

@implementation EmployeeCell

/**
 * Handle event when user click on 'Salary Calculation' button.
 * @param: UIButton
 * @return: IBAction
 * @throws exception: None
 */
- (IBAction)clickOnSalaryCalculationButton:(id)sender {
    if (self.employeeCellDelegate && [self.employeeCellDelegate respondsToSelector:@selector(employeeCell:didSelectRowAtIndex:)]) {
        [self.employeeCellDelegate employeeCell:self didSelectRowAtIndex:(int)self.tag];
    }
}

@end
