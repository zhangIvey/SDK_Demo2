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
@property(nonatomic, strong) UILabel *stringShowLabel;
@property(nonatomic, strong) UIButton *getDeviceTypeButton;
@property(nonatomic, strong) UIButton *setAMPMButton;
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
    //扫描按钮
    _scanButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
    _scanButton.backgroundColor = [UIColor grayColor];
    [_scanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_scanButton setTitle:@"扫描" forState:UIControlStateNormal];
    
    [_scanButton addTarget:self action:@selector(scanButton_click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_scanButton];
    
    
    //获取到的信息进行展示的标签
    _stringShowLabel = [[UILabel alloc] initWithFrame:CGRectMake(_scanButton.frame.origin.x + _scanButton.frame.size.width + 10, _scanButton.frame.origin.y, 160, 40)];
    _stringShowLabel.backgroundColor = [UIColor purpleColor];
    _stringShowLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_stringShowLabel];
    
    
    //获取设备型号按钮
    _getDeviceTypeButton = [[UIButton alloc] initWithFrame:CGRectMake(_scanButton.frame.origin.x, _scanButton.frame.origin.y + _scanButton.frame.size.height + 20, 140, 40)];
    _getDeviceTypeButton.backgroundColor = [UIColor grayColor];
    [_getDeviceTypeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_getDeviceTypeButton setTitle:@"获取设备型号" forState:UIControlStateNormal];
    
    [_getDeviceTypeButton addTarget:self action:@selector(getDeviceTypeButton_click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getDeviceTypeButton];

    //设置设备的朝三暮四按钮
    _setAMPMButton = [[UIButton alloc] initWithFrame:CGRectMake(_getDeviceTypeButton.frame.origin.x, _getDeviceTypeButton.frame.origin.y + _getDeviceTypeButton.frame.size.height + 20, 140, 40)];
    _setAMPMButton.backgroundColor = [UIColor grayColor];
    [_setAMPMButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_setAMPMButton setTitle:@"设置朝朝暮暮" forState:UIControlStateNormal];
    [_setAMPMButton addTarget:self action:@selector(setAMPMButton_click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_setAMPMButton];
}

#pragma mark - interact operation
/**
 * 交互：点击扫描按钮
 */
- (void)scanButton_click
{
    
    WB_DevOpe *deviceOpe = [WB_DevOpe shareOperation];
    [deviceOpe scanAndConnect];
    
}

- (void)getDeviceTypeButton_click
{
    [[WB_DevOpe shareOperation] getDeviceType:^(NSString *string){
        _stringShowLabel.text = string; //更新界面
    }];
    
}

- (void)setAMPMButton_click
{
    WB_AMPM_Model *amModel = [[WB_AMPM_Model alloc] initWithType:TIME_SETTING_MORNNING withStartTime:@"5" withEndTime:@"9"];
    
    WB_AMPM_Model *pmModel = [[WB_AMPM_Model alloc] initWithType:TIME_SETTING_EVENNING withStartTime:@"20" withEndTime:@"23"];
    
    WB_AMPM_Setting_Action *action = [[WB_AMPM_Setting_Action alloc] initWithAM:amModel withPM:pmModel];
    [[WB_DevOpe shareOperation] setAMPMTime:action withResult:^(BOOL isSuccess){
        if (isSuccess) {
            NSLog(@"设置成功");
        }else{
            NSLog(@"设置失败");
        }
    }];
}



@end
