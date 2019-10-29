//
//  EOCCustomScrollViewController.m
//  ScrollView底层实现原理
//
//  Created by 八点钟学院 on 2017/9/21.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCCustomScrollViewController.h"
#import "EOCCustomScrollView.h"

@interface EOCCustomScrollViewController ()

@end

@implementation EOCCustomScrollViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    EOCCustomScrollView *scrollView = [[EOCCustomScrollView alloc] initWithFrame:CGRectMake(150.f, 88.f, 100, 150.f)];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width*2, scrollView.frame.size.height);
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    ///添加子view
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(50.f, 20.f, 40.f, 40.f)];
    blueView.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:blueView];
    
}



@end
