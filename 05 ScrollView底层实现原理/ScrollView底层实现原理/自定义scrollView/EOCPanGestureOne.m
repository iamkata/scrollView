//
//  EOCPanGestureOne.m
//  UIScrollView 事件分析
//
//  Created by 八点钟学院 on 2017/6/12.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCPanGestureOne.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation EOCPanGestureOne

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"oneGesture touchBegan ");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"oneGesture touchesMoved");
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"oneGesture touchesEnded");
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"oneGesture touchesCancelled");
    [super touchesCancelled:touches withEvent:event];
}

@end
