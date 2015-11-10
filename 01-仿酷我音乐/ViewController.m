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
/**
 struct CGAffineTransform {
     CGFloat a, b, c, d;
     CGFloat tx, ty;
 };
 
 tx / ty 处理位移的
 a / d 是处理缩放比例的
 a / b / c / d 共同处理旋转角度的
 */
- (void)panGesture:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint point = [recognizer translationInView:self.demoView];
    
    CGAffineTransform transform = self.demoView.transform;

    CGFloat viewAngle = atan2(transform.b, transform.a);
    
    CGFloat dx = point.x * cos(viewAngle);
    CGFloat dy = point.y * sin(viewAngle);
    
    CGFloat angle = (dx + dy) / self.view.bounds.size.width;

    // 倾斜视图
    transform = CGAffineTransformRotate(transform, angle);
    // 平移视图
    transform.tx += 2 * (dx + dy);
    
    self.demoView.transform = transform;
    
    [recognizer setTranslation:CGPointZero inView:self.demoView];
}

@end
