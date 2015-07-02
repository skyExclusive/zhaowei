//
//  FirstViewController.m
//  YoucarMycar
//
//  Created by LLY on 15-6-26.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "FirstViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboApi.h"
#import "WeiboSDK.h"
#import "PrefixHeader.pch"
#import <WeChatConnection/WeChatConnection.h>
#import "NowViewController.h"
#import "WillViewController.h"

#import <QZoneConnection/QZoneConnection.h>
#define kseGmentHeight 40
#define kscrollViewH 104


@interface FirstViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)NowViewController *nowVC;
@property (nonatomic,strong)WillViewController *willVC;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.title = @"免费体验商品";
    
     //布局
    [self costom];
    
    
   }

-(void)costom
{
    //布局segment
    self.mySegment = [[UISegmentedControl alloc]initWithItems:@[@"正在进行",@"即将开启"]];
    self.mySegment.backgroundColor = [UIColor whiteColor];
    self.mySegment.frame = CGRectMake(0, 64, kMainWidth,kseGmentHeight);
    [self.mySegment addTarget:self action:@selector(segmentAction:) forControlEvents:(UIControlEventValueChanged)];
    self.mySegment.selectedSegmentIndex = 0;
    [self.view addSubview:self.mySegment];
    //布局 UIScrollView
    self.myscrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kscrollViewH, kMainWidth, kMainHeight - kscrollViewH - 44)];
    self.myscrollView.contentSize = CGSizeMake(kMainWidth * 2, kMainHeight - kscrollViewH - 44);
    self.myscrollView.backgroundColor = [UIColor whiteColor];
    self.myscrollView.showsVerticalScrollIndicator = NO;
    self.myscrollView.showsVerticalScrollIndicator = NO;
    self.myscrollView.pagingEnabled = YES;
    self.myscrollView.delegate = self;
    [self.view   addSubview:self.myscrollView];

    self.nowVC = [[NowViewController alloc]init];
    self.willVC = [[WillViewController alloc]init];
    self.nowVC.view.frame = CGRectMake(0, kMainY, kMainWidth, kMainHeight);
    self.willVC.view.frame = CGRectMake(kMainWidth, kMainY, kMainWidth, kMainHeight);
    
    [self addChildViewController:self.nowVC];
    [self.myscrollView addSubview:self.nowVC.view];
    [self addChildViewController:self.willVC];
    [self.myscrollView addSubview:self.willVC.view];
    
    
    
}

-(void)segmentAction:(UISegmentedControl *)segmeng
{
    if (segmeng.selectedSegmentIndex == 0) {
        NSLog(@"正在进行的商品");
        self.myscrollView.contentOffset = CGPointMake(0, 0);
    }else if (segmeng.selectedSegmentIndex == 1){
        NSLog(@"即将开启");
        self.myscrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    }
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.mySegment.selectedSegmentIndex = self.myscrollView.contentOffset.x/kMainWidth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
