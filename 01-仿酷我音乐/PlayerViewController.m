//
//  PlayerViewController.m
//  01-仿酷我音乐
//
//  Created by 刘凡 on 15/11/11.
//  Copyright © 2015年 joyios. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    
    // 设置定位点
    self.view.layer.anchorPoint = CGPointMake(0.5, 1.0);

    // 设置背景颜色
    self.view.backgroundColor = [UIColor blueColor];
    // 设置视图大小
    self.view.frame = [UIScreen mainScreen].bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
