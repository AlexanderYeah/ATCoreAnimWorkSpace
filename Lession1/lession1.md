# 图层的树状结构  
Core Animation 是一个复合的引擎,就是尽快地将屏幕上不同的可视内容组合在一起，这些内容是被分解的独立图层，这些内容是存在于一个叫做图层树的体系当中。
这个图层树就形成了UIKit 以及在iOS 应用程序中我们所看到的一切的基础。

# 图层和视图 
* 在iOS 中 所有的视图都是叫做一个UIView 的基类派生而来的。可以进行用户交互。
* CALayer 在概念上和UIView 类似，也是一些层级关系书管理的矩形块，重要的是不做用户的交互。

* iOS 和 CALayer 是一个平行的层级关系，做到职责分离，避免了很多的重复代码。


# 图层的能力  
SDK已经通过UIView的高级API间接地使得动画变得简单的多。但是局限性也存在。
  
* 阴影 圆角 带颜色的边框  
* 3D 变化  
* 非矩形范围  
* 透明遮罩  
* 多级非线性动画  


# 图层的使用  
每次创建一个view 自动创建一个相关联的layer，同时也可以支持添加多个子图层到view 上面去。


# 寄宿图
* 寄宿图 就是图层中所包含的图。
* CALayer 有一个属性 contents ，类型为id的，意味着可以是任何类型的对象。只要赋值类型为CGImage的时候 才不会得到一个空白的图层。
赋值的时候要进行桥接  
  
> samView1.layer.contents = (__bridge id)showImg.CGImage;  

* contentsGravity 是决定了图层在边界中如何对齐的. kCAGravityResizeAspect 等比例拉伸以适应图层的边界  

> samView1.layer.contentsGravity = kCAGravityResizeAspect;

* contentsScale 属性决定了寄宿图和视图大小的比例，默认情况下是1.0f的浮点数。如果设置了contentGravity在对其进行设置,则不会有明显的变化  

* contentsRect 属性允许我们在图层边框里面显示寄宿图的一个子区域。contentRect 使用的是单位的坐标，单位在0 到 1 之间。默认的是 {0,0,1,1} 





