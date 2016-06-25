//
//  BaseViewController.h
//  CountDownTimer
//
//  Created by an on 16/6/22.
//  Copyright © 2016年 a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *baseBtn;

- (IBAction)baseBtnClicked:(id)sender;

@end
