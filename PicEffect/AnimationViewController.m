//
//  AnimationViewController.m
//  PicEffect
//
//  Created by LingKangli on 16/4/8.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//

#import "AnimationViewController.h"
#import "AnimationItem.h"
#import "KeyframeAnimationVC.h"

#define kYOffset 100
#define num 9

@interface AnimationViewController (){
    NSMutableArray* array ;
    
}

@end

@implementation AnimationViewController

-(instancetype)init{

    self = [super init];
    if (self) {
        
//        [self initScaleLayer];
//        [self initGroupLayer];
        
        array = [[NSMutableArray alloc]init];
    
        self.view.backgroundColor = [UIColor greenColor];
        
        UIButton* KeyFrameAnimationBtn = [[UIButton alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-100, [[UIScreen mainScreen]bounds].size.height-100, 100, 50)];
        KeyFrameAnimationBtn.backgroundColor= [UIColor blackColor];
        [KeyFrameAnimationBtn setTitle:@"keyFrameAnimation" forState:UIControlStateNormal];
        [KeyFrameAnimationBtn addTarget:self action:@selector(keyframeVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:KeyFrameAnimationBtn];
        
        for (int i = 0 ; i < num; i++) {
            AnimationItem* animation = [[AnimationItem alloc]init];
            animation.frame= CGRectMake(100+300*i/5, 100+300*i/5, 100, 100);
            switch (i) {
                case 0:
                    [animation setImage:[UIImage imageNamed:@"heartImg.png"]];
                    [animation setAnimationState:LKLAnimationScale];
                    break;
                case 1:
                    [animation setImage:[UIImage imageNamed:@"heartImg.png"]];
                    [animation setAnimationState:LKLAnimationScaleX];
                    break;
                case 2:
                    [animation setImage:[UIImage imageNamed:@"heartImg.png"]];
                    [animation setAnimationState:LKLAnimationScaleY];
                    break;
                    
                case 3:
                    [animation setImage:[UIImage imageNamed:@"cat.png"]];
                    [animation setAnimationState:LKLAnimationPostion];
                    break;
                case 4:
                    [animation setImage:[UIImage imageNamed:@"cat.png"]];
                    [animation setAnimationState:LKLAnimationPostionX];
                    break;
                case 5:
                    [animation setImage:[UIImage imageNamed:@"cat.png"]];
                    [animation setAnimationState:LKLAnimationPostionY];
                    break;
                case 6:
                    [animation setImage:[UIImage imageNamed:@"fengche.png"]];
                    [animation setAnimationState:LKLAnimationRotation];
                    break;
                case 7:
                    [animation setImage:[UIImage imageNamed:@"fengche.png"]];
                    [animation setAnimationState:LKLAnimationRotationX];
                    break;
                case 8:
                    [animation setImage:[UIImage imageNamed:@"fengche.png"]];
                    [animation setAnimationState:LKLAnimationRotationY];
                    break;
                default:
                    break;
                    
            }
            [array addObject:animation];

            [self.view addSubview:animation];
            
            
        }

        
    }
    return self;
}

-(void)keyframeVC{

    KeyframeAnimationVC* keyframeAnimationVC = [[KeyframeAnimationVC alloc]init];
    [self.navigationController pushViewController:keyframeAnimationVC animated:YES];
}

-(void)viewDidLoad{

    [super viewDidLoad];

    

//    //演员初始化
//    CALayer *scaleLayer = [[CALayer alloc] init];
//    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
//    scaleLayer.frame = CGRectMake(60, 20 + kYOffset, 50, 50);
//    scaleLayer.cornerRadius = 10;
//    [self.view.layer addSublayer:scaleLayer];
////    [scaleLayer release];
//    
//    //设定剧本
//    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
//    scaleAnimation.autoreverses = YES;
//    scaleAnimation.fillMode = kCAFillModeForwards;
//    scaleAnimation.repeatCount = MAXFLOAT;
//    scaleAnimation.duration = 0.8;
//    
//    //开演
//    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

-(void)viewDidLayoutSubviews{

    NSLog(@"viewDidLayoutSubviews");
}

-(void)viewDidAppear:(BOOL)animated{
    for (int i = 0 ; i < [array count]; i++) {
        [((AnimationItem*)[array objectAtIndex:i]) resumeLayer];
    }
    NSLog(@"viewDidAppear");
}



-(void)initScaleLayer{

    //演员初始化
    CALayer* scaleLayer = [[CALayer alloc]init];
    scaleLayer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"heart.png"]].CGColor;
    scaleLayer.frame = CGRectMake(60, 20+kYOffset, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
    
    //设定剧本
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //transform.rotation 摇摆效果
    //transform.scale 心跳效果
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.8;//动画时间
    
    //开演
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];

}

-(void)initGroupLayer{

    //演员初始化
    CALayer* groupLayer = [[CALayer alloc]init];
    groupLayer.frame = CGRectMake(60, 340+100+kYOffset, 50, 50);
    groupLayer.cornerRadius = 10;
    groupLayer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"heart.png"]].CGColor;
    [self.view.layer addSublayer:groupLayer];
    
    //设定剧本
//    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
//    scaleAnimation.autoreverses = YES;
//    scaleAnimation.repeatCount = MAXFLOAT;
//    scaleAnimation.duration = 0.8;
    
    /*
    CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:groupLayer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(320-80, groupLayer.position.y)];
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount =MAXFLOAT;
    moveAnimation.duration = 2;
    [groupLayer addAnimation:moveAnimation forKey:@"scaleAnimation"];
    */
    
    CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation.fromValue = [NSNumber numberWithFloat:groupLayer.position.x];
    moveAnimation.toValue = [NSNumber numberWithFloat:300];
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount =MAXFLOAT;
    moveAnimation.duration = 2;
    [groupLayer addAnimation:moveAnimation forKey:@"scaleAnimation"];

//    CABasicAnimation* rotaAnimation = [CABasicAnimation animationWithKeyPath:@"rotation"];
//    rotaAnimation.fromValue = [NSNumber numberWithFloat:<#(float)#>];
    
//    CABasicAnimation* rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
//    rotateAnimation.fromValue  = [NSNumber numberWithFloat:0.0];
//    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0* M_PI];
//    rotateAnimation.autoreverses = YES;
//    rotateAnimation.repeatCount = MAXFLOAT;
//    rotateAnimation.duration = 2;
    
//    CAAnimationGroup* groupAnnimation = [CAAnimationGroup animation];
//    groupAnnimation.duration = 2;
//    groupAnnimation.autoreverses = YES;
////    groupAnnimation.animations = @[moveAnimation,scaleAnimation,rotateAnimation];
//    groupAnnimation.animations = @[moveAnimation,scaleAnimation,rotateAnimation];
//    groupAnnimation.repeatCount = MAXFLOAT;
//    
//    //开演
//    [groupLayer addAnimation:groupAnnimation forKey:@"groupAnnimation"];
    
}

@end
