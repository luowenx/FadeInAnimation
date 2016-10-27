//
//  FadeInAnimationView.m
//  FadeInAnimation
//
//  Created by luowenx on 16/10/27.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//


#import "FadeInAnimationView.h"
#import "PureLayout.h"

static const NSTimeInterval animationDuration  = 2;
@interface FadeInAnimationView ()

@property (strong, nonatomic, readwrite) UIImageView *imageView;

@property (strong, nonatomic, readwrite) NSArray *images;

@property (assign, nonatomic, readwrite) NSInteger index;


@end

@implementation FadeInAnimationView

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray <UIImage*>*)images
{
    NSAssert([images count], @"The images can not be empty");
    _images = images;
    _index = 0;
    self = [super initWithFrame:frame];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self createViewAndSetPosition];
    }
    return self;
}

// 创建视图并设置位置
- (void)createViewAndSetPosition
{
    _imageView = [UIImageView newAutoLayoutView];
    [self addSubview:_imageView];
    _imageView.alpha = 0.;
    [_imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    UIImage *image = _images[_index];
    if (image) {
        _imageView.image = image;
        [self animationFadeIn];
    }
}

// 淡出
-(void) animationFadeOut
{
    weakify(self)
    [UIView animateWithDuration:(animationDuration) animations:^{
        strongify(self)
        self.imageView.alpha = 0.0;
    } completion:^(BOOL finished) {
        strongify(self)
        //  换图
        [self currentImage];
        [self animationFadeIn];
    }];
}

// 淡入
-(void) animationFadeIn
{
    weakify(self)
    [UIView animateWithDuration:(animationDuration) animations:^{
        strongify(self)
        self.imageView.alpha = 1;
    } completion:^(BOOL finished) {
        strongify(self)
        [self animationFadeOut];
    }];
}

- (void) currentImage
{
    if (self.index + 1 == [self.images count]) {
        self.index = 0;
    }else{
        self.index += 1;
    }
    self.imageView.image = nil;
    self.imageView.image = self.images[self.index];
}


@end
