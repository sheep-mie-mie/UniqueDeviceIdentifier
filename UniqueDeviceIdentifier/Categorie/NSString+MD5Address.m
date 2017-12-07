//
//  NSString+MD5Address.m
//  MyNewTestProject
//
//  Created by 梅洋 on 2017/11/30.
//  Copyright © 2017年 梅洋. All rights reserved.
//

#import "NSString+MD5Address.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (MD5Address)

- (NSString *)stringFromMD5 {
    
    if (self == nil || [self length] == 0) {
        return nil;
    }
    
    const char *value = [self UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    
    /**
     * 需要在工程里配置ARC环境下使用MRC
     */
//    return [outputString autorelease];
    return outputString;
}


@end
