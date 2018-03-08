# CASharpLayer
## CAShapeLayer是一个通过矢量图形而不是bitmap来绘制的图层子类
优势  

1. 渲染快速CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
2. 高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。  
3. 不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉  
4. 不会出现像素化  


简而言之： CAShapeLayer可以用来绘制所有能够通过CGPath来表示的形状。这个形状不一定要闭合，图层路径也不一定要不可破.