//
//  WGTimingFunctionViewController.m
//  CoreAnimation
//
//  Created by 王刚 on 14/6/29.
//  Copyright (c) 2014年 王刚. All rights reserved.
//

#import "WGTimingFunctionViewController.h"

@interface WGTimingFunctionViewController ()

@end

@implementation WGTimingFunctionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self demo2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)demo {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @0;
    animation.toValue = @285;
    animation.duration = 3;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //kCAMediaTimingFunctionLinear          匀速
    //kCAMediaTimingFunctionEaseIn          加速   慢进
    //kCAMediaTimingFunctionEaseOut         减速   漫出
    //kCAMediaTimingFunctionEaseInEaseOut   先加速后减速 慢进慢出
    //kCAMediaTimingFunctionDefault         减速
    
    [self.movingImageView.layer addAnimation:animation forKey:@"basic"];
    
    self.movingImageView.layer.position = CGPointMake(285, 260);
    
}


- (void)demo2 {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @0;
    animation.toValue = @285;
    animation.duration = 3;
    
    //在一定限度内，你也可以使用+functionWithControlPoints::::创建自己的easing函数。通过传递cubic Bezier曲线的两个控制点的x和y坐标，你可以轻松的创建自己定义easing函数，比如我为我们的红色小红色小火箭选择的那个。
    animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5 :0 :0.9 :0.7];
    
    [self.movingImageView.layer addAnimation:animation forKey:@"basic"];
    self.movingImageView.layer.position = CGPointMake(285, 260);
}



@end
