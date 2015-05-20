//
//  SalaryController.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/16/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SalaryController : NSObject

/**
 * Get contribution rate by salary
 * @param: salary (int)
 * @return: contribution rate (float)
 * @throws exception: PCSalaryException
 */
- (float)getContributionRate:(int)salary;

/**
 * Get tax rate by salary
 * @param: salary (int)
 * @return: tax rate (float)
 * @throws exception: PCSalaryException
 */
- (float)getTaxRate:(int)salary;

@end
