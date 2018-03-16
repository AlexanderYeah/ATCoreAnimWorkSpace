# CAGradientLayer 

## 第一种情况就是两种颜色的渐变
```/**
 	基础渐变 两种颜色渐变
 */
- (void)baseChange
{

	// 创建layer
	CAGradientLayer *layer = [CAGradientLayer layer];
	
	layer.frame = CGRectMake(0, 0, 200, 200);
	
	[self.containerView.layer addSublayer:layer];
	
	// 渐变颜色数组的两级
	layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
	// 设置渐变的起始位置 左上角开始
	layer.startPoint = CGPointMake(0, 0);
	// 设置渐变的结束位置 右下角结束
	layer.endPoint = CGPointMake(1, 1);
	
}

```  

## 第二种 多种颜色的渐变
locations 数组定义了渐变颜色不同的位置
```- (void)multiChange
{
	// CALayer
	
	
		// 创建layer
	CAGradientLayer *layer = [CAGradientLayer layer];
	
	layer.frame = CGRectMake(0, 0, 200, 200);
	
	[self.containerView1.layer addSublayer:layer];
	
	// 渐变颜色数组的两级
	layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
	// locations
	
	layer.locations = @[@0.0,@0.25,@0.5,@0.75];
	
	// 设置渐变的起始位置 左上角开始
	layer.startPoint = CGPointMake(0, 0);
	// 设置渐变的结束位置 右下角结束
	layer.endPoint = CGPointMake(1, 1);
	

}
```

![](https://github.com/AlexanderYeah/ATCoreAnimWorkSpace/blob/master/Lession5/CAGradientLayer%E7%9A%84%E4%BD%BF%E7%94%A8/gradient.jpg)
