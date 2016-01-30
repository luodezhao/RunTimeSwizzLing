//
//  ViewController.m
//  RunTimeTEST
//
//  Created by YB on 16/1/16.
//  Copyright © 2016年 YB. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "UILabel+font.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:label];
}
#pragma mark -- method swizzzling
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
