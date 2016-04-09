//
//  SecondViewController.m
//  PicEffect
//
//  Created by LingKangli on 16/4/7.
//  Copyright © 2016年 com.TongChang.Co., Ltd. All rights reserved.
//

#import "SecondViewController.h"
#import "CatItem.h"

@interface SecondViewController (){

    CatItem* catItem;
    CatItem* catItem2;
}

@end

@implementation SecondViewController

-(instancetype)init{

    self = [super init];
    if (self) {
        
        catItem = [[CatItem alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [catItem setImageName:@"leftCat.jpg"];
        [catItem setGestureRecognizers:LKLGestureLong];
        [catItem setGestureRecognizers:LKLGesturePan];
        [catItem setGestureRecognizers:LKLGesturePin];
        [catItem setGestureRecognizers:LKLGestureRot];
        [self.view addSubview:catItem];
        
        catItem2 = [[CatItem alloc]initWithFrame:CGRectMake(300, 100, 100, 100)];
        [catItem2 setImageName:@"rightCat.jpg"];
        [self.view addSubview:catItem2];

    }
    return self;
}

-(void)viewDidLoad{

    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton* returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [returnBtn setBackgroundColor:[UIColor blackColor]];
    [returnBtn setTitle:@"返回" forState:UIControlStateNormal];
    [returnBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(returnBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    
}

-(void)returnBtn{

    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
