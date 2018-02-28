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

@property (nonatomic,strong)UIView *demoView3;

@property (nonatomic,strong)UIView *demoView4;

@property (nonatomic,strong)UIView *demoView5;

@property (nonatomic,strong)CALayer *demoLayer1;



@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self hitTesting];

}

/** 锚点 */
- (void)showAnchorPoint
{
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

/** Z 轴 zAnchorPoint */
- (void)showZAnchorPoint
{
	self.demoView3 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView3.backgroundColor = [UIColor redColor];
	[self.view addSubview:self.demoView3];
	
	
	
	self.demoView4 = [[UIView alloc]initWithFrame:CGRectMake(200, 300, 200, 200)];
	self.demoView4.backgroundColor = [UIColor greenColor];
	[self.view addSubview:self.demoView4];
	
	
	// 以上的布局 绿色的视图会显示在红色的上面
	// 通过改变的layer的zPosition 来进行改变显示的位置
	 self.demoView3.layer.zPosition = 1.0f;
}


/** Hit Testing 测试 */
- (void)hitTesting
{
	
	self.demoView5 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView5.backgroundColor = [UIColor redColor];
	[self.view addSubview:self.demoView5];
	
	
	self.demoLayer1 = [CALayer layer];
	self.demoLayer1.frame = CGRectMake(50, 50, 100, 100);
	[self.demoView5.layer addSublayer:self.demoLayer1];
	self.demoLayer1.backgroundColor = [UIColor blueColor].CGColor;

	
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	CGPoint point = [[touches anyObject] locationInView:self.view];
	
	// 将点击的点转demoView5 的 layer 中的点
	point = [self.demoView5.layer convertPoint:point fromLayer:self.view.layer];
	
	// 如果点击的点在demoView5的 layer 中的话
	if ([self.demoView5.layer containsPoint:point]) {
		
		point = [self.demoLayer1 convertPoint:point fromLayer:self.demoView5.layer ];
		
		if ([self.demoLayer1 containsPoint:point]) {
			[self showInfo:@"蓝色view内"];
		}else{
			[self showInfo:@"蓝色view外"];
		}
		
	}
	
	
	
	

}


- (void)showInfo:(NSString *)info
{
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"Show" message:info preferredStyle:UIAlertControllerStyleAlert];
	
	
	UIAlertAction *ac = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self dismissViewControllerAnimated:YES completion:nil];
	}];
	
	[vc addAction:ac];
	
	[self presentViewController:vc animated:YES completion:nil];

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
