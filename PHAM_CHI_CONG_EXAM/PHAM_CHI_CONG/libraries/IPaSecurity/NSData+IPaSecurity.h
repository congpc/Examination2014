//
//  NSData+IPaSecurity.h
//  IPaSecurity
//
//  Created by IPaPa on 13/2/7.
//  Copyright (c) 2013 IPaPa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#include <CommonCrypto/CommonHMAC.h>

@interface NSData (IPaSecurity)
//encryption
//with arguments mode:kCCModeCBC padding:NO iv:nil
-(NSData*)EncryotWithAlgorighm:(CCAlgorithm)algorithm key:(NSData*)key;
-(NSData*)EncryotWithAlgorighm:(CCAlgorithm)algorithm mode:(CCMode)mode padding:(BOOL)padding iv:(NSData*)iv key:(NSData*)key;
-(NSData*)EncryotWithAlgorighm:(CCAlgorithm)algorithm mode:(CCMode)mode padding:(BOOL)padding iv:(NSData*)iv key:(NSData*)key options:(CCModeOptions)options;
//decryption
-(NSData*)DecryotWithAlgorighm:(CCAlgorithm)algorithm key:(NSData*)key;
-(NSData*)DecryotWithAlgorighm:(CCAlgorithm)algorithm mode:(CCMode)mode padding:(BOOL)padding iv:(NSData*)iv key:(NSData*)key;
-(NSData*)DecryotWithAlgorighm:(CCAlgorithm)algorithm mode:(CCMode)mode padding:(BOOL)padding iv:(NSData*)iv key:(NSData*)key options:(CCModeOptions)options;


-(NSData*)CipherWithOperation:(CCOperation)operation algorighm:(CCAlgorithm)algorithm mode:(CCMode)mode padding:(BOOL)padding iv:(NSData*)iv key:(NSData*)key options:(CCModeOptions)options;



-(NSString*)SHA1String;
-(NSString*)SHA256String;
-(NSString*)MD5String;
-(NSString*)HexString;
+ (NSData*)dataFromHexString:(NSString*)string;
//currently support kCCHmacAlgSHA1 and kCCHmacAlgSHA256 and kCCHmacAlgMD5 only
-(NSData*)HMACDataWithAlgorithm:(CCHmacAlgorithm)algorithm sectet:(NSData*)key;
-(NSData*)HKDFDataWithAlgorithm:(CCHmacAlgorithm)algorithm Info:(NSData*)info withLength:(NSUInteger)length Salt:(NSData*)salt;
@end
