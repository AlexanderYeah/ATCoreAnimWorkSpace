//
//  LyricViewController.m
//  CATextLayerDemo
//
//  Created by AY on 2018/3/9.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "LyricViewController.h"

@interface LyricViewController ()

@end

@implementation LyricViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	self.navigationItem.title = @"歌词效果的实现";
	
	UIBezierPath *path1 = [UIBezierPath bezierPath];
	[path1 moveToPoint:CGPointMake(0, 200)];
	[path1 addLineToPoint:CGPointMake(480, 200)];
	
	
	// 底部红色背景
	CAShapeLayer *layer1 = [CAShapeLayer layer];
	layer1.path = path1.CGPath;
	layer1.strokeColor = [UIColor redColor].CGColor;
	layer1.lineWidth = 80;
	[self.view.layer addSublayer:layer1];
	
	
	// 顶部绿色背景
	CAShapeLayer *layer2 = [CAShapeLayer layer];
	layer2.path = path1.CGPath;
	layer2.lineWidth = 80;
	layer2.strokeColor = [UIColor greenColor].CGColor;
	[layer1 addSublayer:layer2];
	
	
	
	
	// 做一个动画
	CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	
	anim1.fromValue = [NSNumber numberWithFloat:0.0f];
	anim1.toValue = [NSNumber numberWithFloat:1.0f];
	anim1.removedOnCompletion = NO;
	anim1.duration = 4.0f;
	anim1.fillMode = kCAFillModeForwards;
	anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	anim1.repeatCount = MAXFLOAT;
	[layer2 addAnimation:anim1 forKey:@"strokeEndAnimation"];
	
	
	
	// 文字
	CATextLayer *layer3 = [CATextLayer layer];
	UIFont *font =[UIFont systemFontOfSize:25.0f];
	layer3.frame = CGRectMake(0, 200, 480, 80);
	
	CFStringRef fontName = (__bridge CFStringRef)font.fontName;
	CGFontRef fontRef = CGFontCreateWithFontName(fontName);
	layer3.font = fontRef;
	layer3.fontSize = font.pointSize;
	CGFontRelease(fontRef);
	
	layer3.foregroundColor = [UIColor blackColor].CGColor;
	// layer3.backgroundColor = [UIColor clearColor].CGColor;
	
	
	layer3.wrapped = YES;
	layer3.truncationMode = @"end";
	layer3.string = @"you are so handsome,you are so";
	
	// 以什么样的分辨率进行渲染 否则的话会造成像素失真
	layer3.contentsScale = [UIScreen mainScreen].scale;
	
	
	
	[layer2 addSublayer:layer3];
	
	
	// 关键的实现方式就是CALayer 的mask 属性
	
	layer1.mask = layer3;
	

	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
	
}







@end
