//
//  ViewController.m
//  ScrollView底层实现原理
//
//  Created by 八点钟学院 on 2017/9/21.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "ViewController.h"
#import "EOCCustomScrollViewController.h"
#import "EOCTwoCustomViewController.h"
#import "EOCSystemScrollViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource> {
    
    NSArray *textArr;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    textArr = @[@"自定义scrollView", @"自定义scrollView事件传递", @"系统的scrollView参照", @"contentInset的实际意义"];
    
    self.navigationItem.title = @"八点钟学院";
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    UIView *view = [[UIView alloc] init];
    table.tableFooterView = view;
    [self.view addSubview:table];
    
}

#pragma mark - tableView delegate && datasource method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return textArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"8pm"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"8pm"];
        cell.textLabel.text = textArr[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        EOCCustomScrollViewController *scrollViewCtrl = [[EOCCustomScrollViewController alloc] init];
        [self.navigationController pushViewController:scrollViewCtrl animated:YES];
        
    } else if (indexPath.row == 1) {
        
        EOCTwoCustomViewController *viewCtrl = [[EOCTwoCustomViewController alloc] init];
        [self.navigationController pushViewController:viewCtrl animated:YES];
        
    } else if (indexPath.row == 2) {
        
        EOCSystemScrollViewController *viewCtrl = [[EOCSystemScrollViewController alloc] init];
        [self.navigationController pushViewController:viewCtrl animated:YES];
        
    } else if (indexPath.row == 3) {
        
        EOCSystemScrollViewController *viewCtrl = [[EOCSystemScrollViewController alloc] init];
        [self.navigationController pushViewController:viewCtrl animated:YES];
        
    }
    
}
@end
