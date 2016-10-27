//
//  FadeInAnimationView.h
//  FadeInAnimation
//
//  Created by luowenx on 16/10/27.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#define weakify(...)  __attribute__((objc_ownership(weak))) __typeof__(__VA_ARGS__) __VA_ARGS__##_weak_ = (__VA_ARGS__);
#define strongify(...) __attribute__((objc_ownership(strong))) __typeof__(__VA_ARGS__) __VA_ARGS__ = __VA_ARGS__##_weak_;

#import <UIKit/UIKit.h>

@interface FadeInAnimationView : UIView

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray <UIImage*>*)images;

@property (strong, nonatomic, readonly) UIImageView *imageView;

@property (strong, nonatomic, readonly) NSArray *images;

@property (assign, nonatomic, readonly) NSInteger index;

@end
