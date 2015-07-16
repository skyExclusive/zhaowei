//
//  SureViewController.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/16.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "SureViewController.h"
#import "PrefixHeader.pch"
@interface SureViewController ()

@end

@implementation SureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.view.backgroundColor = [ UIColor whiteColor];
    UIButton *surebutton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    surebutton.frame = CGRectMake(20, kMainHeight/1.8, kMainWidth - 40, 50);
    [surebutton setTitle:@"确定" forState:(UIControlStateNormal)];
    [surebutton setTintColor:[UIColor whiteColor]];
    surebutton.backgroundColor = COLOR(53, 224, 229, 1);
    [surebutton addTarget:self action:@selector(sure) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:surebutton];
    
    
    //返回的箭头
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    
}

-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)sure
{
    NSLog(@"应该是模态出登陆页面");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
