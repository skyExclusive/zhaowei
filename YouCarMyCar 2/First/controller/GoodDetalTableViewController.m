//
//  GoodDetalTableViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/27.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "GoodDetalTableViewController.h"

#import "PrefixHeader.pch"
#import "GoodTableTableViewCell.h"



@interface GoodDetalTableViewController ()<MylistFirstbleDelegate>

@end

@implementation GoodDetalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
   
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    
    if (section == 1) {
        return 30;
        
    }else {
        
        
        return 0;
        
    }
    
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        self.myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainWidth, 30)];
        self.myView.backgroundColor = COLOR(253, 246, 240, 1);

        self.myliftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.myliftButton.frame = CGRectMake(0, 0, 80, 30);
        
        [self.myliftButton setBackgroundImage:[UIImage imageNamed:@"产品详情@2x(1).png"] forState:(UIControlStateNormal)];
        
        [self.myView addSubview:self.myliftButton];
        
        self.myRignth = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.myRignth.frame = CGRectMake(80, 0, 80, 30);
        [self.myRignth addTarget:self action:@selector(myRignth:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.myRignth setBackgroundImage:[UIImage imageNamed:@"参与评论未选中@2x(1).png"] forState:(UIControlStateNormal)];
        [self.myView addSubview:self.myRignth];
        
        
        
        
               return self.myView;


    }
    
    return nil;
    
}
-(void)myRignth:(UIButton *)button
{
    
    if ([self.delegate respondsToSelector:@selector(ringhtButtonAction:)]) {
        [self.delegate ringhtButtonAction:button];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        
        static NSString *goodindext = @"goods";
        GoodTableTableViewCell *goodcell = [self.tableView dequeueReusableCellWithIdentifier:goodindext];
        if (!goodcell) {
            goodcell = [[GoodTableTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:goodindext];
            goodcell.myImageView.image = [UIImage imageNamed:@"33.jpg"];
            
            
            
            
            
        }
        
        goodcell.selectionStyle = UITableViewCellSelectionStyleNone;

        return goodcell;


        
 
    }
    
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 170;
    
}
//点击的方法

//点击参与走的方法

-(void)actionButton:(UIButton *)button
{
    
    
}
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