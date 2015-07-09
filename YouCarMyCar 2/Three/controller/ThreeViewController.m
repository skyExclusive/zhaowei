//
//  ThreeViewController.m
//  YoucarMycar
//
//  Created by LLY on 15-6-26.
//  Copyright (c) 2015年 LLY. All rights reserved.
//



#import "ThreeViewController.h"
#import "TouxiangTableViewCell.h"
#import "ClickViewController.h"
#import "TongyongTableViewCell.h"
#import "PrefixHeader.pch"
#import "XiangViewController.h"
#define kModaD self.view.frame.origin.x

@interface ThreeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableDictionary *dic;
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor redColor];
    
    
//布局view
    [self layoutView];
    
}

//布局view
-(void)layoutView
{
    
    self.navigationItem.title = @"个人信息";
  
    self.dic = [[NSMutableDictionary alloc]init];
    NSArray *array1 = [[NSArray alloc]initWithObjects:@"我的参与",@"活动介绍",@"关于我们",@"用户反馈",@"版本更新", nil];
    NSArray *array2 = [[NSArray alloc]initWithObjects:@"退出登录", nil];
    [self.dic  setValue:array1 forKey:@"1"];
    [self.dic  setValue:array2 forKey:@"2"];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TouxiangTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TongyongTableViewCell" bundle:nil] forCellReuseIdentifier:@"tongCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    

    
    
//右item
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:(UIBarButtonItemStyleDone) target:self action:@selector(bianji)];
    self.navigationItem.rightBarButtonItem = item;
    
    
}

//设置的点击事件
-(void)bianji
{
    XiangViewController *xiangVC = [[XiangViewController alloc]init];
    [self.navigationController pushViewController:xiangVC animated:YES];
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
    ClickViewController *clichVC = [[ClickViewController alloc]init];
    clichVC.i = 0;
   
    if (indexPath.section ==1 && indexPath.row <4) {
        for (int a = 0; a <5; a ++) {
        if (indexPath.section == 1 && indexPath.row == a) {
            clichVC.i = a;
        }
    }
    [self.navigationController pushViewController:clichVC animated:YES];
    }else if (indexPath.section ==1 && indexPath.row == 4) {
        UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:@"已经是最新版本" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alterView.backgroundColor = [UIColor redColor];
        [alterView show];
    }else {
        NSLog(@"退出登陆");
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = [self.dic valueForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]];
    NSString *str = array[indexPath.row];
    if (indexPath.row == 0 && indexPath.section == 0) {
        
        TouxiangTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"imageCell"forIndexPath:indexPath];
        cell.photoImage.layer.cornerRadius = cell.photoImage.frame.size.height/2;
        cell.photoImage.layer.masksToBounds = YES;
        cell.photoImage.image = [UIImage imageNamed:@"2.png"];
        cell.backimage.image = [UIImage imageNamed:@"2.png"];
        
        //毛玻璃效果
        UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        visualEfView.frame = CGRectMake(cell.backimage.frame.origin.x, cell.backimage.frame.origin.y-2, cell.backimage.frame.size.width, cell.backimage.frame.size.height+2);
        visualEfView.alpha = 1.0;
        [cell.backimage addSubview:visualEfView];
        cell.photoImage.userInteractionEnabled = YES;
        cell.superview.superview.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //轻怕手势
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(push:)];
        self.view.userInteractionEnabled = YES;
        [cell.photoImage addGestureRecognizer:tap1];
        

        return cell;
        
        
    }else{
        
        TongyongTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tongCell" forIndexPath:indexPath];;
        cell.lableText.text = str;
        cell.lableText.textColor = [UIColor colorWithRed:15 / 255.0 green:15/ 255.0  blue:15/ 255.0  alpha:1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.section == 1  && indexPath.row < 4) {
            cell.myView.alpha = 1;
        }
        if (indexPath.section == 2  && indexPath.row == 0) {
            [cell.boultImage removeFromSuperview];
            [cell.lableText removeFromSuperview];
            
            
            
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(kMainWidth/2-36, 0, kMainWidth, 50)];;
            lable.text = @"退出登陆";
            [cell addSubview:lable];
            lable.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor redColor];
            
        }
        
        
        return cell;
    }
}
//头像的点击事件
-(void)push:(UITapGestureRecognizer *)tap
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
