//
//  ViewController.m
//  隐式动画-事务
//
//  Created by Alexander on 2018/6/14.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIView *bgView;

@property (nonatomic,strong)CALayer *colorLayer;

@property (nonatomic,strong)UIButton *changeBtn;




@end

@implementation ViewController




- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.bgView = [[UIView alloc]initWithFrame:CGRectMake(75, 200, 200, 200)];
	self.bgView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
	[self.view addSubview:self.bgView];
	

	
	self.colorLayer = [CALayer layer];
	self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
	self.colorLayer.frame = CGRectMake(30, 20, 140, 140);
	[self.bgView.layer addSublayer:self.colorLayer];
	
	
	self.changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	[self.changeBtn setTitle:@"changeColor" forState:UIControlStateNormal];
	self.changeBtn.frame = CGRectMake(30, 170, 140, 25);
	[self.changeBtn addTarget:self action:@selector(changeColorClick) forControlEvents:UIControlEventTouchUpInside];
	self.changeBtn.backgroundColor = [UIColor redColor];
	[self.bgView addSubview:self.changeBtn];
	
}

/**
	隐式动画：没有指定动画类型，仅仅改变动画的一个属性。Core Anamation 决定如何或者合适做动画
*/


- (void)changeColorClick
{
	// 开启一个新的事务
	[CATransaction begin];
	
	// 设置事务的时间
	[CATransaction setAnimationDuration:15.0f];
	
	
	CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;

	self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f].CGColor;
	
	// 提交事务
	[CATransaction commit];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
