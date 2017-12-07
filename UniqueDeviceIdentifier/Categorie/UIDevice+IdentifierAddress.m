//
//  UIDevice+IdentifierAddress.m
//  MyNewTestProject
//
//  Created by 梅洋 on 2017/11/30.
//  Copyright © 2017年 梅洋. All rights reserved.
//

#import "UIDevice+IdentifierAddress.h"
#import "NSString+MD5Address.h"
#import  <AdSupport/AdSupport.h>

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>


@implementation UIDevice (IdentifierAddress)

- (NSString *)macAddress {
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}


/**
 返回MAC和CFBundleIdentifier的MD5值
 @return 返回MAC和CFBundleIdentifier的MD5值
 */

- (NSString *)uniqueDeviceIdentifier {
    
    NSString *macAddress = [[UIDevice currentDevice] macAddress];
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    
    NSString *stringToHash = [NSString stringWithFormat:@"%@%@",macAddress,bundleIdentifier];
    NSString *uniqueIdentifier = [stringToHash stringFromMD5];
    
    return uniqueIdentifier;
}


/**
 返回设备的MAC值
 @return 返回设备的MAC值
 */
- (NSString *)uniqueGlobalDeviceIdentifier {
    
    NSString *macAddress = [[UIDevice currentDevice] macAddress];
    
    return macAddress;
}


/**
 返回MAC的MD5值
 @return 返回MAC的MD5值
 */
- (NSString *)uniqueGlobal_Md5_DeviceIdentifier {
    
    NSString *macAddress = [[UIDevice currentDevice] macAddress];
    NSString *uniqueIdentifier = [macAddress stringFromMD5];
    
    return uniqueIdentifier;
}

/**
 返回设备的广告标识IDFA
 @return identifierForIdentifier
 */
- (NSString *)uniqueDeviceAdvertisingIdentifier {
    
    NSString *uniqueIdentifier = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];

    return uniqueIdentifier;
}


/**
 返回拼接的设备的广告标识IDFA和设备的MAC的MD5值
 
 @return 返回拼接的设备的广告标识IDFA和设备的MAC的MD5值
 */
- (NSString *)returnDeviceIDFAWithMd5MacAddress {
    
    // 设备的广告标识IDFA
    NSString *uniqueIdentifier = [self uniqueDeviceAdvertisingIdentifier];
    // 设备的MAC的MD5值
    NSString *macAddressMd5 = [self uniqueGlobal_Md5_DeviceIdentifier];
    // 返回拼接的字符串
    NSString *returnMd5MacIdfa = [NSString stringWithFormat:@"%@||%@",uniqueIdentifier,macAddressMd5];
    
    return returnMd5MacIdfa;
}




@end
