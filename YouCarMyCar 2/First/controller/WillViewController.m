//
//  WillViewController.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/1.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "WillViewController.h"
#import "PrefixHeader.pch"
#import "MyListFirstTableViewCell.h"
@interface WillViewController ()<UITableViewDataSource,UITableViewDelegate,MylistFirstbleDelegate>
@property (nonatomic,strong)UITableView *willtable;
@end
@implementation WillViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.willtable = [[UITableView alloc]initWithFrame:CGRectMake(kMainX, kMainY, kMainWidth, kMainHeight-150)];
    self.willtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.willtable.delegate = self;
    self.willtable.dataSource = self;
    [self.view addSubview:self.willtable];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    MyListFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[MyListFirstTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    cell.mydescritionLable.text = @"即将开启的商品的 描述";
    cell.myGoodImageVeiw.image = [UIImage   imageNamed:@"3.jpg"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.mybutton.tag = 100 + indexPath.row;
    cell.delegagate = self;
    cell.mytimeInteger = 1000 + indexPath.row;
    
    
    
    return cell;
}

-(void)actionButton:(UIButton *)button
{
    
    
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
