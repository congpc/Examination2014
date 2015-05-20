//
//  SalaryCalucationViewController.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/9/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "SalaryCalculationViewController.h"
#import "DetailEmployeeCell.h"
#import "NormalEmployee.h"
#import "HourlyEmployee.h"
#import "SaleEmployee.h"
#import "EmployeeController.h"

//Define constains
static CGFloat const BORDER_CORNER_RADIUS = 7.0;

@interface SalaryCalculationViewController ()

@end

@implementation SalaryCalculationViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Check login status, if do not login then move to login screen
    if (![kAppDelegate checkLoginStatus:self]) {
        return;
    }
    
    //Get all employee type
    EmployeeController *controller = [[EmployeeController alloc] init];
    employeeTypes = [controller retrieveAllEmployeeType];
    
    if (self.empployeeInformation && self.empployeeInformation.employeeType == NormalEmployeeType) {
        rowsNumber = 5;//5 rows
    }
    else if (self.empployeeInformation && self.empployeeInformation.employeeType == HourlyEmployeeType) {
        rowsNumber = 6;//6 rows
    }
    else if (self.empployeeInformation && self.empployeeInformation.employeeType == SaleEmployeeType) {
        rowsNumber = 7;//7 rows
    }
    [employeeInformationTableView setDelegate:self];
    [employeeInformationTableView setDataSource:self];
    [employeeInformationTableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)clickSaveButton:(id)sender {
    //Dismiss keyboard
    [self.view endEditing:YES];
    BOOL insertFlag = YES;
    NSString *comment = @"";
    @try {
        for (int i = 3; i < rowsNumber; i++) {
            DetailEmployeeCell *cell = (DetailEmployeeCell *)[employeeInformationTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i
                                                                                                                                    inSection:0]];
            if (self.empployeeInformation.employeeType == NormalEmployeeType) {
                if (i == 3) {
                    //Salary
                    NSString *salary = cell.contentTextField.text;
                    [(NormalEmployee*)_empployeeInformation setNormalSalary:[salary intValue]];
                    continue;
                }
            }
            else if (self.empployeeInformation.employeeType == HourlyEmployeeType) {
                if (i == 3) {
                    //Hourly work
                    NSString *hourlyWork = cell.contentTextField.text;
                    [(HourlyEmployee*)_empployeeInformation setHoursWorked:[hourlyWork intValue]];
                    continue;
                }
                else if (i == 4) {
                    //Wage Per Hour
                    NSString *wagePerHour = cell.contentTextField.text;
                    [(HourlyEmployee*)_empployeeInformation setHourlyWage:[wagePerHour intValue]];
                    continue;
                }
            }
            else if (self.empployeeInformation.employeeType == SaleEmployeeType) {
                if (i == 3) {
                    //Basic salary
                    NSString *basicSalary = cell.contentTextField.text;
                    [(SaleEmployee*)_empployeeInformation setBaseSalary:[basicSalary intValue]];
                    continue;
                }
                else if (i == 4) {
                    //Gross Saled
                    NSString *grossSaled = cell.contentTextField.text;
                    [(SaleEmployee*)_empployeeInformation setGrossSale:[grossSaled intValue]];
                    continue;
                }
                else if (i == 5) {
                    //Commission Rate
                    NSString *commissionRate = cell.contentTextField.text;
                    [(SaleEmployee*)_empployeeInformation setCommissionRate:[commissionRate floatValue]];
                    continue;
                }
            }
            //Comment
            comment = cell.contentTextView.text;
        }
    }
    @catch (NSException *exception) {
        DLog(@"Exception:%@",exception.description);
        insertFlag = NO;
    }
    @finally {
        //Update
        if (insertFlag) {
            if ([[PCDatabaseManager sharedInstance] insertSalaryWithEmployee:self.empployeeInformation comment:comment] > 0) {
                //Successful
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Save successful!"
                                                               delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            else {
                //Error
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Save into database occur error!"
                                                               delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }
        else {
            //Input wrong value
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Input wrong values"
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!self.empployeeInformation) {
        return 0;
    }
    return rowsNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailEmployeeCell *cell = (DetailEmployeeCell*)[tableView dequeueReusableCellWithIdentifier:@"labelCell"];
    switch (indexPath.row) {
        case 0: {
            //Lastname
            cell.titleLabel.text = @"Lastname:";
            cell.contentLabel.text = self.empployeeInformation.lastName;
            break;
        }
        case 1: {
            //Firstname
            cell.titleLabel.text = @"Firstname:";
            cell.contentLabel.text = self.empployeeInformation.firstName;
            break;
        }
        case 2: {
            //Employee type
            cell.titleLabel.text = @"Employee type:";
            cell.contentLabel.text = [employeeTypes objectForKey:[NSString stringWithFormat:@"%d",self.empployeeInformation.employeeType]];
            break;
        }
        case 3: {
            cell = (DetailEmployeeCell*)[tableView dequeueReusableCellWithIdentifier:@"textfieldCell"];
            if (self.empployeeInformation.employeeType == NormalEmployeeType) {
                //Normal
                //Salary
                cell.titleLabel.text = @"Salary *:";
                cell.contentTextField.text = @"";
            }
            else if (self.empployeeInformation.employeeType == HourlyEmployeeType) {
                //Hourly
                //Hourly work
                cell.titleLabel.text = @"Hourly work *:";
                cell.contentTextField.text = @"";
            }
            else if (self.empployeeInformation.employeeType == SaleEmployeeType) {
                //Sale
                //Basic salary
                cell.titleLabel.text = @"Basic salary *:";
                cell.contentTextField.text = @"";
            }
            break;
        }
        case 4: {
            cell = (DetailEmployeeCell*)[tableView dequeueReusableCellWithIdentifier:@"textfieldCell"];
            if (self.empployeeInformation.employeeType == HourlyEmployeeType) {
                //Hourly
                
                //Wage Per Hour
                cell.titleLabel.text = @"Wage Per Hour *:";
                cell.contentTextField.text = @"";
                break;
            }
            else if (self.empployeeInformation.employeeType == SaleEmployeeType) {
                //Sale
                //Gross Saled
                cell.titleLabel.text = @"Gross Saled *:";
                cell.contentTextField.text = @"";
                break;
            }
            //Else create comment cell
        }
        case 5: {
            if (self.empployeeInformation.employeeType == SaleEmployeeType) {
                //Sale
                cell = (DetailEmployeeCell*)[tableView dequeueReusableCellWithIdentifier:@"textfieldCell"];
                [cell.contentTextField setKeyboardType:UIKeyboardTypeDecimalPad];
                
                //Commission Rate
                cell.titleLabel.text = @"Commission Rate *:";
                cell.contentTextField.text = @"";
                break;
            }
        }
        default:
            //Comment cell
            cell = (DetailEmployeeCell*)[tableView dequeueReusableCellWithIdentifier:@"textviewCell"];
            [cell.contentTextView.layer setCornerRadius:BORDER_CORNER_RADIUS];
            
            //Comment
            cell.titleLabel.text = @"Comment *:";
            cell.contentTextField.text = @"";
            break;
    }
    
    return cell;
}

#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == (rowsNumber - 1)) {
        return 70.0;
    }
    return 44.0;
}


#pragma mark - AlertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
