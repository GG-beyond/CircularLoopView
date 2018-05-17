//
//  CircularShapeLayer.m
//  CircularLoopView
//
//  Created by anxindeli on 2018/5/16.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "CircularShapeLayer.h"
@interface CircularShapeLayer ()
@end
@implementation CircularShapeLayer
- (instancetype)initWithModel:(ChartRenderModel *)model{
    
    self = [CircularShapeLayer layer];
    if (self) {
        self.cModel = model;
    }
    return self;
}
- (void)setCModel:(ChartRenderModel *)cModel{
    
    _cModel = cModel;
    self.lineWidth = 0.5;
    self.strokeColor = [UIColor clearColor].CGColor;
    self.fillColor = [cModel.fillColor CGColor];
}
@end
