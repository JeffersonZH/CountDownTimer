//
//  TimerViewController.m
//  CountDownTimer
//
//  Created by an on 16/6/22.
//  Copyright © 2016年 a. All rights reserved.
//

#import "TimerViewController.h"
#import "TimerAssistant.h"

#define timerKeyRegister    @"timer_register"   //用户注册

@interface TimerViewController ()

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _countDownBtn.layer.cornerRadius = 5.0;
    _countDownBtn.layer.masksToBounds = YES;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //自动启动timer
    [TimerAssistant timerCountDownWithKey:timerKeyRegister tipButton:_countDownBtn start:NO];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //取消timer
    [TimerAssistant cancelTimerWithKey:timerKeyRegister];
}

- (IBAction)countDownBtnClicked:(id)sender {
    //调用发送验证码接口，并收到成功回调后，执行下面函数
    [TimerAssistant startTimerWithKey:timerKeyRegister tipButton:_countDownBtn];
}


@end
