//
//  ViewController.m
//  PicEffect
//
//  Created by LingKangli on 16/4/6.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "Command.h"
#import "CatItem.h"
#import <AVFoundation/AVFoundation.h>
#import "SecondViewController.h"
#import "AnimationViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>{
//    UIView * imageView;
    UIImageView* imageViewleft;
    UIImageView* imageViewRight;
    
    NSURL* url;
    AVAudioPlayer* audioPlayer ;

}

@end

@implementation ViewController

-(void)initView{
    
    [imageViewRight removeFromSuperview];
    [imageViewleft removeFromSuperview];
    imageViewleft = nil;
    imageViewRight = nil;
    
    imageViewleft = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 250, 250)];
    imageViewleft.image = [UIImage imageNamed:@"leftCat.jpg"];
    imageViewleft.layer.borderWidth = 1;
    imageViewleft.layer.borderColor = [UIColor greenColor].CGColor;
    [imageViewleft setUserInteractionEnabled:YES];
    [self.view addSubview:imageViewleft];
    
    imageViewRight = [[UIImageView alloc]initWithFrame:CGRectMake(300, 100, 250, 250)];
    imageViewRight.image = [UIImage imageNamed:@"rightCat.jpg"];
    imageViewRight.layer.borderWidth = 1;
    imageViewRight.layer.borderColor = [UIColor greenColor].CGColor;
    [imageViewRight setUserInteractionEnabled:YES];
    [self.view addSubview:imageViewRight];

    /**
     *  UISwipeGestureRecognizer 为轻扫操作
     */
    UISwipeGestureRecognizer* leftSwipeGestureRecognizer ;
    UISwipeGestureRecognizer* rightSwipeGestureRecognizer;
    UISwipeGestureRecognizer* topSwipeGestureRecognizer;
    UISwipeGestureRecognizer* bottomSwipeGestureRecognizer;
    
    leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    topSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    bottomSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    
    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    topSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    bottomSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    /**
     轻点操作
     
     - parameter Actiondo: 添加点击事件
     */
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
    [imageViewleft addGestureRecognizer:tapGesture];
    
    
    /**
     拖动操作
     
     - parameter panGestureRecognizer: 添加了拖动事件
     - parameter maximumNumberOfTouches: 最多手指触摸数量
     - parameter minimumNumberOfTouches: 最少手指触摸数量
     */
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizer:)];
    panGesture.delegate = self;
    panGesture.maximumNumberOfTouches = 3;
    panGesture.minimumNumberOfTouches = 1;
    //    [panGesture canPreventGestureRecognizer:tapGesture];
    [imageViewleft addGestureRecognizer:panGesture];
    
    /**
     捏合操作
     
     - parameter pinGestureRecognizer: 添加捏合事件
     */
    UIPinchGestureRecognizer* pinGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinGestureRecognizer:)];
    [imageViewleft addGestureRecognizer:pinGesture];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    url = [[NSBundle mainBundle]URLForResource:@"music.mp3" withExtension:Nil];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:Nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
    ;
    
    UIButton* replaceBtn = [[UIButton alloc]initWithFrame:CGRectMake(300, [[UIScreen mainScreen]bounds].size.height-200, [[UIScreen mainScreen]bounds].size.width*0.2, ScreenH*0.1)];
    [replaceBtn setTitle:@"画面还原" forState:UIControlStateNormal];
    [replaceBtn setBackgroundColor:[UIColor greenColor]];
    [replaceBtn addTarget:self action:@selector(replceBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:replaceBtn];
    
    UIButton* animationBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, replaceBtn.frame.origin.y,replaceBtn.frame.size.width, replaceBtn.frame.size.height)];
    [animationBtn setBackgroundColor:[UIColor greenColor]];
    [animationBtn addTarget:self action:@selector(goAnimation) forControlEvents:UIControlEventTouchUpInside];
    [animationBtn setTitle:@"动画页面" forState:UIControlStateNormal];
    [self.view addSubview:animationBtn];
    
    UIButton* goNextPage = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW-replaceBtn.frame.size.width, replaceBtn.frame.origin.y, replaceBtn.frame.size.width, replaceBtn.frame.size.height)];
    [goNextPage setBackgroundColor:[UIColor blueColor]];
    [goNextPage setTitle:@"跳转旋转画面" forState:UIControlStateNormal];
    [goNextPage addTarget:self action:@selector(goNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goNextPage];

}
-(void)goAnimation{

    AnimationViewController* animationVC = [[AnimationViewController alloc]init];
    [self.navigationController pushViewController:animationVC animated:NO];
}

-(void)replceBtn{

    [self initView];
}

-(void)goNextPage{

    NSLog(@"%@",self.navigationController);
    SecondViewController* secondVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:NO];
    
}

-(void)pinGestureRecognizer:(UIPinchGestureRecognizer*)recognizer{

    
//    CGPoint translation = [recognizer ];
    
}

-(void)panGestureRecognizer:(UIPanGestureRecognizer*)recognizer{
    
    CGPoint transPoint = [recognizer translationInView:imageViewleft];
    recognizer.view.center = CGPointMake(recognizer.view.center.x+transPoint.x, recognizer.view.center.y+transPoint.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    imageViewleft.layer.borderColor = [UIColor blackColor].CGColor;
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            print("Began");
            break;
        case UIGestureRecognizerStateChanged:
            print("Changed");
            
            if (imageViewleft.frame.origin.x+imageViewleft.frame.size.width == imageViewRight.frame.origin.x && imageViewRight.frame.origin.y == imageViewleft.frame.origin.y) {
                imageViewleft.layer.borderWidth = 0;
                imageViewRight.layer.borderWidth = 0;
                [imageViewleft removeGestureRecognizer:recognizer];
                
                [audioPlayer prepareToPlay];
                [audioPlayer play];
            }
            
            break;
        case UIGestureRecognizerStatePossible:
            
            print("Possible");
            imageViewleft.layer.borderColor = [UIColor redColor].CGColor;

            break;
            
//        case UIGestureRecognizerStateRecognized:
//            print("Recognized");
//            imageView.layer.borderColor = [UIColor grayColor].CGColor;
//            break;
            
        case UIGestureRecognizerStateFailed:
            print("Failed");
            imageViewleft.layer.borderColor = [UIColor brownColor].CGColor;

            break;
        case UIGestureRecognizerStateCancelled:

            print("Cancelled");
            imageViewleft.layer.borderColor = [UIColor blueColor].CGColor;


            break;
        case UIGestureRecognizerStateEnded:
            imageViewleft.layer.borderColor = [UIColor greenColor].CGColor;
            if (imageViewleft.frame.origin.x+imageViewleft.frame.size.width == imageViewRight.frame.origin.x && imageViewRight.frame.origin.y == imageViewleft.frame.origin.y) {
                [imageViewleft removeGestureRecognizer:recognizer];
            }

            break;
        default:
            
            print("default");
            imageViewleft.layer.borderColor = [UIColor lightGrayColor].CGColor;


            break;
    }
    
     
   /*
    CGPoint translation = [recognizer translationInView:imageView];
    recognizer.view.center = CGPointMake(recognizer.view.center.x+translation.x, recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    NSLog(@"translation is %f,%f",translation.x,translation.y);
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan || recognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"触摸开始或者发生改变");
    }else if (recognizer.state == UIGestureRecognizerStateEnded){
        NSLog(@"触摸结束。");
    }
    */
    /**
     *  只可以向右移动
     *
     *  @param recognizer.state
     *
     *  @return
     */
    /*
    if ((recognizer.state == UIGestureRecognizerStateBegan) ||
        (recognizer.state == UIGestureRecognizerStateChanged))
    {
        CGPoint offset = [recognizer translationInView:self.view];
        CGRect frame = view.frame;
        frame.origin.x += offset.x;
        if (frame.origin.x >= 0 && frame.origin.x <= [[UIScreen mainScreen]bounds].size.width)
        {
            view.frame = frame;
        }
        
        [recognizer setTranslation:CGPointZero inView:self.view];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        BOOL isVisible = view.frame.origin.x < [[UIScreen mainScreen]bounds].size.width / 2;
//        [self showRightView:isVisible];
        
    }*/
    
}

-(void)Actiondo:(UITapGestureRecognizer*)sender{
    NSLog(@"被点击");
}

-(void)handleSwipes:(UISwipeGestureRecognizer*)sender{

//    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
//        CGPoint labelPosition = CGPointMake(view.frame.origin.x-100, view.frame.origin.y);
//        view.frame = CGRectMake(labelPosition.x, labelPosition.y, view.frame.size.width, view.frame.size.height);
//        NSLog(@"向左滑动") ;
//    }
//    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
//        CGPoint labelPosition = CGPointMake(view.frame.origin.x+100, view.frame.origin.y);
//        view.frame = CGRectMake(labelPosition.x, labelPosition.y, view.frame.size.width, view.frame.size.height);
//        NSLog(@"向右滑动");
//    }
    
//    if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
//        CGPoint labelPosition = CGPointMake(view.frame.origin.x, view.frame.origin.y-10);
//        view.frame = CGRectMake(labelPosition.x, labelPosition.y, view.frame.size.width, view.frame.size.height);
//        NSLog(@"向右滑动");
//    }
//    if (sender.direction == UISwipeGestureRecognizerDirectionDown)
    
    
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionDown: {
            CGPoint labelPosition = CGPointMake(imageViewleft.frame.origin.x, imageViewleft.frame.origin.y+10);
            imageViewleft.frame = CGRectMake(labelPosition.x, labelPosition.y, imageViewleft.frame.size.width, imageViewleft.frame.size.height);
            NSLog(@"向下滑动");
        }
            break;
        case UISwipeGestureRecognizerDirectionUp:{
            CGPoint labelPosition = CGPointMake(imageViewleft.frame.origin.x, imageViewleft.frame.origin.y-10);
            imageViewleft.frame = CGRectMake(labelPosition.x, labelPosition.y, imageViewleft.frame.size.width, imageViewleft.frame.size.height);
            NSLog(@"向上滑动");
        }

            
            break;
        case UISwipeGestureRecognizerDirectionLeft:{
            CGPoint labelPosition = CGPointMake(imageViewleft.frame.origin.x-100, imageViewleft.frame.origin.y);
            imageViewleft.frame = CGRectMake(labelPosition.x, labelPosition.y, imageViewleft.frame.size.width, imageViewleft.frame.size.height);
            NSLog(@"向左滑动") ;
        }
            break;
        case UISwipeGestureRecognizerDirectionRight: {
            CGPoint labelPosition = CGPointMake(imageViewleft.frame.origin.x+100, imageViewleft.frame.origin.y);
            imageViewleft.frame = CGRectMake(labelPosition.x, labelPosition.y, imageViewleft.frame.size.width, imageViewleft.frame.size.height);
            NSLog(@"向右滑动");
        }

            
            break;
            
        default:
            NSLog(@"default");
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
