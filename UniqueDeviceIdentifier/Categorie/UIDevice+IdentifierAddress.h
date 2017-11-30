//
//  UIDevice+IdentifierAddress.h
//  MyNewTestProject
//
//  Created by 梅洋 on 2017/11/30.
//  Copyright © 2017年 梅洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (IdentifierAddress)


/**
 返回设备的MAC和CFBundleIdentifier的MD5值
 @return 返回MAC和CFBundleIdentifier的MD5值
 */
- (NSString *)uniqueDeviceIdentifier;


/**
 返回设备的MAC值
 @return 返回设备的MAC值
 */
- (NSString *)uniqueGlobalDeviceIdentifier;


/**
 返回设备的MAC的MD5值
 @return 返回MAC的MD5值
 */
- (NSString *)uniqueGlobal_Md5_DeviceIdentifier;


/**
 返回设备的广告标识IDFA
 @return identifierForIdentifier
 */
- (NSString *)uniqueDeviceAdvertisingIdentifier;



@end
