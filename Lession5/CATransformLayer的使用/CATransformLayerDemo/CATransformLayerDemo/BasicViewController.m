//
//  BasicViewController.m
//  CATransformLayerDemo
//
//  Created by Alexander on 2018/3/10.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

// 容器view
@property (nonatomic,strong)UIView *containerView;



@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	
	[self.view addSubview:self.containerView];
	
	CATransform3D c1t = CATransform3DIdentity;
	c1t = CATransform3DTranslate(c1t, 0, 0, 0);
	// 绕着x 轴 旋转 45度
	c1t = CATransform3DRotate(c1t, - M_PI_4, 1, 0, 0);
	// 绕着y 轴旋转 45 度
	c1t = CATransform3DRotate(c1t, - M_PI_4, 0, 1, 0);
	
	
	
	CALayer *layer = [self cubeWithTransform:c1t];
	[self.containerView.layer addSublayer:layer];
	
	
	
	CATransform3D trans3D = CATransform3DMakeRotation(M_PI * 4 , 0,1, 0);
	
	CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	anim.duration = 10.0f;
	anim.autoreverses = YES;
	anim.repeatCount = MAXFLOAT;
	
	anim.toValue = [NSNumber numberWithFloat:6 * M_PI];
	
	
	CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
	anim2.duration = 10.0f;
	anim2.autoreverses = YES;
	anim2.repeatCount = MAXFLOAT;
	
	anim2.toValue = [NSNumber numberWithFloat:6 * M_PI];
	
	// [layer addAnimation:anim forKey:@"transform.rotation.x"];
	
	CAAnimationGroup *gp = [CAAnimationGroup animation];
	NSArray *arr = [NSArray arrayWithObjects:anim,anim2, nil];
	gp.animations = arr;
	
	gp.duration = 20.0f;
	gp.repeatCount = MAXFLOAT;
	gp.removedOnCompletion = NO;
	gp.fillMode = kCAFillModeForwards;
	[layer addAnimation:gp forKey:nil];
	
	
	
}

// 创建每一个面图层
- (CALayer *)faceWithTransform:(CATransform3D)transform
{
	CALayer *layer = [CALayer layer];
	layer.frame = CGRectMake(-50, -50, 100, 100);
	
	CGFloat red = arc4random_uniform(256)/255.0;
	CGFloat green = arc4random_uniform(256)/255.0;
	CGFloat blue = arc4random_uniform(256)/255.0;
	
	layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f].CGColor;
	layer.transform = transform;
	return layer;
}


// 生成一个立方体
- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
	CATransformLayer *cube = [CATransformLayer layer];
	
	// add cube face1
	CATransform3D ct =  CATransform3DMakeTranslation(0, 0, 50);
	[cube addSublayer:[self faceWithTransform:ct]];
	
	// add cube face2
	ct =  CATransform3DMakeTranslation(50, 0, 0);
	ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
	[cube addSublayer:[self faceWithTransform:ct]];
	
	// add cube face3
	ct =  CATransform3DMakeTranslation(0, -50, 0);
	ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
	[cube addSublayer:[self faceWithTransform:ct]];
	
	
	// add cube face4
	ct =  CATransform3DMakeTranslation(0, 50, 0);
	ct = CATransform3DRotate(ct, - M_PI_2, 1, 0, 0);
	[cube addSublayer:[self faceWithTransform:ct]];
	
	// add cube face5
	ct =  CATransform3DMakeTranslation(-50, 0, 0);
	ct = CATransform3DRotate(ct, - M_PI_2, 0, 1, 0);
	[cube addSublayer:[self faceWithTransform:ct]];
	
	// add cube face6
	ct =  CATransform3DMakeTranslation(0, 0, -50);
	ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
	[cube addSublayer:[self faceWithTransform:ct]];
	
	//
	CGSize containerSize = self.containerView.bounds.size;
	cube.position = CGPointMake(containerSize.width / 2, containerSize.height / 2);
	cube.transform = transform;
	
	return cube;
	
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
