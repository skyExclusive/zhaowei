//
//  NowViewController.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/1.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "NowViewController.h"
#import "PrefixHeader.pch"
#import "MyListFirstTableViewCell.h"
#import "NowTextDetalViewController.h"

@interface NowViewController ()<UITableViewDataSource,UITableViewDelegate,MylistFirstbleDelegate>
@property (nonatomic,strong)UITableView *mytable;
@end

@implementation NowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    self.miao = [dat timeIntervalSince1970];
    NSLog(@"%f",self.miao);
    
    
//    NSString *timeString = [NSString stringWithFormat:@"%f", a];//转为字符型
    

    
    // Do any additional setup after loading the view.
    self.mytable = [[UITableView alloc]initWithFrame:CGRectMake(kMainX, kMainY, kMainWidth, kMainHeight-150)];
    self.mytable.delegate = self;
    self.mytable.dataSource = self;
    [self.view addSubview:self.mytable
     ];
    self.mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self cuostom];//获取数据
    
    

}
-(void)cuostom
{
    
    
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 15;

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 170;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cell = @"index";
    MyListFirstTableViewCell *mycell = [self.mytable dequeueReusableCellWithIdentifier:cell];
    
    
    if (!mycell) {
        
        mycell = [[MyListFirstTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cell];
        mycell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
    }
    
    
    
    mycell.mybutton.tag = 100 + indexPath.row;
    
    mycell.delegagate = self;
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970];
    
    NSLog(@"%f", a - self.miao);
    
    mycell.mytimeInteger = 1000 - (a - self.miao) ;
    
    NSLog(@"我擦");


    
    return mycell;
    
}

-(void)actionButton:(UIButton *)button
{
    NSInteger aa = button.tag - 100;
    NSLog(@"%ld",(long)aa);
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NowTextDetalViewController *detal = [[NowTextDetalViewController alloc]init];
    [[super navigationController] pushViewController:detal animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
