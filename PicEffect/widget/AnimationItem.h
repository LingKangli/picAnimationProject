//
//  AnimationItem.h
//  PicEffect
//
//  Created by LingKangli on 16/4/8.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//

#import "ViewController.h"

typedef enum : NSUInteger {
    LKLAnimationRotation,//旋转效果
    LKLAnimationRotationX,//旋转X效果
    LKLAnimationRotationY,//旋转Y效果

    LKLAnimationPostion,//位移效果
    LKLAnimationPostionX,//位移X效果
    LKLAnimationPostionY,//位移Y效果

    LKLAnimationScale,//缩放效果
    LKLAnimationScaleX,//以X缩放效果
    LKLAnimationScaleY,//以Y缩放效果


} LKLAnimationState;


@interface AnimationItem : UIView

-(void)setImage:(UIImage*)image;
-(void)setAnimationState:(LKLAnimationState)animationState;

@end
