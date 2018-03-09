//
//  ViewController.m
//  CATextLayerDemo
//
//  Created by AY on 2018/3/9.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIView *demoView;



@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	self.demoView = [[UIView alloc]initWithFrame:CGRectMake(80, 200, 200, 200)];
	// [self.view addSubview:self.demoView];

	
	
	
	UIBezierPath *path1 = [UIBezierPath bezierPath];
	[path1 moveToPoint:CGPointMake(80, 200)];
	[path1 addLineToPoint:CGPointMake(380, 200)];
	
	
	// 底部红色背景
	CAShapeLayer *layer1 = [CAShapeLayer layer];
	layer1.path = path1.CGPath;
	layer1.strokeColor = [UIColor redColor].CGColor;
	layer1.lineWidth = 40;
	[self.view.layer addSublayer:layer1];
	
	
	// 顶部绿色背景
	CAShapeLayer *layer2 = [CAShapeLayer layer];
	layer2.path = path1.CGPath;
	layer2.lineWidth = 40;
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
	UIFont *font =[UIFont systemFontOfSize:15.0f];
	layer3.frame = CGRectMake(80, 200, 200, 40);
	
	CFStringRef fontName = (__bridge CFStringRef)font.fontName;
	CGFontRef fontRef = CGFontCreateWithFontName(fontName);
	layer3.font = fontRef;
	layer3.fontSize = font.pointSize;
	CGFontRelease(fontRef);
	
	layer3.foregroundColor = [UIColor blackColor].CGColor;
	// layer3.backgroundColor = [UIColor clearColor].CGColor;
	
	layer3.wrapped = YES;
	layer3.truncationMode = @"end";
	layer3.string = @"you are so handsome, i love u so much";
	
	// 以什么样的分辨率进行渲染 否则的话会造成像素失真
	layer3.contentsScale = [UIScreen mainScreen].scale;
	[layer2 addSublayer:layer3];
	layer1.mask = layer3;
	
	
	
	
}
/** 基本的使用 */
- (void)basicUse
{
	
		
	CATextLayer *layer = [CATextLayer layer];
	
	layer.frame = self.demoView.frame;
	
	[self.demoView.layer addSublayer:layer];
	
	
	// 绘制
	UIFont *font =[UIFont systemFontOfSize:15.0f];
	
	CFStringRef fontName = (__bridge CFStringRef)font.fontName;
	CGFontRef fontRef = CGFontCreateWithFontName(fontName);
	layer.font = fontRef;
	layer.fontSize = font.pointSize;
	CGFontRelease(fontRef);
	
	layer.foregroundColor = [UIColor redColor].CGColor;
	layer.backgroundColor = [UIColor cyanColor].CGColor;
	
	layer.string = @"you gonna kidding me !!!";
	
	// 以什么样的分辨率进行渲染 否则的话会造成像素失真
	layer.contentsScale = [UIScreen mainScreen].scale;
	

}



- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
