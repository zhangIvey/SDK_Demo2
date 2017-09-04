//
//  ViewController.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "ViewController.h"
#import "WB_DevOpe.h"

@interface ViewController ()

//subViews
@property(nonatomic, strong) UIButton *scanButton;

//logics


@end

@implementation ViewController

#pragma mark - controller's lifeCircle
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buildUpView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - logic operation
/**
 * 逻辑：装备视图布局
 */
- (void)buildUpView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Demo";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _scanButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
    _scanButton.backgroundColor = [UIColor grayColor];
    [_scanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_scanButton setTitle:@"扫描" forState:UIControlStateNormal];
    
    [_scanButton addTarget:self action:@selector(scanButton_click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_scanButton];
}

#pragma mark - interact operation
/**
 * 交互：点击扫描按钮
 */
- (void)scanButton_click
{
    
    WB_DevOpe *deviceOpe = [WB_DevOpe shareOperation];
    
    
}

@end
