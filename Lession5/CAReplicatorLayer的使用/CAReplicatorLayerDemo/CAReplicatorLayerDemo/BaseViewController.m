//
//  BaseViewController.m
//  CAReplicatorLayerDemo
//
//  Created by AY on 2018/3/15.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "BaseViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height



@interface BaseViewController ()


@property (nonatomic,strong)UIView *containerView;


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.navigationItem.title = @"基本使用";
	
	self.containerView = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
	self.containerView.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.3];
	[self.view addSubview:self.containerView];
	
	[self baseUse];
}


/**
 第一次使用
 */
- (void)baseUse{

	CATransform3D transform = CATransform3DIdentity;
	transform = CATransform3DTranslate(transform, 0, 80, 0);
	transform = CATransform3DRotate(transform, M_PI / 5.0f, 0, 0, 1);
	transform = CATransform3DTranslate(transform, 0, -80, 0);
	
	CAReplicatorLayer *layer = [CAReplicatorLayer layer];
	layer.frame = self.containerView.bounds;
	[self.containerView.layer addSublayer:layer];
	
	// 总共几个复制的layer
	layer.instanceCount = 10;
	// 每个layer之间的offset
	layer.instanceBlueOffset = -0.1;
	layer.instanceGreenOffset = -0.1;
	
	layer.instanceTransform = transform;
	
	// 添加一个layer
	CALayer *baseLayer = [CALayer layer];
	baseLayer.frame = CGRectMake(100, 100, 40, 40);
	baseLayer.backgroundColor = [UIColor whiteColor].CGColor;
	[layer addSublayer:baseLayer];
	
	
	
	
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
