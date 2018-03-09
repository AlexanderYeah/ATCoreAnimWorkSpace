# CATextLayer
### 闲话 UILabel 的精髓就是使用Core Graphics 将字符串写入图层中去 
### Core Animation提供了一个CALayer的子类CATextLayer，它以图层的形式包含了UILabel几乎所有的绘制特性，并且额外提供了一些新的特性。
### 而CATextLayer使用了Core text，并且渲染得非常快。


## 普通文本的显示 
```
	// 绘制
	UIFont *font =[UIFont systemFontOfSize:15.0f];
	
	CFStringRef fontName = (__bridge CFStringRef)font.fontName;
	CGFontRef fontRef = CGFontCreateWithFontName(fontName);
	layer.font = fontRef;
	layer.fontSize = font.pointSize;
	CGFontRelease(fontRef);
	
	layer.foregroundColor = [UIColor redColor].CGColor;
	layer.backgroundColor = [UIColor cyanColor].CGColor;
	
	layer.string = @"you gonna kidding me !!!";
	
	// 以什么样的分辨率进行渲染 否则的话会造成像素失真
	layer.contentsScale = [UIScreen mainScreen].scale; 
	 
```


## 富文本的显示   


## 示例歌词的显示
 原理解读:
 
 * layer1 背景颜色是红色的 ，layer2 背景颜色是绿色的，layer2 添加layer1上面，给layer2 添加一个动画 strokeEnd 属性。 
 
 * 利用CALayer的 mask 属性，创建一个CATextLayer 添加到layer2 上面，然后使得layer1.mask = layer3 就可以实现。  
 
 
 

