//
//  KeyframeAnimationVC.m
//  PicEffect
//
//  Created by LingKangli on 16/4/9.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//

#import "KeyframeAnimationVC.h"

@implementation KeyframeAnimationVC

-(void)viewDidLoad{

    self.view.backgroundColor = [UIColor grayColor];
    
    UIImageView* imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heart.png"]];
    imageV.frame =CGRectMake(100,100,100,100) ;
    
    CAAnimation* animation = [CAAnimation animation];
    animation.duration = 1.0;
    animation.fillMode = kCAFillModeForwards;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [imageV.layer addAnimation:animation forKey:nil];
    [self.view addSubview:imageV];
    
}

@end
