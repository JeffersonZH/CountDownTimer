//
//  TimerViewController.h
//  CountDownTimer
//
//  Created by an on 16/6/22.
//  Copyright © 2016年 a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *countDownBtn;

- (IBAction)countDownBtnClicked:(id)sender;

@end
