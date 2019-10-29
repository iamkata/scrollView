//
//  EOCCustomScrollView.h
//  ScrollView底层实现原理
//
//  Created by 八点钟学院 on 2017/9/21.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EOCPanGestureOne.h"

@interface EOCCustomScrollView : UIView

@property(nonatomic, assign)CGSize contentSize;
@property(nonatomic, strong)EOCPanGestureOne *panGesture;

@end
