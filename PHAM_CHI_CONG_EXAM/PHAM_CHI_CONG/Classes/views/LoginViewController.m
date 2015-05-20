//
//  ViewController.m
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/9/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginController.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize warningAlertView;

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [kAppDelegate setLoginStatus:NO];
}

- (void)didReceiveMemoryWarning {
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    self.warningAlertView = nil;
}

#pragma mark - IBAction
/**
 * User click on login button for sign in system
 * @param: button
 * @return: IBAction
 * @throws exception: None
 */
- (IBAction)clickLoginButton:(id)sender {
    if (warningAlertView) {
        [warningAlertView dismissWithClickedButtonIndex:0 animated:NO];
        warningAlertView = nil;
    }
    if (!_usernameTextField || !_usernameTextField.text || !_usernameTextField.text.length) {
        warningAlertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Username not empty!"
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        warningAlertView.tag = TAG_ALERT_VIEW;
        [warningAlertView show];
    }
    else if (!_passwordTextField || !_passwordTextField.text || !_passwordTextField.text.length) {
        warningAlertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Password not empty!"
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        warningAlertView.tag = TAG_ALERT_VIEW;
        [warningAlertView show];
    }
    else {
        LoginController *controller = [[LoginController alloc] init];
        User *user = [[User alloc] init];
        user.username = _usernameTextField.text;
        user.password = _passwordTextField.text;
        if ([controller signInWithUser:user]) {
            //Login success
            //Move to main screen
            [kAppDelegate setLoginStatus:YES];
            UINavigationController *mainNavigation = [self.storyboard instantiateViewControllerWithIdentifier:@"main_navigation"];
            [[kAppDelegate window] setRootViewController:mainNavigation];
        }
        else {
            //Login fail, display error alert 
            warningAlertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Username or Password is invalid! Please try again!"
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            warningAlertView.tag = TAG_ALERT_VIEW;
            [warningAlertView show];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    warningAlertView = nil;
}

@end
