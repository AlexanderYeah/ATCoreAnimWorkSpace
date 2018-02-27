//
//  ViewController.m
//  CALayerLession1
//
//  Created by AY on 2018/2/26.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.view.backgroundColor = [UIColor grayColor];
	
	UIView *samView1 = [[UIView alloc]initWithFrame:CGRectMake(50, 200, 250, 250)];
	samView1.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:samView1];
	
	// 给上面的view 添加一个蓝色的图层
//	CALayer *blueLayer = [CALayer layer];
//	blueLayer.frame = CGRectMake(25, 25, 100, 100);
//	blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//	[samView1.layer addSublayer:blueLayer];
	
	
	
	// 给layer 添加一个图片
	UIImage *showImg = [UIImage imageNamed:@"12.jpg"];
	samView1.layer.contents = (__bridge id)showImg.CGImage;
	 samView1.layer.contentsGravity = kCAGravityResizeAspect;
	// samView1.layer.contentsScale = 0.2f;
	// contentsRect
	// samView1.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
	
	// contentsCenter
	samView1.layer.contentsCenter = CGRectMake(0.5, 0.5, 0.5, 0.5);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
