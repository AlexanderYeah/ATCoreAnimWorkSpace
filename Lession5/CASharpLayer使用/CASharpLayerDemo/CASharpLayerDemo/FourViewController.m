//
//  FourViewController.m
//  CASharpLayerDemo
//
//  Created by AY on 2018/3/7.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()


@property (nonatomic,strong)UIView *fourView;

@property (nonatomic,strong)CAShapeLayer *layer2;


@end

@implementation FourViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationItem.title = @"录音的动画效果";
	
	[self show];
}

- (void)show{
	

	// 路径2
	UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 150)];
	// CASharpLayer
	CAShapeLayer *layer2 = [[CAShapeLayer alloc]init];
	_layer2 = layer2;
	layer2.fillColor = [UIColor cyanColor].CGColor;
	layer2.lineWidth = 2.0f;
	layer2.strokeColor = [UIColor cyanColor].CGColor;
	layer2.path = path2.CGPath;

	
	
	UIView *fourView = [[UIView alloc]init];
	fourView.backgroundColor = [UIColor clearColor];
	fourView.frame = CGRectMake(150, 200, 100, 230);
	fourView.layer.cornerRadius = 50;
	fourView.layer.masksToBounds = YES;
	_fourView = fourView;
	fourView.layer.borderWidth = 1;
	fourView.layer.borderColor = [UIColor redColor].CGColor;
	[fourView.layer addSublayer:layer2];
	
	[self.view addSubview:fourView];

}


/** 
	模拟动态的变化
*/
- (void)changeValueWithHeight:(CGFloat)height
{
	_layer2 = nil;
	[_layer2 removeFromSuperlayer];
	UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, height)];
	_layer2 = [[CAShapeLayer alloc]init];
	_layer2.fillColor = [UIColor cyanColor].CGColor;
	_layer2.lineWidth = 2.0f;
	_layer2.strokeColor = [UIColor cyanColor].CGColor;
	_layer2.path = path2.CGPath;
	
	[_fourView.layer addSublayer:_layer2];
	
	[self.fourView setNeedsDisplay];

	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	
	NSLog(@"22");
	
	NSArray *array = @[@25,@80,@95,@150,@180,@50,@80];
	
	for (int i = 0; i < array.count ; i ++) {
		
		 [self changeValueWithHeight:[array[i] floatValue]];
	}
	
	
	
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
