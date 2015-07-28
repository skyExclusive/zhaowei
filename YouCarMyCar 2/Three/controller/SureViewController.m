//
//  SureViewController.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/16.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "SureViewController.h"
#import "PrefixHeader.pch"
@interface SureViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *addressField;
@property (nonatomic,strong)UITableView *addressTableView;
@end

@implementation SureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =  MainBackGround;
    
  
    if (self.j == 10) {
        //布局修改密码
        [self layoutSureKey];
    }else if (self.j == 11) {
        //布局添加地址
        [self laoutAddAddress];
    }

    

    
    //返回的箭头
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    
}

//**********************************************布局修改密码*************************************
-(void)layoutSureKey
{
    self.title = @"修改密码";
    

    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kMainWidth/2 - 45, kMainHeight/5 , 90, 90)];
    imageView.image = [UIImage imageNamed:@"密码设置成功.png"];
    [self.view addSubview:imageView];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(kMainWidth/2 -100,kMainHeight/5 +140 , 200, 30)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = @"密码设置成功!";
    [self.view addSubview:lable];
    
    
    
    
    UIButton *surebutton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    surebutton.frame = CGRectMake(20, kMainHeight/5 +200, kMainWidth - 40, 50);
    [surebutton setTitle:@"确定" forState:(UIControlStateNormal)];
    [surebutton setTintColor:[UIColor whiteColor]];
    surebutton.titleLabel.font = MyButtonFont;
    surebutton.backgroundColor = COLOR(53, 224, 229, 1);
    [surebutton addTarget:self action:@selector(sure) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:surebutton];
}


-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)sure
{
    NSLog(@"应该是模态出登陆页面");
}


//**********************************************布局添加地址*************************************
-(void)laoutAddAddress
{
    self.title = @"新增地址";
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(kMainX,-64 , kMainWidth, kMainHeight * 2)];
    scrollView.backgroundColor = MainBackGround;
    
    UILabel *myLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 84, kMainWidth, 40)];
    myLable.text = @"请您认真填写,以便我们准确发货";
    myLable.textAlignment = NSTextAlignmentCenter;
    myLable.backgroundColor = COLOR(36, 141, 216, 1);
    myLable.textColor = [UIColor whiteColor];
    [scrollView addSubview:myLable];
    
    NSArray *arr = [[NSArray alloc]initWithObjects:@"请输入收货人姓名",@"请输入您的详细地址",@"请输入您的联系电话",@"请输入您的邮箱", nil];
    
    for (int i = 0; i < 4 ; i++) {
        UIView  *lable = [[UIView alloc]initWithFrame:CGRectMake(30, 144 + i*45, kMainWidth - 60, 40)];
        lable.backgroundColor = [UIColor whiteColor];
        lable.layer.cornerRadius = 4;
        
        
        self.addressField = [[UITextField alloc]initWithFrame:CGRectMake(25, 0, lable.frame.size.width - 30, 40)];
        _addressField.delegate = self;
        _addressField.tag = 100 + i;
        UIFont *font = [UIFont systemFontOfSize:17];
        UIColor *color =COLOR(100, 100, 100, 1);
        // 没错，就是看接下来这一步了。
        _addressField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:arr[i] attributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color}];
        
    
        [scrollView addSubview:lable];
        
        [lable addSubview:_addressField];

    }
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 340, kMainWidth - 40, 130)];
    imageView.image = [UIImage imageNamed:@"小提示1.png"];
    [scrollView addSubview:imageView];
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setBackgroundImage:[UIImage imageNamed:@"登录注册按钮背景.png"] forState:(UIControlStateNormal)];
    [button setFrame:CGRectMake(10, imageView.frame.origin.y + 160, kMainWidth - 20 , 40)];
        [button setTitle:@"确定" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(sureAddress) forControlEvents:(UIControlEventTouchUpInside)];


    [scrollView addSubview:button];
    
    [self.view addSubview:scrollView];
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void)sureAddress
{
    NSLog(@"确定添加新地址");
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
