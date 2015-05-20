//
//  PCDatabaseManager.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/10/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "PCDatabaseManager.h"
#import "FMDB.h"
#import "Employee.h"
#import "NormalEmployee.h"
#import "HourlyEmployee.h"
#import "SaleEmployee.h"
#import "EmployeeInterface.h"

@interface PCDatabaseManager() {
    FMDatabase *database;
}
@end

@implementation PCDatabaseManager

#pragma mark - Lifecycle
/**
 * Contructor by singeton pattern
 * @param: None
 * @return: object of this class
 * @throws exception: None
 */
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}
- (instancetype)init {
    if (self = [super init]) {
        if (!database) {
            [self copyAndOpenDatabase];
        }
    }
    return self;
}
- (void)dealloc {
    if (database) {
        [database close];
    }
}

#pragma mark - Public
/**
 * Check database is exist, check login status with username and password
 * @param: username (NSString) and password (NSString)
 * @return: result (BOOL)
 * @throws exception: None
 */
- (BOOL)checkLoginWithUsername:(NSString*)username password:(NSString*)password {
    if (database == nil) {
        //Check databas exist!
        [self copyAndOpenDatabase];
    }
    //    DLog(@"pass:[%@]",password);
    //    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM `tbl_user` Where username='%@' and password='%@' and isaccountant=1;",username,password]; // Occur error with SQL injection -> Do not use it
    //    DLog(@"SQL:[%@]",sql);
    //    FMResultSet *result = [_database executeQuery:sql];
    
    NSString *sql = @"SELECT id FROM `tbl_user` Where username=? and password=? and isaccountant=1;";
    NSMutableArray *param = [[NSMutableArray alloc] initWithCapacity:2];
    [param addObject:username];
    [param addObject:password];
    FMResultSet *result = [database executeQuery:sql withArgumentsInArray:param];
    if(result && [result next]){
        DLog(@"Login success!");
        return YES;
    }
    DLog(@"Login error!");
    return NO;
}

/**
 * Check database is exist, get all employees on database
 * @param: None
 * @return: Employees list (NSArray)
 * @throws exception: None
 */
- (NSArray *)retrieveAllEmployees {
    if (database == nil) {
        //Check databas exist!
        [self copyAndOpenDatabase];
    }
    NSString *sql = @"SELECT id,employeetype_id,lastname,firstname FROM `tbl_user`;";
    FMResultSet *result = [database executeQuery:sql];
    if(!result){
        DLog(@"Error:%@", [database lastErrorMessage]);
        return nil; //Can't retrieve data from database
    }
    NSMutableArray *employeeArray = [[NSMutableArray alloc] init];
    while ([result next]) {
        NSDictionary *employeeDictionary = [result resultDictionary];
        DLog(@"EmployeeInfo:%@",employeeDictionary);
        Employee *employee = nil;
        int employeeTypeId = [[employeeDictionary objectForKey:@"employeetype_id"] intValue];
        if (employeeTypeId == NormalEmployeeType) {
            //Normal employee
            employee = [[NormalEmployee alloc] init];
        }
        else if (employeeTypeId == HourlyEmployeeType) {
            //Hourly employee
            employee = [[HourlyEmployee alloc] init];
        }
        else if (employeeTypeId == SaleEmployeeType) {
            //Sale employee
            employee = [[SaleEmployee alloc] init];
        }
        
        if (employee != nil) {
            [employee setEmployeeId:[[employeeDictionary objectForKey:@"id"] intValue]];
            [employee setEmployeeType:[[employeeDictionary objectForKey:@"employeetype_id"] intValue]];
            [employee setLastName:[employeeDictionary objectForKey:@"lastname"]];
            [employee setFirstName:[employeeDictionary objectForKey:@"firstname"]];
            [employeeArray addObject:employee];
        }
    }
    return employeeArray;
}

/**
 * Get all employee type
 * @param: None
 * @return: Employee type list by NSDictionary (Key is id and Value is employee type name)
 * @throws exception: None
 */
- (NSDictionary *)retrieveAllEmployeeType {
    if (database == nil) {
        //Check databas exist!
        [self copyAndOpenDatabase];
    }
    NSString *sql = @"SELECT * FROM `tbl_employeetype`;";
    FMResultSet *result = [database executeQuery:sql];
    if(!result){
        DLog(@"Error:%@", [database lastErrorMessage]);
        return nil; //Can't retrieve data from database
    }
    NSMutableDictionary *employeeTypes = [[NSMutableDictionary alloc] init];
    while ([result next]) {
        NSDictionary *employeeFromServer = [result resultDictionary];
        [employeeTypes addEntriesFromDictionary:@{[NSString stringWithFormat:@"%@",employeeFromServer[@"id"]]:
                                                      employeeFromServer[@"name"]}];
    }
    return employeeTypes;
}

/**
 * After calculate salary of that employee, then user insert employee information into database
 * @param: Employee information and comment
 * @return: Result by int value
 * @throws exception: None
 */
- (NSInteger)insertSalaryWithEmployee:(Employee*)employee comment:(NSString*)comment {
    if (!employee || !comment) {
        return -1;
    }
    //Init param for insert
    NSMutableArray *param = [[NSMutableArray alloc] initWithCapacity:8];
    [param addObject:@(employee.employeeId)];
    [param addObject:@([employee.employeeInterface retrieveBasicSalary])];
    if (employee.employeeType == HourlyEmployeeType) {
        [param addObject:@([(HourlyEmployee*)employee hoursWorked])];
    }
    else {
       [param addObject:@"0"];
    }
    if (employee.employeeType == SaleEmployeeType) {
        [param addObject:@([(SaleEmployee*)employee grossSale])];
        [param addObject:@([(SaleEmployee*)employee commissionRate])];
    }
    else {
        [param addObject:@"0"];
        [param addObject:@"0"];
    }
    [param addObject:@([employee.employeeInterface calculateGrossSalary])];
    [param addObject:@([employee calculateNetSalary])];
    [param addObject:comment];
    
    if (database == nil) {
        //Check databas exist!
        [self copyAndOpenDatabase];
    }
    
    NSString *sql = @"INSERT INTO `tbl_weeklysalary` "
    "(`user_id`, `basic_salary`, `worked_hour`, `gross_sale`, `commission_rate`, `gross_salary`, `net_salary`, `comment`) "
    "VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
    
    if([database executeUpdate:sql withArgumentsInArray:param]) {
        NSInteger result = (NSInteger)[database lastInsertRowId];
        return result;
    }else {
        NSLog(@"Error:%@", [database lastErrorMessage]);
    }
    return -1;
}

#pragma mark - Private
/**
 * Copy and open database
 * @param: None
 * @return: None
 * @throws exception: None
 */
- (void)copyAndOpenDatabase {
    if (database == nil) {
        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *documents_dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *db_path = [documents_dir stringByAppendingPathComponent:[NSString stringWithFormat:@"weekly_salary.sqlite"]];
        NSString *template_path = [[NSBundle mainBundle] pathForResource:@"weekly_salary" ofType:@"sqlite"];
        DLog(@"PathDB:%@",db_path);
        
        if (![fm fileExistsAtPath:db_path]) [fm copyItemAtPath:template_path toPath:db_path error:nil];
        database = [FMDatabase databaseWithPath:db_path];
    }
    [database open];
}



@end
