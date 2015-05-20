//
//  EmployeeCell.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/15/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmployeeCell;
@protocol EmployeeCellCallback <NSObject>

- (void)employeeCell:(EmployeeCell*)employeeCell didSelectRowAtIndex:(int)index;

@end

@interface EmployeeCell : UITableViewCell {
    
}
@property (weak, nonatomic) IBOutlet UILabel *employeeIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaryCalculationLabel;
@property (weak, nonatomic) IBOutlet UIButton *salaryCalculationButton;
@property (assign, nonatomic) id employeeCellDelegate;

@end
