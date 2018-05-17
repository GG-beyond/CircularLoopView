//
//  ViewController.m
//  CircularLoopView
//
//  Created by anxindeli on 2018/5/16.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "ViewController.h"
#import "CircularLoopView.h"

@interface ViewController ()
@property (nonatomic, strong) CircularLoopView *circularLoopView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.circularLoopView];
}

- (CircularLoopView *)circularLoopView{
    
    if (!_circularLoopView) {
        
        _circularLoopView = [[CircularLoopView alloc] initWithFrame:CGRectMake(50, 100, 225, 225)];
    }
    return _circularLoopView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
