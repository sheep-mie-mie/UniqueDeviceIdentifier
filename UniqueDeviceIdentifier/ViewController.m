//
//  ViewController.m
//  UniqueDeviceIdentifier
//
//  Created by 梅洋 on 2017/11/30.
//  Copyright © 2017年 梅洋. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice+IdentifierAddress.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"--我的Mac地址%@", [[UIDevice currentDevice] uniqueGlobalDeviceIdentifier]);
    NSLog(@"--我的Mac地址MD5加密:%@", [[UIDevice currentDevice] uniqueGlobal_Md5_DeviceIdentifier]);
    NSLog(@"--我的广告标识地址:%@", [[UIDevice currentDevice] uniqueDeviceAdvertisingIdentifier]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
