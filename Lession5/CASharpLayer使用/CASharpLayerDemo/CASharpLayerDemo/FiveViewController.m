//
//  FiveViewController.m
//  CASharpLayerDemo
//
//  Created by AY on 2018/3/8.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "FiveViewController.h"
#import "FiveWaveView.h"
@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.navigationItem.title = @"水波纹动画效果";
	

	
	FiveWaveView *wave = [[FiveWaveView alloc]initWithFrame:CGRectMake(0, 100,self.view.frame.size.width,300)];
	
	wave.waveSpeed = 0.03;
	
	[self.view addSubview:wave];
	
	
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
