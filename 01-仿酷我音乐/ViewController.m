//
//  ViewController.m
//  01-仿酷我音乐
//
//  Created by 刘凡 on 15/11/10.
//  Copyright © 2015年 joyios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *demoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];

    self.demoView = [[UIView alloc] init];
    self.demoView.backgroundColor = [UIColor whiteColor];
    
    // 设置定位点，注意：一定要设置完定位点之后，再设置 frame
    self.demoView.layer.anchorPoint = CGPointMake(0.5, 1.0);
    // 设置视图位置
    self.demoView.frame = self.view.bounds;
    
    [self.view addSubview:self.demoView];
    
    // 添加手势识别
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.demoView addGestureRecognizer:pan];
}

/// 处理拖动手势
- (void)panGesture:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint point = [recognizer translationInView:self.demoView];
    
    NSLog(@"%@", NSStringFromCGPoint(point));

    // 倾斜视图
    CGFloat angle = point.x / self.view.bounds.size.width * M_PI_2;
    self.demoView.transform = CGAffineTransformRotate(self.demoView.transform, angle);
    
    [recognizer setTranslation:CGPointZero inView:self.demoView];
}

@end
