//
//  EmployeesViewController.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/9/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeCell.h"

@interface EmployeesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EmployeeCellCallback> {
    NSMutableArray *_employees;
    __weak IBOutlet UITableView *employeesTableView;
    
}

@end
