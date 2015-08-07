//
//  SpeckTableViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/27.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "SpeckTableViewController.h"

#import "PrefixHeader.pch"

#import "SpeckTableViewCell.h"

@interface SpeckTableViewController ()<MylistFirstbleDelegate>

@end

@implementation SpeckTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;

    
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    
    if (section == 1) {
        return 100;
        
    }else {
        
        
        return 0;
        
    }
    
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (kMainHeight == 480) {
        if (section == 1) {
            self.myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainWidth, 200)];
            self.myView.backgroundColor = COLOR(253, 246, 240, 1);
            
            self.myliftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.myliftButton.frame = CGRectMake(0, 0, 80, 30);
            
            [self.myliftButton setBackgroundImage:[UIImage imageNamed:@"产品详情未选中@2x.png"] forState:(UIControlStateNormal)];
            [self.myliftButton addTarget:self action:@selector(myliftButton:) forControlEvents:(UIControlEventTouchUpInside)];
            
            
            
            [self.myView addSubview:self.myliftButton];
            
            self.myRignth = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.myRignth.frame = CGRectMake(80, 0, 80, 30);
            
            [self.myRignth setBackgroundImage:[UIImage imageNamed:@"参与评论@2x(1).png"] forState:(UIControlStateNormal)];
            [self.myView addSubview:self.myRignth];
            
            
            
            
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15, 35, kMainWidth - 30, 15)];
            lable.text = @"小提示:积极参与用户活动与反馈用户使用报告,及可提高免费试用的成功率!";
            
            lable.textColor = [UIColor redColor];
            lable.font = [UIFont systemFontOfSize:8];
            [self.myView addSubview:lable];
            
            
            
            self.myTextView = [[ZWTextView alloc]initWithFrame:CGRectMake(10, 50, kMainWidth - 80, 50)];
            
            
            [self.myView addSubview:self.myTextView];
            self.myTextView.backgroundColor = COLOR(233, 233, 233, 1);
            self.myTextView.placeholder = @"请在这里输入您想说的话...";
            
            
            self.myspeckButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.myspeckButton.frame = CGRectMake(kMainWidth - 60, 50, 50, 50);
            [self.myspeckButton setBackgroundImage:[UIImage imageNamed:@"发表@2x.png"] forState:(UIControlStateNormal)];
            [self.myspeckButton addTarget:self action:@selector(myspeckButton:) forControlEvents:(UIControlEventTouchUpInside)];
            
            
            [self.myView addSubview:self.myspeckButton];
            
            
            return self.myView;
            
            
        }
        
        return nil;

    }else {
        if (section == 1) {
            self.myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainWidth, 200)];
            self.myView.backgroundColor = COLOR(253, 246, 240, 1);
            
            self.myliftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.myliftButton.frame = CGRectMake(0, 0, 100, 40);
            
            [self.myliftButton setBackgroundImage:[UIImage imageNamed:@"产品详情未选中@2x.png"] forState:(UIControlStateNormal)];
            [self.myliftButton addTarget:self action:@selector(myliftButton:) forControlEvents:(UIControlEventTouchUpInside)];
            
            
            
            [self.myView addSubview:self.myliftButton];
            
            self.myRignth = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.myRignth.frame = CGRectMake(100, 0, 100, 40);
            
            [self.myRignth setBackgroundImage:[UIImage imageNamed:@"参与评论@2x(1).png"] forState:(UIControlStateNormal)];
            [self.myView addSubview:self.myRignth];
            
            
            
            
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15, 45, kMainWidth - 30, 15)];
            lable.text = @"小提示:积极参与用户活动与反馈用户使用报告,及可提高免费试用的成功率!";
            
            lable.textColor = [UIColor redColor];
            lable.font = [UIFont systemFontOfSize:8];
            [self.myView addSubview:lable];
            
            
            
            self.myTextView = [[ZWTextView alloc]initWithFrame:CGRectMake(10, 60, kMainWidth - 80, 50)];
            
            
            [self.myView addSubview:self.myTextView];
            self.myTextView.backgroundColor = COLOR(233, 233, 233, 1);
            self.myTextView.placeholder = @"请在这里输入您想说的话...";
            
            
            self.myspeckButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.myspeckButton.frame = CGRectMake(kMainWidth - 60, 60, 50, 50);
            [self.myspeckButton setBackgroundImage:[UIImage imageNamed:@"发表@2x.png"] forState:(UIControlStateNormal)];
            [self.myspeckButton addTarget:self action:@selector(myspeckButton:) forControlEvents:(UIControlEventTouchUpInside)];
            
            
            [self.myView addSubview:self.myspeckButton];
            
            
            return self.myView;
            
            
        }
        
        return nil;

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)myspeckButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(speckButtonAction:)]) {
        [self.delegate speckButtonAction:button];
        
    }

    
    
}
-(void)myliftButton:(UIButton *)button
{
    
    if ([self.delegate respondsToSelector:@selector(lightButtonAction:)]) {
        [self.delegate lightButtonAction:button];
        
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    
    if (section == 0) {
        return 1;
        
    }else {
        
        return 20;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *cell = @"index";
        MyListFirstTableViewCell *mycell = [self.tableView dequeueReusableCellWithIdentifier:cell];
        
        
        if (!mycell) {
            
            mycell = [[MyListFirstTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cell];
            mycell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            
        }
        mycell.mybutton.tag = 100 + indexPath.row;
        
        mycell.delegagate = self;
        
        mycell.mytimeInteger = 1000 + indexPath.row;
        
        mycell.selectionStyle = UITableViewCellSelectionStyleNone;
        

        
        return mycell;
        

    }else {
        
       static NSString *speckindext = @"indext";
        SpeckTableViewCell *speckCell = [self.tableView dequeueReusableCellWithIdentifier:speckindext];
        if (!speckCell) {
            speckCell = [[SpeckTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:speckindext];
            
        }
        
        
        speckCell.myPersonTimageView.layer.cornerRadius = 15;
        speckCell.myPersonTimageView.layer.masksToBounds = YES;
        speckCell.myPersonTimageView.image = [UIImage imageNamed:@"2.png"];
        speckCell.myNameLable.text = @"无敌老五";
        speckCell.myNameLable.textColor = [UIColor brownColor];
        speckCell.mySpeckLable .text  = @"爽歪歪的商品  相当的adsfa asdf asdfalsfasdfaslfjadfjas dfaldskfa dfalsdfasdkfa好用";
        
        
        speckCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return speckCell;
        
        
    }
    
    
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return 170;
        
    }else {
    
    return 110;
    }
}

// 点击参与活动按钮

-(void)actionButton:(UIButton *)button
{
    
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
