//
//  NowDetalViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/2.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "NowDetalViewController.h"
#import "PrefixHeader.pch"
#import "HEInfiniteScrollView.h"
#import "MyListFirstTableViewCell.h"
#import "GoodDetalTableViewController.h"
#import "SpeckTableViewController.h"
#import "PrefixHeader.pch"
#define kseGmentHeight 40
#define kscrollViewH 234

@interface NowDetalViewController ()<UITableViewDataSource,UITableViewDelegate,MylistFirstbleDelegate,UIScrollViewDelegate>

@property (nonatomic ,strong)UITableView *mytable;
@property (nonatomic ,strong)GoodDetalTableViewController *nowVC;
@property (nonatomic ,strong)SpeckTableViewController *willVC;


@end

@implementation NowDetalViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"商品详情";
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    [self scrollerView];
    self.view.backgroundColor = COLOR(253, 246, 240, 1);


}
-(void)scrollerView
{
    
    //布局 UIScrollView
    self.myscrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kscrollViewH, kMainWidth, kMainHeight - kscrollViewH - 44)];
    self.myscrollView.contentSize = CGSizeMake(kMainWidth * 2, 0);
//    self.myscrollView.backgroundColor = [UIColor whiteColor];
    self.myscrollView.showsVerticalScrollIndicator = NO;
    self.myscrollView.showsVerticalScrollIndicator = NO;
    self.myscrollView.pagingEnabled = YES;
    self.myscrollView.delegate = self;
    [self.view addSubview:self.myscrollView];
    self.myscrollView.backgroundColor =[UIColor redColor];

    
    self.nowVC = [[GoodDetalTableViewController alloc]init];
    
    self.willVC = [[SpeckTableViewController alloc]init];
    self.nowVC.view.frame = CGRectMake(0, 0, kMainWidth, 500);
    self.willVC.view.frame = CGRectMake(kMainWidth, 0, kMainWidth, 500);
    
    [self addChildViewController:self.nowVC];
    [self.myscrollView addSubview:self.nowVC.view];
    [self addChildViewController:self.willVC];
    [self.myscrollView addSubview:self.willVC.view];
    
    MyListFirstTableViewCell *cell = [[MyListFirstTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"aa"];
//    [self.view addSubview:cell];
    cell.frame = CGRectMake(0, 64, 320, 170);

    cell.delegagate = self;
    
    cell.mytimeInteger = 1000;
    

    
    
}
//点击参与
-(void)actionButton:(UIButton *)button
{
    
    
}

-(void)pop
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
