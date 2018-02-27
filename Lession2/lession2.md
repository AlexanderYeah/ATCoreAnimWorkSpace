# 图层几何学  
### UIView有三个比较重要的布局属性：frame，bounds和center   
### CALayer对应地叫做frame，bounds和position  

1.  frame 是代表了图层的外部坐标，是相当于父视图的。
2.  bounds 是代表了图层的内部坐标, 是相当于本身而言的  
3.  center 和 position 都代表了相对于父视图 锚点所在的位置。

### 锚点 
anchorPoint 位于图层的中心点 所以图层将会以这个点为中心位置。
图层显示到什么位置，是由position 决定。将图层上的具体哪个点移动到position 指定的位置，由锚点决定。
----> [简书解释](https://www.jianshu.com/p/94ba4de209ed)  

```  
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
   
   ```  
   
  添加一个图层到另外一个图层上，绿色图层显示到什么位置，由position属性决定;假设绿色图层的position是（50，50）,
  到底把红色图层的哪个点移动到（100，100）的坐标位置，这个点就是锚点。 抹点默认值是（0.5，0.5）  
  
* 未修改锚点  未设置position  

![11](https://github.com/AlexanderYeah/ATCoreAnimWorkSpace/blob/master/Lession2/anchor1.png)

* 修改锚点 设置position 之后  

![22](https://github.com/AlexanderYeah/ATCoreAnimWorkSpace/blob/master/Lession2/anchor2.png)