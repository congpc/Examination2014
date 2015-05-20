//
//  IPaKeyChain.h
//  IPaKeyChain
//
//  Created by IPaPa on 12/10/15.
//  Copyright (c) 2012年 IPaPa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
@interface IPaKeyChain : NSObject
+(void)save:(NSString *)service data:(id)data;
+(id)load:(NSString *)service;
+(void)delete:(NSString *)service;

@end
