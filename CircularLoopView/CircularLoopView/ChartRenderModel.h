//
//  ChartRenderModel.h
//  CircularLoopView
//
//  Created by anxindeli on 2018/5/16.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChartRenderModel : NSObject

@property (assign, nonatomic) CGFloat startAngle;//起始弧度
@property (assign, nonatomic) CGFloat endAngle;//结束弧度
@property (strong, nonatomic) UIColor *fillColor;//填充色
@property (strong, nonatomic) UIColor *strokeColor;//边线条色
@property (assign, nonatomic) CGFloat innerRadius;//内圈
@property (assign, nonatomic) CGFloat outerRadius;//外圈
@property (assign, nonatomic) BOOL isSelect;//是否凸起（选中）

@end
