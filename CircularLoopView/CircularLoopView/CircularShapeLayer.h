//
//  CircularShapeLayer.h
//  CircularLoopView
//
//  Created by anxindeli on 2018/5/16.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ChartRenderModel.h"

@interface CircularShapeLayer : CAShapeLayer
@property (nonatomic, strong) ChartRenderModel *cModel;

- (instancetype)initWithModel:(ChartRenderModel *)model;
@end
