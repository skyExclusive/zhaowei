//
//  ClickViewController.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/7.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "ClickViewController.h"

@interface ClickViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.i == 0) {
        //布局我的参与
        [self layoutJoinView];
    }else if (self.i == 1) {
        //布局活动介绍
        [self layoutIntroduce];
    }else if (self.i == 2) {
        //布局关于我们
        [self layoutOurs];
    }else if (self.i == 3) {
        //布局用户反馈
        [self layoutBack];
    }
}
//布局我的参与
-(void)layoutJoinView
{
    self.title = @"我的参与";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 1) {
        return 5;
    }else{
        return 1;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 155;
        
        
    }else{
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1 || section  ==0) {
        return 0;
    }else{
        return 5;
    }
}
//cell 的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"恶心");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndetifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];

    }
    
    
    return cell;
}

//布局活动介绍
-(void)layoutIntroduce
{
    self.title = @"活动介绍";
    UILabel *lable = [[UILabel alloc]initWithFrame:self.view.bounds];
    lable.text = @"这个是活动介绍";
    lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
}
//布局关于我们
-(void)layoutOurs
{
    self.title = @"关于我们";
    UILabel *lable = [[UILabel alloc]initWithFrame:self.view.bounds];
    lable.text = @"这个是关于我们";
     lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
    
}
//布局用户反馈
-(void)layoutBack
{
    self.title = @"用户反馈";
    UILabel *lable = [[UILabel alloc]initWithFrame:self.view.bounds];
    lable.text = @"用户反馈";
     lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
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
