
# 一 仿映射变换

### Core Graphics实际上是一个严格意义上的2D绘图API，并且CGAffineTransform仅仅对2D变换有效。CG开头的都是Core Graphics 框架内部的

UIView 是使用transform 属性进行变换
CALayer 是affineTransform 属性进行变化   
两者都是一个为CGAffineTransform 属性类型的


## 对与一个layer 做单个的变化 使用如下方法  
1. CGAffineTransformMakeRotation(CGFloat angle)  
2. CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
3. CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)  

## 对一个layer 做复合的变话 使用如下的方法  
### 1 创建一个CGAffineTransform类型的空值    
### 2 进行变化  
### 3 应用的Layer 层面去
`

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


`
  

# 3D变换  
transform属性CATransform3D类型让图层在3D空间内移动或者旋转。 是Core Animation 框架内部的 
## 3D 变化使用的方法 分别可以围绕 x y z 轴进行旋转
* CATransform3DMakeRotation(CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
* CATransform3DMakeScale(CGFloat sx, CGFloat sy, CGFloat sz) 
* CATransform3DMakeTranslation(Gloat tx, CGFloat ty, CGFloat tz)


```  
	// x y z 哪个为1 就是围绕哪个轴进行旋转
	CATransform3D trans = CATransform3DMakeRotation(M_PI_4 , 0, 1, 0);
	
	
	self.demoView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
	self.demoView1.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"1"].CGImage);
	[self.view addSubview:self.demoView1];
	
	[UIView animateWithDuration:2.0f animations:^{
		self.demoView1.layer.transform = trans;
	}];  
```



# 固体对象  

## 用6个单独的view 拼接成一个立方体 ,一个容器view，装入6个单独的view ，6个单独的view 依次做3D 变化形成一个正6方体
`
	
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
	


`
![11](https://github.com/AlexanderYeah/ATCoreAnimWorkSpace/blob/master/Lession4/cube.png)
  
 
