//
//  ClickViewController.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/7.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "ClickViewController.h"
#import "PrefixHeader.pch"
#import "ClickTViewController.h"
#import "addressTableViewCell.h"
#import "ZWTextView.h"
@interface ClickViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)ZWTextView *textView;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UITextField *phoneField;
@property (nonatomic,strong)UIButton *passButton;
@property (nonatomic,strong)UITextField *codeField;
@property (nonatomic,strong)UIButton *nextButton;

@end

@implementation ClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR(255, 250, 242, 1);
    // Do any additional setup after loading the view.
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
    }else if (self.i == 11) {
        //布局地址编辑
        [self layoutAddress];
    }else if (self.i == 12) {
        //布局修改密码
        [self layoutPassword];
    }
    
    
    //返回的箭头
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    
}

-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
//布局地址编辑
-(void)layoutAddress
{
    self.title = @"地址管理";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"addressTableViewCell" bundle:nil] forCellReuseIdentifier:@"addressCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    //返回的箭头
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"添加按钮.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 25, 25);
    [button setTintColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(add) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
}

-(void)add
{
    NSLog(@"添加 cell ");
}
//布局修改密码
-(void)layoutPassword
{
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 80, kMainWidth - 20, 50)];
    imageView.image = [UIImage imageNamed: @"白色背景.png"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    self.phoneField = [[UITextField alloc]initWithFrame:CGRectMake(10+kMainWidth/9, 0, kMainWidth - 20 - kMainWidth/8, 50)];
    self.phoneField.placeholder = @"请输入您的手机号";
    self.phoneField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneField.delegate = self;
    [imageView addSubview:self.phoneField];
    
    UIButton *verifyButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [verifyButton setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    verifyButton.titleLabel.font = [UIFont fontWithName:@"获取验证码" size:12];
    [verifyButton addTarget:self action:@selector(verify:) forControlEvents:(UIControlEventTouchUpInside)];
    verifyButton.frame = CGRectMake(kMainWidth - 20 -90, 80, 90, 50);
    [self.view addSubview:verifyButton];
    
    
    UIImageView *codeimageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, imageView.frame.origin.y +70, kMainWidth - 20, 50)];
    codeimageView.image = [UIImage imageNamed: @"白色背景.png"];
    codeimageView.userInteractionEnabled = YES;
    [self.view addSubview:codeimageView];
    
    self.codeField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, kMainWidth - 40, 50)];
    
    self.codeField.placeholder = @"请输入验证码";
    self.codeField.delegate = self;
    self.codeField.keyboardType = UIKeyboardTypeNumberPad;
    [codeimageView addSubview:self.codeField];
    
    self.nextButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [self.nextButton setTitle:@"下一步" forState:(UIControlStateNormal)];
    [self.nextButton addTarget:self action:@selector(sure) forControlEvents:(UIControlEventTouchUpInside)];
    self.nextButton.frame = CGRectMake(10, codeimageView.frame.origin.y + 100, kMainWidth - 20, 50);
    self.nextButton.backgroundColor = COLOR(49, 219, 224, 1);
    [self.nextButton setTintColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.nextButton];
    

}
//获取验证码
-(void)verify:(UIButton *)button
{
    NSLog(@"这里是获取验证码");
}


//sureButton的点击事件
-(void)sure
{
    ClickTViewController *clicktView = [[ClickTViewController alloc]init];
    [self.navigationController pushViewController:clicktView animated:YES];
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
    
    if (self.i == 11) {
        return 1;
    }else {
        return 3;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.i == 11) {
        return 5;
    }else {
        return 3;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.i == 11) {
        return 150;
    }else {
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.i == 11) {
        return 0;
    }else {
        return 50;
    }
}
//cell 的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"恶心");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (self.i == 11) {
        addressTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"addressCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else {
    
    static NSString *cellIndetifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];

    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    }
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
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    self.textView = [[ZWTextView alloc]initWithFrame:CGRectMake(10, 30, kMainWidth - 20, 200)];
    self.textView.textColor = [UIColor blackColor];
    self.textView.placeholder = @"你车我车感谢您的支持";
    self.textView.font =  [UIFont fontWithName:@"Arial" size:16.0];;
    self.textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textView];
    
    
    self.button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button.frame = CGRectMake(10, kMainWidth/1.5 + 20, kMainWidth - 20, kMainWidth/9);
    [self.button setTitle:@"提交" forState:(UIControlStateNormal)];
    [self.button addTarget:self action:@selector(tijiao:) forControlEvents:(UIControlEventTouchUpInside)];
    self.button.backgroundColor = COLOR(55, 219, 223, 1);
    [self.button setTintColor:[UIColor whiteColor]];
    [self.view addSubview:self.button];
    
}

//键盘回收
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.phoneField resignFirstResponder];
    [self.codeField resignFirstResponder];
}

-(void)tijiao:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
