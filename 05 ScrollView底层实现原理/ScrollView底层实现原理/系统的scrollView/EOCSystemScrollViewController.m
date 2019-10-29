//
//  EOCSystemScrollViewController.m
//  ScrollView底层实现原理
//
//  Created by 八点钟学院 on 2017/9/22.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCSystemScrollViewController.h"
#import "EOCScrollView.h"

@interface EOCSystemScrollViewController ()<UIGestureRecognizerDelegate, UIScrollViewDelegate> {
    
    EOCScrollView *scrollViewOne;
    
}

@end

@implementation EOCSystemScrollViewController

//系统scrollView的delegate必须得是自己
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createMultiScrollView];
//    [self createOneScrollView];
//    [self createSystemScrollView];
}

- (void)createSystemScrollView {
    
    //灰色的scrollView添加到红色的scrollView上
    //现实情况是,可以滑动到父scrollView上
    UIScrollView *scrollViewOne = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 100.f, self.view.frame.size.width, 300.f)];
    scrollViewOne.backgroundColor = [UIColor redColor];
    
    scrollViewOne.contentSize = CGSizeMake(self.view.frame.size.width*2, 300.f);
    
    UIScrollView *scrollViewTwo = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 300.f)];
    scrollViewTwo.contentSize = CGSizeMake(self.view.frame.size.width*2, 300.f);
    scrollViewTwo.backgroundColor = [UIColor lightGrayColor];
    
//    UIScrollView *scrollViewThree = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 300.f)];
//    scrollViewThree.contentSize = CGSizeMake(self.view.frame.size.width*2, 300.f);
//    scrollViewThree.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:scrollViewOne];
    [scrollViewOne addSubview:scrollViewTwo];
    //[scrollViewTwo addSubview:scrollViewThree];
    
}

- (void)createMultiScrollView {
    
    EOCScrollView *scrollViewOne = [[EOCScrollView alloc] initWithFrame:CGRectMake(0.f, 100.f, self.view.frame.size.width, 300.f)];
    scrollViewOne.backgroundColor = [UIColor redColor];
    
    scrollViewOne.contentSize = CGSizeMake(self.view.frame.size.width*2, 300.f);
    
    EOCScrollView *scrollViewTwo = [[EOCScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 300.f)];
    scrollViewTwo.contentSize = CGSizeMake(self.view.frame.size.width*2, 600.f);
    scrollViewTwo.backgroundColor = [UIColor lightGrayColor];
    
    EOCScrollView *scrollViewThree = [[EOCScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 300.f)];
    scrollViewThree.contentSize = CGSizeMake(self.view.frame.size.width*2, 300.f);
    scrollViewThree.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:scrollViewOne];
    [scrollViewOne addSubview:scrollViewTwo];
    [scrollViewTwo addSubview:scrollViewThree];
    
}

//contentInset：可以扩展内容区域
- (void)createOneScrollView {
    
    scrollViewOne = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, self.view.frame.size.height)];
    scrollViewOne.delegate = self;

    scrollViewOne.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollViewOne.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    scrollViewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollViewOne];
//    scrollViewOne.contentInset = UIEdgeInsetsMake(88.f, 0.f, 0.f, 0.f);
//    scrollViewOne.contentOffset = CGPointMake(0.f, -88.f);
    
    
    ///946
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"product_0"]];
    imgView.frame = CGRectMake(0.f, 0.f, self.view.frame.size.width, 400.f);
    [scrollViewOne addSubview:imgView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"scrollView bounds %@", NSStringFromCGRect(scrollView.bounds));
    NSLog(@"scrollView safeAreaInsets %@", NSStringFromUIEdgeInsets(scrollView.safeAreaInsets));
    NSLog(@"scrollVIew adjustInsets %@", NSStringFromUIEdgeInsets(scrollView.adjustedContentInset));
    
    
    //safeAreaInsets和adjustedContentInset的区别
//    UIScrollViewContentInsetAdjustmentAutomatic
//     adjust= safecontentInset+scrollView.contentInset
//never: adjust = scrollView.contentInset
    
}

@end
