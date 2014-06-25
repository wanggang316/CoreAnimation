//
//  WGKeyFrameForPathViewController.m
//  CoreAnimation
//
//  Created by 王刚 on 14/6/25.
//  Copyright (c) 2014年 王刚. All rights reserved.
//

#import "WGKeyFrameForPathViewController.h"

@interface WGKeyFrameForPathViewController ()

@end

@implementation WGKeyFrameForPathViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    
    //calculationMode是控制关键帧动画时间的另一种方法
    //我们通过将其设置为kCAAnimationPaced，让Core Animation向被驱动的对象施加一个恒定速度，不管路径的各个线段多长，将其设置为kCAAnimationPaced将无视所有我们已经设置的keyTimes
    orbit.calculationMode = kCAAnimationPaced;
    //确保物体沿着路径旋转。如果为nil会怎样？物体的方向不变
    orbit.rotationMode = nil;
    
    [self.movingImageView.layer addAnimation:orbit forKey:@"orbit"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
