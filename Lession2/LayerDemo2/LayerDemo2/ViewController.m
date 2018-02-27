//
//  ViewController.m
//  LayerDemo2
//
//  Created by AY on 2018/2/27.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIView *demoView1;

@property (nonatomic,strong)UIView *demoView2;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.demoView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView1.backgroundColor = [UIColor redColor];
	[self.view addSubview:self.demoView1];
	
	
	self.demoView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
	self.demoView2.backgroundColor = [UIColor greenColor];

	[self.demoView1 addSubview:self.demoView2];
	
	
	// 设置position
	self.demoView2.layer.position = CGPointMake(50, 50);
	
	// 修改锚点
	// 就表示 demoView2 这个图层 左上角这个点 移动到 50 50 这个位置
	 self.demoView2.layer.anchorPoint = CGPointMake(0, 0);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
