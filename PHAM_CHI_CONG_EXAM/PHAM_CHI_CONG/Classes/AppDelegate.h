//
//  AppDelegate.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/9/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAppDelegate (AppDelegate*)[[UIApplication sharedApplication] delegate]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) BOOL loginStatus;

- (BOOL)checkLoginStatus:(UIViewController*)controller;

@end

