//
//  NowDetalViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/2.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "NowDetalViewController.h"

#import "HEInfiniteScrollView.h"
#import "NowDetaNeiViewController.h"


@interface NowDetalViewController ()

@property (nonatomic ,strong)UIView *rootView;


@end

@implementation NowDetalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rootView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.rootView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"商品详情";
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    
    [self scrollerView];
    

}
-(void)scrollerView
{
    UIView *root = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:root];
    
    
    
    NowDetaNeiViewController *nei = [[NowDetaNeiViewController alloc]init];
    [self addChildViewController:nei];
    [self.view addSubview:nei.view ];
    
    
    
    
}
- (void)infiniteScrollView:(HEInfiniteScrollView *)infiniteScrollView ItemOnclick:(NSUInteger)index{
    NSLog(@"click - %zd", index);
}

- (void)infiniteScrollView:(HEInfiniteScrollView *)infiniteScrollView DidFlipOver:(NSUInteger)pageNum{
    NSLog(@"pageNum - %zd", pageNum);
}


-(void)pop
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
