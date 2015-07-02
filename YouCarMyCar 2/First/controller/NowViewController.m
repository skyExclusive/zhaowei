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
#import "NowDetalViewController.h"

@interface NowViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *mytable;
@end

@implementation NowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mytable = [[UITableView alloc]initWithFrame:CGRectMake(kMainX, kMainY, kMainWidth, kMainHeight-150)];
    self.mytable.delegate = self;
    self.mytable.dataSource = self;
    [self.view addSubview:self.mytable
     ];
    self.mytable.separatorStyle = UITableViewCellSeparatorStyleNone;


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
    
    return mycell;
    
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NowDetalViewController *detal = [[NowDetalViewController alloc]init];
    [self.navigationController pushViewController:detal animated:YES];
    
    
    
    
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
