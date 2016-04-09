//
//  CatItem.h
//  PicEffect
//
//  Created by LingKangli on 16/4/7.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LKLGestureTaps,//点击事件
    LKLGesturePan,//拖动事件
    LKLGesturePin,//缩放事件
    LKLGestureRot,//旋转事件
    LKLGestureLong //长按事件
} LKLGestureState;


@interface CatItem : UIImageView

@property(nonatomic,assign)NSString* imageName;
//@property(nonatomic,assign)
-(void)setGestureRecognizers:(LKLGestureState)gestureState;

@end
