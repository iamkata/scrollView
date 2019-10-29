//
//  EOCCustomScrollView.m
//  ScrollView底层实现原理
//
//  Created by 八点钟学院 on 2017/9/21.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCCustomScrollView.h"

@interface EOCCustomScrollView()<UIGestureRecognizerDelegate>
@end

@implementation EOCCustomScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    _panGesture = [[EOCPanGestureOne alloc] initWithTarget:self action:@selector(panAction:)];
    _panGesture.delegate = self;
    _panGesture.cancelsTouchesInView = NO;
    [self addGestureRecognizer:_panGesture];
    
    return self;
    
}

//是否响应手势的四个touch方法
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//
//    NSLog(@"view %@", gestureRecognizer.view);
//    if (self.bounds.origin.x == self.contentSize.width - self.frame.size.width) {
//
//        CGPoint prevPoint = [touch previousLocationInView:self];
//        CGPoint currentPoint = [touch locationInView:self];
//        if (currentPoint.x < prevPoint.x) {
//
//            return NO;
//
//        }
//
//    }
//    return YES;
//
//}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {

    NSLog(@"gestureRecognizerShouldBegin %@", gestureRecognizer.view);
    if (self.bounds.origin.x == self.contentSize.width - self.frame.size.width) {

        //往左滑动
        CGPoint transitionPoint = [gestureRecognizer translationInView:self];
        if (transitionPoint.x < 0) {
            return NO;
        }
        return YES;
    }

    return YES;
}

//或者实现下面这个方法
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}


- (void)panAction:(UIPanGestureRecognizer *)gestureRecognizer {
    
    NSLog(@"bounds.x %f", self.bounds.origin.x);
    CGRect tmpBounds = self.bounds;
    
    ///横向的scrollView，往左/往右
    //UIEvent locationInview  prevLocationInview
    
    CGPoint transitionPoint = [gestureRecognizer translationInView:self];
    
    
    ///移动距离是有最大值和最小值
    CGFloat minimumOffset = 0.f;
    CGFloat maxOffset = _contentSize.width - tmpBounds.size.width;
    CGFloat actualOffset = fmax(minimumOffset, fmin(maxOffset, (tmpBounds.origin.x - transitionPoint.x)));
    tmpBounds.origin.x = actualOffset;
    
    
//    if (transitionPoint.x < 0 && (tmpBounds.origin.x - transitionPoint.x) <= (_contentSize.width - tmpBounds.size.width)) {  //往左
//
//        tmpBounds.origin.x -= transitionPoint.x;
//
//    } else if (transitionPoint.x > 0 && (tmpBounds.origin.x - transitionPoint.x) >= 0) {  //往右
//
//        tmpBounds.origin.x -= transitionPoint.x;
//
//    }
    
    //设置移动的距离为0,不让他叠加,不然移动的很快
    [gestureRecognizer setTranslation:CGPointZero inView:self];
    self.bounds = tmpBounds;
    
}

@end
