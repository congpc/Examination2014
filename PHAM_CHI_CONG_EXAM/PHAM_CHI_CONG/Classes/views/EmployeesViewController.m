//
//  EmployeesViewController.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/9/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "EmployeesViewController.h"
#import "EmployeeController.h"
#import "LoginViewController.h"
#import "Employee.h"
#import "SalaryCalculationViewController.h"

@interface EmployeesViewController ()

@end

@implementation EmployeesViewController


#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Check login status, if do not login then move to login screen
    if (![kAppDelegate checkLoginStatus:self]) {
        return;
    }
    
    [self loadAllEmployees];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public
//None

#pragma mark - Private
/**
 * Load all employee list
 * @param: None
 * @return: void
 * @throws exception: None
 */
- (void)loadAllEmployees {
    EmployeeController *controller = [[EmployeeController alloc] init];
    if (!_employees) {
        _employees = [[NSMutableArray alloc] init];
    }
    else {
        [_employees removeAllObjects];
    }
    
    [_employees addObjectsFromArray:[controller retrieveAllEmployees]];
}

#pragma mark - Segue
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SalaryCalculationViewController *nextController = [segue destinationViewController];
    [nextController setEmpployeeInformation:(Employee*)sender];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _employees.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeCell *cell = (EmployeeCell*)[tableView dequeueReusableCellWithIdentifier:@"employeeContentCell"];
    [cell setTag:indexPath.row + 1];
    [cell setEmployeeCellDelegate:self];
    
    if (_employees.count != 0) {
        Employee *employee = [_employees objectAtIndex:indexPath.row];
        cell.employeeIdLabel.text = [NSString stringWithFormat:@"%d",employee.employeeId];
        cell.lastnameLabel.text = employee.lastName;
        cell.firstnameLabel.text = employee.firstName;
    }
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"employeeCellHeader";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    return headerView;
}

#pragma mark - EmployeeCellCallback
- (void)employeeCell:(EmployeeCell*)employeeCell didSelectRowAtIndex:(int)index {
    //Callback when user click on salary calculation on each employee
    Employee *employee = [_employees objectAtIndex:(index - 1)];
    
    [self performSegueWithIdentifier:@"detailEmployee_segue" sender:employee];
}
@end
