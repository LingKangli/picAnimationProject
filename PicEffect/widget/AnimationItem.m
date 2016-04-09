//
//  AnimationItem.m
//  PicEffect
//
//  Created by LingKangli on 16/4/8.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//


/**
 
 使用如下方法：
 
 AnimationItem* animation = [[AnimationItem alloc]init];//定义UIView的子类
 animation.frame= CGRectMake(100+300*i/5, 100+300*i/5, 100, 100);//位置及大小
 [animation setImage:[UIImage imageNamed:@"heartImg.png"]];//添加图片
 [animation setAnimationState:LKLAnimationScale];//添加动画
 [self.view addSubview:animation]//将定义好的图片动画添加到视图上。
 */

#import "AnimationItem.h"

@implementation AnimationItem

-(instancetype)init{

    self = [super init];
    if (self) {

    }
    return self;
}

-(void)setImage:(UIImage*)image{

    self.layer.bounds  = self.frame;
    self.layer.contents = (id)image.CGImage;
}

-(void)setAnimationState:(LKLAnimationState)animationState{

    switch (animationState) {
        case LKLAnimationPostion:{//以对角线移动
        
            CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
            moveAnimation.fromValue = [NSValue valueWithCGPoint:self.layer.position];//起点
            moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.layer.position.x+100, self.layer.position.y+100)];//终点
            moveAnimation.autoreverses = YES;//是否循环
            moveAnimation.repeatCount =MAXFLOAT;//重复次数
            moveAnimation.duration = 2;//执行一次需要的时间
            moveAnimation.removedOnCompletion = NO;//必需要加，否则页面返回后，动画停止
            [self.layer addAnimation:moveAnimation forKey:@"postionAnimation"];
        }
            
            break;
        case LKLAnimationPostionX:{//左右摇动
            
            CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
            moveAnimation.fromValue = [NSNumber numberWithFloat:self.layer.position.x];
            moveAnimation.toValue = [NSNumber numberWithFloat:self.layer.position.x+200];
            moveAnimation.autoreverses = YES;
            moveAnimation.repeatCount =MAXFLOAT;
            moveAnimation.duration = 2;
            moveAnimation.removedOnCompletion = NO;
            [self.layer addAnimation:moveAnimation forKey:@"postionAnimationX"];
        }
            
            break;
        case LKLAnimationPostionY:{//左右摇动
            
            CABasicAnimation* moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
            moveAnimation.fromValue = [NSNumber numberWithFloat:self.layer.position.y];
            moveAnimation.toValue = [NSNumber numberWithFloat:self.layer.position.y + 100];
            moveAnimation.autoreverses = YES;
            moveAnimation.repeatCount =MAXFLOAT;
            moveAnimation.removedOnCompletion = NO;
            moveAnimation.duration = 2;
            [self.layer addAnimation:moveAnimation forKey:@"postionAnimationY"];
        }
            
            break;
            
        case LKLAnimationRotation:{//以中心点旋转
            
            CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
            rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
            rotateAnimation.autoreverses = NO;
            rotateAnimation.repeatCount = MAXFLOAT;
            rotateAnimation.duration = 2;
            rotateAnimation.removedOnCompletion = NO;
            [self.layer addAnimation:rotateAnimation forKey:@"rotationAnimation"];
        }
            
            break;
        case LKLAnimationRotationX:{//以横轴旋转
            
            CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
            rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
            rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
            rotateAnimation.autoreverses = YES;
            rotateAnimation.repeatCount = MAXFLOAT;
            rotateAnimation.duration = 2;
            rotateAnimation.removedOnCompletion = NO;
            [self.layer addAnimation:rotateAnimation forKey:@"rotationAnimationX"];
        }
            
            break;
        case LKLAnimationRotationY:{//横中心轴旋转
            
            CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
            rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
            rotateAnimation.autoreverses = YES;
            rotateAnimation.repeatCount = MAXFLOAT;
            rotateAnimation.duration = 2;
            rotateAnimation.removedOnCompletion = NO;

            [self.layer addAnimation:rotateAnimation forKey:@"rotationAnimationY"];
        }
            
            break;
            
        case LKLAnimationScale:{//收缩效果
        
            CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            baseAnimation.fromValue = [NSNumber numberWithFloat:1.0];
            baseAnimation.toValue = [NSNumber numberWithFloat:2.0];
            baseAnimation.autoreverses = YES;
            baseAnimation.fillMode = kCAFillModeBackwards;
            baseAnimation.repeatCount = MAXFLOAT;
            baseAnimation.duration = 0.8;
            baseAnimation.removedOnCompletion = NO;

            [self.layer addAnimation:baseAnimation forKey:@"scaleAnimation"];
        }
            break;
        case LKLAnimationScaleX:{//收缩效果
            
            CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
            baseAnimation.fromValue = [NSNumber numberWithFloat:1.0];
            baseAnimation.toValue = [NSNumber numberWithFloat:2.0];
            baseAnimation.autoreverses = YES;
            baseAnimation.fillMode = kCAFillModeBackwards;
            baseAnimation.repeatCount = MAXFLOAT;
            baseAnimation.duration = 0.8;
            baseAnimation.removedOnCompletion = NO;

            [self.layer addAnimation:baseAnimation forKey:@"scaleAnimationX"];
        }
            break;
        case LKLAnimationScaleY:{//收缩效果
            
            CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
            baseAnimation.fromValue = [NSNumber numberWithFloat:1.0];
            baseAnimation.toValue = [NSNumber numberWithFloat:2.0];
            baseAnimation.autoreverses = YES;
            baseAnimation.fillMode = kCAFillModeBackwards;
            baseAnimation.removedOnCompletion = NO;

            baseAnimation.repeatCount = MAXFLOAT;
            baseAnimation.duration = 0.8;
            [self.layer addAnimation:baseAnimation forKey:@"scaleAnimationY"];
        }
            break;
        default:
            break;
    }
}

@end
