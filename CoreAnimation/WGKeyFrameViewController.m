//
//  WGKeyFrameViewController.m
//  CoreAnimation
//
//  Created by 王刚 on 14/6/25.
//  Copyright (c) 2014年 王刚. All rights reserved.
//

#import "WGKeyFrameViewController.h"

@interface WGKeyFrameViewController ()

@end

@implementation WGKeyFrameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self demo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)demo {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@0, @10, @-10, @10, @0];
    animation.keyTimes = @[ @0, @(1/6.0), @(3/6.0), @(5/6.0), @1];
    animation.duration = 1.0;
    
    animation.additive = YES;
    
    [self.textField.layer addAnimation:animation forKey:@"shake"];
}


@end
