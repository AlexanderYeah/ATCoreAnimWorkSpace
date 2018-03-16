//
//  ViewController.m
//  CAGradientLayer
//
//  Created by AY on 2018/3/15.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**
 容器View
 */
@property (nonatomic,strong)UIView *containerView;



/**
 容器View
 */
@property (nonatomic,strong)UIView *containerView1;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	self.containerView = [[UIView alloc]initWithFrame:CGRectMake(80, 100, 200, 200)];
	
	[self.view addSubview:self.containerView];
	
	self.containerView1 = [[UIView alloc]initWithFrame:CGRectMake(80, 350, 200, 200)];
	
	[self.view addSubview:self.containerView1];
	
	[self baseChange];
	
	[self multiChange];
}


/**
 	基础渐变 多种颜色渐变
	locations
 */
- (void)baseChange
{

	// 创建layer
	CAGradientLayer *layer = [CAGradientLayer layer];
	
	layer.frame = CGRectMake(0, 0, 200, 200);
	
	[self.containerView.layer addSublayer:layer];
	
	// 渐变颜色数组的两级
	layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
	// 设置渐变的起始位置 左上角开始
	layer.startPoint = CGPointMake(0, 0);
	// 设置渐变的结束位置 右下角结束
	layer.endPoint = CGPointMake(1, 1);
	
}


- (void)multiChange
{
	// CALayer
	
	
		// 创建layer
	CAGradientLayer *layer = [CAGradientLayer layer];
	
	layer.frame = CGRectMake(0, 0, 200, 200);
	
	[self.containerView1.layer addSublayer:layer];
	
	// 渐变颜色数组的两级
	layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
	// locations
	
	layer.locations = @[@0.0,@0.25,@0.5,@0.75];
	
	// 设置渐变的起始位置 左上角开始
	layer.startPoint = CGPointMake(0, 0);
	// 设置渐变的结束位置 右下角结束
	layer.endPoint = CGPointMake(1, 1);
	

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
