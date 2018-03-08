//
//  FiveWaveView.h
//  CASharpLayerDemo
//
//  Created by AY on 2018/3/8.
//  Copyright © 2018年 AY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiveWaveView : UIView

/** 建议波纹速度小于 0.1 之间  */
@property (nonatomic,assign)CGFloat waveSpeed;

/** 波纹的背景色 */
@property (nonatomic,strong)UIColor *waveBgColor;


@end
