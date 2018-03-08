//
//  TwoViewController.m
//  CASharpLayerDemo
//
//  Created by AY on 2018/3/7.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.navigationItem.title = @"抢红包曲线";
	
	UIBezierPath *path = [UIBezierPath bezierPath];
	// 移到开始的位置
	[path moveToPoint:CGPointMake(-150, 0)];
	
	CGFloat end_x = self.view.frame.size.width;
	CGFloat end_y = 0;
	
	// 二次贝塞尔曲线
	[path addQuadCurveToPoint:CGPointMake(end_x + 150, end_y) controlPoint:CGPointMake(end_x / 2, end_y + 300)];
	
	
	
	// 创建一个CASharpLayer
	
	CAShapeLayer *layer = [[CAShapeLayer alloc]init];
	layer.fillColor = [UIColor redColor].CGColor;
	layer.lineWidth = 2;
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
