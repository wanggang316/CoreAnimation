//
//  WGBasicAnimationViewController.m
//  CoreAnimation
//
//  Created by 王刚 on 14/6/25.
//  Copyright (c) 2014年 王刚. All rights reserved.
//

#import "WGBasicAnimationViewController.h"

@interface WGBasicAnimationViewController ()

@end

@implementation WGBasicAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self demo2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)demo1 {
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @77;
    animation.toValue = @300;
    animation.duration = 3;
    
    //方法1:
    //设置留在最终状体
//    animation.fillMode = kCAFillModeForwards;
    //防止被自动移除
//    animation.removedOnCompletion = NO;
    
    //动画完成后移除
    [self.walkManImageView.layer addAnimation:animation forKey:@"basic"];
    
    //方法2:
    //直接更新model layer的属性，一旦动画完成并从layer中移除，presentation layer将回到model layer设置的值，而这个值恰好与动画最后一个步骤相匹配
    self.walkManImageView.layer.position = CGPointMake(300, 90);

}

- (void)demo2 {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @16;
    animation.byValue = @284;
    animation.duration = 3;
    
    [self.walkManImageView.layer addAnimation:animation forKey:@"basic"];
    self.walkManImageView.layer.position = CGPointMake(300, 240);
    
    //1s后影响imageview2
    animation.beginTime = CACurrentMediaTime() + 1;
    
    [self.imageView2.layer addAnimation:animation forKey:@"basic"];
    self.imageView2.layer.position = CGPointMake(300, 312);
    
}



@end
