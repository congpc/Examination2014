//
//  User.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "Employee.h"

@interface User : Employee {

}
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@end
