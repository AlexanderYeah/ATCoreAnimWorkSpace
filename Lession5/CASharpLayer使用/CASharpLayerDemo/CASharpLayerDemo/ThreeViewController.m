//
//  ThreeViewController.m
//  CASharpLayerDemo
//
//  Created by AY on 2018/3/7.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.navigationItem.title = @"圆形进度环";
	
	
	// 画出路径
	
	UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(180, 250) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
	
	
	// CASharp
	CAShapeLayer *layer = [[CAShapeLayer alloc]init];
	layer.lineWidth = 2;
	layer.fillColor = [UIColor clearColor].CGColor;
	layer.strokeColor = [UIColor redColor].CGColor;
	layer.path = path.CGPath;
	[self.view.layer addSublayer:layer];
	
	
	// 动画
	CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	pathAnima.duration = 3.0f;
	pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
	pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
	pathAnima.fillMode = kCAFillModeForwards;
	pathAnima.removedOnCompletion = NO;
	pathAnima.repeatCount = MAXFLOAT;
	[layer addAnimation:pathAnima forKey:@"strokeEndAnimation"];



	
	
	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
