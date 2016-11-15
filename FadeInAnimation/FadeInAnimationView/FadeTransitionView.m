//
//  FadeTransitionView.m
//  FadeInAnimation
//
//  Created by luowenx on 2016/11/15.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "FadeTransitionView.h"
#import "PureLayout.h"
@interface FadeTransitionView ()
@property (strong, nonatomic, readwrite) UIImageView *imageView;

@property (strong, nonatomic, readwrite) NSArray *images;

@property (assign, nonatomic, readwrite) NSInteger index;

@property (strong, nonatomic) NSTimer *timer;


@end

@implementation FadeTransitionView

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray <UIImage*>*)images
{
    NSAssert([images count]>1, @"The images must more than two sheets");
    _images = images;
    _index = 0;
    self = [super initWithFrame:frame];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self createViewAndSetPosition];
        _timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(transitionAni) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

// 创建视图并设置位置
- (void)createViewAndSetPosition
{
    _imageView = [UIImageView newAutoLayoutView];
    [self addSubview:_imageView];
    [_imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    UIImage *image = _images[_index];
    if (image) {
        _imageView.image = image;
    }
    
    
}

- (void)transitionAni {
    CATransition * ani = [CATransition animation];
    ani.type = kCATransitionFade;
    ani.subtype = kCATransitionFromBottom;
    ani.duration = 1.5;
    if (_index + 1 == [_images count]) {
        _index = 0;
    }else{
        _index += 1;
    }
    _imageView.image = _images[_index];
    [_imageView.layer addAnimation:ani forKey:@"transitionAni"];
}


@end
