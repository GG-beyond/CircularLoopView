//
//  CircularLoopView.m
//  CircularLoopView
//
//  Created by anxindeli on 2018/5/16.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "CircularLoopView.h"
#import "ChartRenderModel.h"
#import "CircularShapeLayer.h"
#import "UIColor+Hex.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]


const CGFloat outWidth = 225.0f;//外圈直径
const CGFloat inWidth = 155.0f;//内圈直径
const CGFloat expandWidth = 10.0f;//外圈往外扩张距离

@interface CircularLoopView ()
@property (nonatomic, strong) NSArray *colorsArr;//所有颜色
@end;

@implementation CircularLoopView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self drawCircularLoopView];
    }
    return self;
}
- (void)drawCircularLoopView{
    
    
    CGFloat startAngle = -0.5*M_PI;//起始点
    CGFloat endAngle;//终点
    CGFloat radiusOut = outWidth/2.0;//外环半径
    CGFloat radiusIn = inWidth/2.0;//内环半径
//
    CGPoint point = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);

    for (int i=0; i<self.colorsArr.count; i++) {//我这里有10中颜色，然后圆等分10份
        
        CGFloat pre = 10/100.0;
        endAngle = startAngle + pre*2*M_PI;
        
        //外环
        UIBezierPath *bezierPathOut = [self creatBezierPathPoint:point radius:radiusOut startAngle:startAngle endAngle:endAngle];
        
        ChartRenderModel *model = [[ChartRenderModel alloc] init];
        model.startAngle = startAngle;
        model.endAngle = endAngle;
        model.fillColor = [UIColor colorWithHexString:self.colorsArr[i]];
        model.strokeColor = [UIColor colorWithHexString:self.colorsArr[i]];
        model.outerRadius = radiusOut;
        model.innerRadius = radiusIn;
        CircularShapeLayer *shapeLayer = [[CircularShapeLayer alloc] initWithModel:model];
        shapeLayer.path = bezierPathOut.CGPath;
        //内环
        
        UIBezierPath *bezierPathIn = [self creatBezierPathPoint:point radius:radiusIn startAngle:startAngle endAngle:endAngle];

        CAShapeLayer *shapeLayerIn=[CAShapeLayer layer];
        shapeLayerIn.lineWidth = 1;
        shapeLayerIn.strokeColor = [UIColor whiteColor].CGColor;
        shapeLayerIn.fillColor = [UIColor whiteColor].CGColor;
        shapeLayerIn.path = bezierPathIn.CGPath;
        [shapeLayer addSublayer:shapeLayerIn];

        [self.layer addSublayer:shapeLayer];
        startAngle = endAngle;

    }
    
}
- (UIBezierPath *)creatBezierPathPoint:(CGPoint)point radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle{
    
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:point
                                                                 radius:radius
                                                            startAngle:startAngle                                                                                   endAngle:endAngle
                                                              clockwise:YES];
    [bezierPath addLineToPoint:point];
    [bezierPath closePath];
    return bezierPath;

}
#pragma mark - 刷新
- (void)reloadCircularLoopView{
    
}
#pragma mark - GETTER
#pragma mark - 颜色色值数组
- (NSArray *)colorsArr{
    
    if (!_colorsArr) {
        
        //10种颜色值
        _colorsArr = @[@"#9f42dc",@"#786ef0",@"#3cc8f0",@"#9eeaff",@"#3adeb6",@"#a7f7be",@"#f766ed",@"#ffae57",@"#ff6057",@"#b22913"];
    }
    return _colorsArr;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = touches.anyObject;//获取触摸对象
    CGPoint touchPoint = [touch locationInView:self];
    
    CGPoint p = [self.layer convertPoint:touchPoint toLayer:self.layer.presentationLayer];
    
    
    //遍历当前视图上的子视图的presentationLayer 与点击的点是否有交集
    
//    CircularShapeLayer *preLay = [self preLayerMidRadian];
    for (int i=0;i<self.layer.sublayers.count;i++) {
        
        CircularShapeLayer *lay = (CircularShapeLayer *)self.layer.sublayers[i];
        
        if (CGPathContainsPoint(lay.presentationLayer.path, 0, p, 0)) {
            NSLog(@"点击了  index=%d",i);
            //

            //凸出动画
            CGFloat direction = expandWidth;
            ChartRenderModel *model = lay.cModel;
            if (model.isSelect) {
                return;
            }
            model.isSelect = YES;
            CGFloat startAngle = model.startAngle;
            CGFloat endAngle = model.endAngle;
            CGFloat angle = startAngle + (endAngle - startAngle) / 2;
            lay.transform = CATransform3DMakeTranslation(direction * cosf(angle), direction * sinf(angle), 0);
            
            [UIView animateWithDuration:0.25 animations:^{
                self.layer.transform = CATransform3DMakeRotation(-0.5*M_PI - angle, 0, 0, 1);
            }];

        }else{
            
            ChartRenderModel *model = lay.cModel;
            model.isSelect = NO;
            lay.transform = CATransform3DMakeTranslation(0, 0, 0);
        }
    }
}

@end
