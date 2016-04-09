//
//  CatItem.m
//  PicEffect
//
//  Created by LingKangli on 16/4/7.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//

#import "CatItem.h"
#import "Command.h"

@interface CatItem ()
@end


@implementation CatItem

@synthesize imageName = _imageName;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor greenColor].CGColor;
        [self setUserInteractionEnabled:YES];
  
    }
    return self;
}


-(void)setImageName:(NSString *)imageName{

    _imageName = imageName;
    self.image = [UIImage imageNamed :imageName];
}

-(void)setGestureRecognizers:(LKLGestureState)gestureState{

    switch (gestureState) {
        case LKLGestureLong:{//长按
            //        长按事件
            UILongPressGestureRecognizer* longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
            [self addGestureRecognizer:longGesture];}
            break;
        case LKLGesturePan:{//拖动
            UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizer:)];
            panGesture.maximumNumberOfTouches = 3;//拖动时最多的指头数
            panGesture.minimumNumberOfTouches = 1;//拖动时最少的指头数
            [self addGestureRecognizer:panGesture];
        }
            break;
        case LKLGesturePin:{//缩放
            UIPinchGestureRecognizer* pinGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGestureRecognizer:)];
            [self addGestureRecognizer:pinGesture];
        }
            break;
        case LKLGestureRot:{//旋转
            UIRotationGestureRecognizer* rotGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotation:)];
            [self addGestureRecognizer:rotGesture];

        }
            break;
        case LKLGestureTaps:{//点击事件
            UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
            [self addGestureRecognizer:tapGesture];
        }
            break;
        default:
            break;
    }
}

/**
 *  点击事件
 *
 *  @param recognizer
 */
-(void)handleTapGesture:(UITapGestureRecognizer*)recognizer{

    recognizer.view.alpha = 0.5;
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        recognizer.view.alpha= 1;
    }
}

/**
 *  长按方法
 *
 *  @param recognizer
 */
-(void)handleLongPress:(UILongPressGestureRecognizer*)recognizer{

    recognizer.view.alpha = 0.7;
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        recognizer.view.alpha= 1;
    }
}


/**
 *  放大缩小方法
 *
 *  @param recognizer
 */
-(void)pinchGestureRecognizer:(UIPinchGestureRecognizer*)recognizer{

    CGFloat scale = recognizer.scale;
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, scale, scale); //在已缩放大小基础下进行累加变化；区别于：使用 CGAffineTransformMakeScale 方法就是在原大小基础下进行变化
    recognizer.scale = 1.0;
    
}

/**
 *  旋转方法
 *
 *  @param recognizer
 */
-(void)handleRotation:(UIRotationGestureRecognizer*)recognizer{

    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0.0;
}


/**
 *  拖动方法
 *
 *  @param recognizer
 */
-(void)panGestureRecognizer:(UIPanGestureRecognizer*)recognizer{
    
    CGPoint transPoint = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x+transPoint.x, recognizer.view.center.y+transPoint.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.superview];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            print("Began");
            break;
        case UIGestureRecognizerStateChanged:
            print("Changed");
            
            break;
        case UIGestureRecognizerStatePossible:
            
            print("Possible");
            self.layer.borderColor = [UIColor redColor].CGColor;
            break;
        case UIGestureRecognizerStateFailed:
            print("Failed");
            self.layer.borderColor = [UIColor brownColor].CGColor;
            
            break;
        case UIGestureRecognizerStateCancelled:
            
            print("Cancelled");
            self.layer.borderColor = [UIColor blueColor].CGColor;
            break;
        case UIGestureRecognizerStateEnded:
            self.layer.borderColor = [UIColor greenColor].CGColor;
            break;
        default:
            print("default");
            self.layer.borderColor = [UIColor lightGrayColor].CGColor;
            break;
    }
    
}


@end
