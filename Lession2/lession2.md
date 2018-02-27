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


