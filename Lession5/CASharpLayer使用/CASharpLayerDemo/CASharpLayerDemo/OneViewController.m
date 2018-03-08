//
//  OneViewController.m
//  CASharpLayerDemo
//
//  Created by AY on 2018/3/7.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationItem.title = @"基本使用";
	[self show];
}


- (void)show{

	// 1 绘制路径
	UIBezierPath *path = [[UIBezierPath alloc]init];
	[path moveToPoint:CGPointMake(200, 200)];
	
	// 绘制一个六边形 不规则图形
	[path addLineToPoint:CGPointMake(150, 250)];
	[path addLineToPoint:CGPointMake(200, 300)];
	[path addLineToPoint:CGPointMake(300, 300)];
	[path addLineToPoint:CGPointMake(350, 250)];
	[path addLineToPoint:CGPointMake(300, 200)];
	[path addLineToPoint:CGPointMake(200, 200)];
	
	
	
	CAShapeLayer *layer = [CAShapeLayer layer];
	// 填充色
	layer.strokeColor = [UIColor redColor].CGColor;
	// 线内部的颜色
	layer.fillColor = [UIColor cyanColor].CGColor;
	// 线宽度
	layer.lineWidth = 2;
	// 线连接点样式
	layer.lineJoin = kCALineJoinRound;
	// 绘制
	layer.path = path.CGPath;
	
	[self.view.layer addSublayer:layer];
	
	
	
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
