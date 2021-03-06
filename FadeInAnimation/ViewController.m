//
//  ViewController.m
//  FadeInAnimation
//
//  Created by luowenx on 16/10/27.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "ViewController.h"
#import "FadeInAnimationView.h"
#import "PureLayout.h"
#import "FadeTransitionView.h"
@interface ViewController ()

@property (strong, nonatomic) FadeInAnimationView *fadeAnimationView;

@property (strong, nonatomic) FadeTransitionView *fadeTransitionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewAndSetPosition];
}


// 创建视图并设置位置
- (void)createViewAndSetPosition
{
//    NSArray *array = @[[UIImage imageNamed:@"111"] ,
//                                [UIImage imageNamed:@"222"],
//                                [UIImage imageNamed:@"333"]];
//    _fadeAnimationView = [[FadeInAnimationView alloc] initWithFrame:CGRectNull images:array];
//    [self.view addSubview:_fadeAnimationView];
//    [_fadeAnimationView autoCenterInSuperview];
//    [_fadeAnimationView autoSetDimensionsToSize:CGSizeMake(150, 70)];

    NSArray *array = @[[UIImage imageNamed:@"111"] ,
                       [UIImage imageNamed:@"222"],
                       [UIImage imageNamed:@"333"]];
    _fadeTransitionView = [[FadeTransitionView alloc] initWithFrame:CGRectNull images:array];
    [self.view addSubview:_fadeTransitionView];
    [_fadeTransitionView autoCenterInSuperview];
    [_fadeTransitionView autoSetDimensionsToSize:CGSizeMake(150, 70)];
}




@end
