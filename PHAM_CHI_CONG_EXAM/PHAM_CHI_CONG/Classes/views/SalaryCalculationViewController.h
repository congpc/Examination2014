//
//  SalaryCalucationViewController.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/9/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Employee;
@interface SalaryCalculationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    __weak IBOutlet UITableView *employeeInformationTableView;
    
    @private
    int rowsNumber;
    NSDictionary *employeeTypes;
}
@property (nonatomic, strong) Employee *empployeeInformation;

@end
