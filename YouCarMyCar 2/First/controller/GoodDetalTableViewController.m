//
//  GoodDetalTableViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/27.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "GoodDetalTableViewController.h"

#import "PrefixHeader.pch"



@interface GoodDetalTableViewController ()

@end

@implementation GoodDetalTableViewController

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
    if (section == 1) {
        self.myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainWidth, 200)];
        self.myView.backgroundColor = COLOR(253, 246, 240, 1);

        self.myliftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.myliftButton.frame = CGRectMake(0, 0, 80, 30);
        
        [self.myliftButton setBackgroundImage:[UIImage imageNamed:@"产品详情@2x.png"] forState:(UIControlStateNormal)];
        
        [self.myView addSubview:self.myliftButton];
        
        self.myRignth = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.myRignth.frame = CGRectMake(80, 0, 80, 30);
        
        [self.myRignth setBackgroundImage:[UIImage imageNamed:@"参与评论未选中@2x.png"] forState:(UIControlStateNormal)];
        [self.myView addSubview:self.myRignth];
        
        
        
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(15, 35, kMainWidth - 30, 15)];
        lable.text = @"小提示:积极参与用户活动与反馈用户使用报告,及可提高免费试用的成功率!";
        
        lable.textColor = [UIColor redColor];
        lable.font = [UIFont systemFontOfSize:8];
        [self.myView addSubview:lable];
        
        
        
        self.myTextView = [[ZWTextView alloc]initWithFrame:CGRectMake(10, 50, kMainWidth - 80, 50)];
        
        
        [self.myView addSubview:self.myTextView];
        self.myTextView.backgroundColor = [UIColor grayColor];
        self.myTextView.placeholder = @"请在这里输入您想说的话";
        
        
        
        return self.myView;


    }
    
    return nil;
    
    self.view.backgroundColor = [UIColor orangeColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
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
   static NSString *cell = @"index";
     MyListFirstTableViewCell *mycell = [self.tableView dequeueReusableCellWithIdentifier:cell];
 
 
     if (!mycell) {
 
    mycell = [[MyListFirstTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cell];
    mycell.selectionStyle = UITableViewCellSelectionStyleNone;
 
 
  
 }
    
    return mycell;
    

}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 170;
    
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
