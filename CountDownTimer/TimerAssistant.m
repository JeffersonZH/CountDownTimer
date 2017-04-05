//
//  TimerAssistant.m
//  CountDownTimer
//
//  Created by JeffersonZH on 16/6/22.
//  Copyright © 2016年 a. All rights reserved.
//

#import "TimerAssistant.h"

//用于存放第二次进入TimerViewController时显示的时间
NSMutableDictionary * timerIntervalsDic;
//timer字典
NSMutableDictionary * timersDic;
//倒计时总时间
NSInteger countDownSecond = 10;

@implementation TimerAssistant

+ (double)timeIntervalWithKey:(NSString *)key {
    if (timerIntervalsDic && [timerIntervalsDic objectForKey:key] != NULL) {
        return [[timerIntervalsDic objectForKey:key] doubleValue];
    }
    return 0;
}

//开启倒计时
+ (dispatch_source_t)startTimerWithKey:(NSString *)key tipButton:(UIButton *)button {
    //初始化两个字典
    if (!timerIntervalsDic) {
        timerIntervalsDic = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    if (!timersDic) {
        timersDic = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    //记录间隔时间
    [timerIntervalsDic setObject:@(CFAbsoluteTimeGetCurrent()) forKey:key];
    //如果timer存在，则cancel
    [self cancelTimerWithKey:key];
    return [self timerCountDownWithKey:key tipButton:button start:YES];
}

//自动倒计时
+ (dispatch_source_t)timerCountDownWithKey:(NSString *)key tipButton:(UIButton *)button start:(BOOL)start {
    //倒计时时间
    __block int timeout = 0;
    double timerInterval = [self timeIntervalWithKey:key];
    if (timerInterval <= 0) {
        return nil;
    }
    double interval = CFAbsoluteTimeGetCurrent() - timerInterval;
    if (interval < countDownSecond) {
        timeout = countDownSecond - (int)interval - 1;
    }
    if (timeout <= 0 && !start) {
        return nil;
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //倒计时结束显示内容
                [button setTitle:@"重新发送" forState:UIControlStateNormal];
                button.backgroundColor = [UIColor colorWithRed:200/255.0 green:34/255.0 blue:34/255.0 alpha:1.0];
            });
        }else{
            int seconds = timeout % countDownSecond;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //倒计时过程中显示内容
                [button setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                button.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    [timersDic setObject:_timer forKey:key];
    return _timer;
}

//取消倒计时
+(void)cancelTimerWithKey:(NSString *)timerKey {
    dispatch_source_t timer = [timersDic objectForKey:timerKey];
    if (timer) {
        dispatch_source_cancel(timer);
        [timersDic removeObjectForKey:timerKey];
    }
}

@end
