# UniqueDeviceIdentifier

- 需要注意MD5加密使用了MRC需要手动在工程配置一下

```
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
```
