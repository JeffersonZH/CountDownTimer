//
//  TimerAssistant.h
//  CountDownTimer
//
//  Created by JeffersonZH on 16/6/22.
//  Copyright © 2016年 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TimerAssistant : NSObject

//开启倒计时
+ (dispatch_source_t)startTimerWithKey:(NSString *)key tipButton:(UIButton *)button;
//自动倒计时
+ (dispatch_source_t)timerCountDownWithKey:(NSString *)key tipButton:(UIButton *)button start:(BOOL)start;
//取消倒计时
+ (void)cancelTimerWithKey:(NSString *)key;

@end
