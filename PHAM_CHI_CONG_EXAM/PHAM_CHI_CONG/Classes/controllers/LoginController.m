//
//  LoginController.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/15/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "LoginController.h"
#import "NSString+IPaSecurity.h"
#import "User.h"

@implementation LoginController

- (BOOL)signInWithUser:(User*)user {
    if (user == nil || user.username == nil || user.password == nil ||
        user.username.length <= 0 || user.username.length > 30 ||
        user.password.length <= 0 || user.password.length > 64) {
        return NO;
    }
    return [[PCDatabaseManager sharedInstance] checkLoginWithUsername:user.username password:[user.password SHA256String]];
}

@end
