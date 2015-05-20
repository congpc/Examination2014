//
//  LoginController.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/15/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface LoginController : NSObject

/**
 * Check validation when user input username and password. And call login service.
 * @param: user with username (NSString) and password (NSString)
 * @return: result (BOOL)
 * @throws exception: None
 */
- (BOOL)signInWithUser:(User*)user;

@end
