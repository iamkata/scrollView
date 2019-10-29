//
//  EOCTwoCustomViewController.m
//  ScrollView底层实现原理
//
//  Created by 八点钟学院 on 2017/9/22.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCTwoCustomViewController.h"
#import "EOCCustomScrollViewOne.h"
#import "EOCCustomScrollViewTwo.h"
#import "EOCCustomScrollViewThree.h"

@interface EOCTwoCustomViewController ()

@end

@implementation EOCTwoCustomViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    EOCCustomScrollViewOne *scrollViewOne = [[EOCCustomScrollViewOne alloc] initWithFrame:CGRectMake(0.f, 100.f, self.view.frame.size.width, 300.f)];
    scrollViewOne.contentSize = CGSizeMake(self.view.frame.size.width*2, 300.f);
    scrollViewOne.backgroundColor = [UIColor redColor];
    
    EOCCustomScrollViewTwo *scrollViewTwo = [[EOCCustomScrollViewTwo alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 300.f)];
    scrollViewTwo.contentSize = CGSizeMake(self.view.frame.size.width, 300.f);
    scrollViewTwo.backgroundColor = [UIColor blueColor];
    
//    EOCCustomScrollViewThree *scrollViewThree = [[EOCCustomScrollViewThree alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, 300.f)];
//    scrollViewThree.contentSize = CGSizeMake(self.view.frame.size.width*2, 300.f);
//    scrollViewThree.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:scrollViewOne];
    [scrollViewOne addSubview:scrollViewTwo];
//    [scrollViewTwo addSubview:scrollViewThree];
    
}


@end
