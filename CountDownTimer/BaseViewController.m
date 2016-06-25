//
//  BaseViewController.m
//  CountDownTimer
//
//  Created by an on 16/6/22.
//  Copyright © 2016年 a. All rights reserved.
//

#import "BaseViewController.h"
#import "TimerViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)baseBtnClicked:(id)sender {
    TimerViewController * timer = [[TimerViewController alloc] init];
    [self.navigationController pushViewController:timer animated:YES];
}


@end
