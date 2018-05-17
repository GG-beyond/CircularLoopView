//
//  ChartRenderModel.m
//  CircularLoopView
//
//  Created by anxindeli on 2018/5/16.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "ChartRenderModel.h"


@implementation ChartRenderModel
@synthesize startAngle = _startAngle;
@synthesize endAngle = _endAngle;
@synthesize fillColor = _fillColor;
@synthesize strokeColor = _strokeColor;
@synthesize innerRadius = _innerRadius;
@synthesize outerRadius = _outerRadius;
@synthesize isSelect = _isSelect;
- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self commonInit];
    }
    return self;
}
- (void)commonInit {
    
    self.startAngle = 0;
    self.endAngle = 0;
    self.fillColor = [UIColor redColor];
    self.strokeColor = [UIColor yellowColor];
    self.innerRadius = 0;
    self.outerRadius = 0;
    self.isSelect = NO;
}


@end
