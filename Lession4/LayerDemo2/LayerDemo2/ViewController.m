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


@property (nonatomic,strong)UIView *containerView;




@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.view.backgroundColor = [UIColor grayColor];
	
	[self showCube];

}

/** 单独的变换 */
- (void)transformTypeOne
{
	self.demoView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView1.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"1"].CGImage);
	[self.view addSubview:self.demoView1];
	
	// 做一个旋转 3D 变换
	// 旋转变化
	CGAffineTransform rotation_trans = CGAffineTransformMakeRotation(M_PI_4 * 3);
	// 放大缩小的变换
	CGAffineTransform scale_trans = CGAffineTransformMakeScale(1.5, 1.5);
	// 相对移动 比原来的位置向右相对移动100
	CGAffineTransform translation_trans = CGAffineTransformMakeTranslation(100, 0);
	[UIView animateWithDuration:1.0f animations:^{
		
		self.demoView1.layer.affineTransform = rotation_trans;
		// self.demoView1.transform = transform;
	}];
	
}

/** 复合的变换 */
- (void)transfromTypeTwo
{
	// 0 当操纵一个变换的时候，初始生成一个什么都不做的变换很重要--也就是创建一个CGAffineTransform类型的空值 为 CGAffineTransformIdentity
	CGAffineTransform transform = CGAffineTransformIdentity;
	
	// 1 然后在此空值上进行复合变换
	// 放大 1.5 倍
	transform = CGAffineTransformScale(transform, 1.2, 1.2);
	
	// 旋转 270 度
	transform = CGAffineTransformRotate(transform, M_PI_4 * 3);
	
	// 向下移动100
	// transform = CGAffineTransformTranslate(transform, 100, 0);
	
	// 图片向右边发生了平移，但并没有指定距离那么远（100像素），另外它还有点向下发生了平移。原因在于当你按顺序做了变换，上一个变换的结果将会影响之后的变换，所以200像素的向右平移同样也被旋转了30度，缩小了50%，所以它实际上是斜向移动了100像素。
	
	
	// 2 将变换添加到layer层
	self.demoView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView1.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"1"].CGImage);
	[self.view addSubview:self.demoView1];
	
	[UIView animateWithDuration:2.0f animations:^{
		self.demoView1.layer.affineTransform = transform;
	}];
	
	
}


/** 3D 变换第一种 */
- (void)threeDTransformTypeOne
{
	
	// CATransform3DMakeRotation
	
	// x y z 哪个为1 就是围绕哪个轴进行旋转
	CATransform3D trans = CATransform3DMakeRotation(M_PI_4 , 0, 1, 0);
	
	
	self.demoView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView1.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"1"].CGImage);
	[self.view addSubview:self.demoView1];
	
	[UIView animateWithDuration:2.0f animations:^{
		self.demoView1.layer.transform = trans;
	}];
	
}

/** 3D 变换第二种  改变M34的值 */
- (void)threeDTransformTypeTwo
{
		// x y z 哪个为1 就是围绕哪个轴进行旋转
	CATransform3D trans = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
	
	
	self.demoView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView1.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"1"].CGImage);
	
	// 透视效果，要操作的这个对象要有旋转的角度，否则没有效果。正直/负值都有意义
	trans.m34 = - 1.0 / 3000;
	
	[self.view addSubview:self.demoView1];
	
	[UIView animateWithDuration:2.0f animations:^{
		self.demoView1.layer.transform = trans;
	}];
	
}


/** 正方体 对象 

	创建6个button 构成一个正方体

*/
- (void)showCube
{
	NSMutableArray *btnArr = [self createBtnArr];
	
	
	self.containerView = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	
	[self.view addSubview:self.containerView];
	
	
	NSLog(@"%@",btnArr);
	
	// 3d 变换
	CATransform3D perspective = CATransform3DIdentity;
	perspective.m34 = -1 / 500.0f;
		
	// 对container view 做变化 显示出 正方体的效果
	perspective = CATransform3DRotate(perspective, - M_PI_4, 1, 0, 0);
	perspective = CATransform3DRotate(perspective, - M_PI_4, 0, 1, 0);
	
	self.containerView.layer.sublayerTransform = perspective;
	
	
	
	
	
	
	// 1 最上面的btn z轴方向移动100
	CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
	[self addBtn:btnArr[0] withTransform:transform];
	
	// 2 右侧面按钮
	transform = CATransform3DMakeTranslation(100, 0, 0);
	transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
	[self addBtn:btnArr[1] withTransform:transform];
	
	// 3 上侧的按钮
	transform = CATransform3DMakeTranslation(0, -100, 0);
	transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
	[self addBtn:btnArr[2] withTransform:transform];
	
	// 4 下侧的按钮
	transform = CATransform3DMakeTranslation(0, 100, 0);
	transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
	[self addBtn:btnArr[3] withTransform:transform];
	
	// 5 左侧的按钮
	transform = CATransform3DMakeTranslation(-100, 0, 0);
	transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
	[self addBtn:btnArr[4] withTransform:transform];
	
	// 6 底部的按钮
	transform = CATransform3DMakeTranslation(0, 0, -100);
	transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
	[self addBtn:btnArr[5] withTransform:transform];
	
	
	
	
	// 给contain的view 添加一个动画
	

	
	
}

/**
	将每一个btn 添加到container view 上面去
*/
- (void)addBtn:(UIButton *)btn withTransform:(CATransform3D)transform
{

 	[self.containerView addSubview:btn];
	
	btn.center = CGPointMake(self.containerView.bounds.size.width / 2, self.containerView.bounds.size.height / 2);
	
	btn.layer.transform = transform;
	
}


/** 
	创建6个btn
*/
- (NSMutableArray *)createBtnArr
{

	NSMutableArray *resArr = [NSMutableArray arrayWithCapacity:0];
	for (int i = 0; i < 6 ; i ++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		[btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
		btn.frame = CGRectMake(0, 0, 200, 200);
		btn.backgroundColor = [UIColor whiteColor];
		btn.layer.borderWidth = 0.7;
		btn.layer.borderColor = [UIColor blackColor].CGColor;
		[btn setTitleColor:[UIColor colorWithRed:arc4random_uniform(256)/255.0f green:arc4random_uniform(256)/255.0f blue:arc4random_uniform(256)/255.0f alpha:1] forState:UIControlStateNormal];
		btn.titleLabel.font = [UIFont systemFontOfSize:25.0f];
		[resArr addObject:btn];
	}
	
	return resArr;
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
