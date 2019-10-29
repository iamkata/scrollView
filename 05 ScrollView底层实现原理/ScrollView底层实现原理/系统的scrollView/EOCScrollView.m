//
//  EOCScrollView.m
//  ScrollView底层实现原理
//
//  Created by 八点钟学院 on 2017/9/25.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCScrollView.h"

@implementation EOCScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.panGestureRecognizer.delegate = self;
    }
    return self;
}

#pragma mark - 重写手势代理，如果是右滑，则禁用掉mainScrollView自带的
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{

    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;

    CGFloat pointX = [pan translationInView:self].x;

    if (pointX < 0 && self.contentOffset.x == self.contentSize.width-self.frame.size.width) {
        return NO;
    }

    return YES;
}


@end
