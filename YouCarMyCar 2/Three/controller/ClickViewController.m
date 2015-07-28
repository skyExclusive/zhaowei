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
#import "ActivityTableViewCell.h"
#import "DiJiQiTableViewCell.h"
#import "SureViewController.h"
@interface ClickViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)ZWTextView *textView;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UITextField *phoneField;
@property (nonatomic,strong)UIButton *passButton;
@property (nonatomic,strong)UITextField *codeField;
@property (nonatomic,strong)UIButton *nextButton;
@property (nonatomic,strong)UIImageView *choiceImage;

@end

@implementation ClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR(251, 246, 240, 1);
    // Do any additional setup after loading the view.
    if (self.i == 0) {
        //布局我的参与
        [self layoutJoinView];
    }else if (self.i == 1) {
        //布局活动介绍
        [self layoutIntroduce];
    }else if (self.i == 5) {
        //布局关于我们
        [self layoutOurs];
    }else if (self.i == 6) {
        //布局用户反馈
        [self layoutBack];
    }else if (self.i == 11) {
        //布局地址编辑
        [self layoutAddress];
    }else if (self.i == 12) {
        //布局修改密码
        [self layoutPassword];
    }else if (self.i == 13) {
        [self layoutSexVC];
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

//********************************活动记录*********************************
-(void)layoutJoinView
{
    self.title = @"活动记录";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:nil] forCellReuseIdentifier:@"huodongCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DiJiQiTableViewCell" bundle:nil] forCellReuseIdentifier:@"dijiqiCell"];
}

//********************************性别改变*********************************
-(void)layoutSexVC
{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = MainBackGround;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.choiceImage = [[UIImageView alloc]initWithFrame:CGRectMake(kMainWidth - 40, 15, 20, 20)];
    self.choiceImage.image = [UIImage imageNamed:@"性别选择.png"];
//    self.choiceImage.hidden = YES;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.i == 11 || self.i == 13) {
        return 1;
    }else {
        return 3;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.i == 11) {
        return 5;
    }else if (self.i == 13){
        return 4;
    }else{
        return 3;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.i == 11) {
        return 150;
    }else if (self.i == 13) {
        if (indexPath.row == 0) {
            return 10;
        }else{
        return 50;
            
        }
    }else{
        if (indexPath.row == 0) {
            return 35;
        }else{
        return 100;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.i == 0) {
        return 7;
    }else {
        return 0;
    }
}

//cell 的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.i == 0) {
        NSLog(@"这个是活动记录的点击事件");
    }else if (self.i == 13){
        
        
        
        self.choiceImage.hidden = NO;
        
        NSLog(@"确实已经点了");
        
        
        
        
        
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (self.i == 11) {
        
        
        addressTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"addressCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.superview.superview.backgroundColor = MainBackGround;
        cell.backgroundColor = MainBackGround;
        
        return cell;
        
    }else if (self.i == 13) {
        
        NSString *tag=@"tag";
        NSArray *arr = [[NSArray alloc]initWithObjects:@" ",@"男",@"女",@"保密", nil];
        NSString *cellString  =arr[indexPath.row];
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tag];
        

        if (cell==nil ) {
            cell=[[ UITableViewCell alloc]init];
            
            [cell addSubview:self.choiceImage];
            if (indexPath.row == 1 || indexPath.row == 2) {
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 49, kMainWidth - 20 , 1)];
                view.backgroundColor = COLOR(201, 201, 201, 1);
                [cell addSubview:view];
                

            }
                   }
        if (indexPath.row == 0) {
            cell.backgroundColor = MainBackGround;
        }
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 50)];
        lable.text = cellString;
        lable.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:lable];
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        
        
        return cell;
    }else{
        
        if (indexPath.row == 0) {
            DiJiQiTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"dijiqiCell" forIndexPath:indexPath];
            return cell;
        }else{
        
        ActivityTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"huodongCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.whatImage.image = [UIImage imageNamed:@"恭喜中奖.png"];
        cell.thingImage.image = [UIImage imageNamed:@"2.png"];
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        cell.superview.superview.backgroundColor = COLOR(251, 246, 240, 1);

        return cell;
       }
    }
}





//********************************地址编辑***************************************
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
    
    self.tableView.backgroundColor = MainBackGround;
    
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
    SureViewController *sure = [[SureViewController alloc]init];
    sure.j = 11;
    [self.navigationController pushViewController:sure animated:YES];
    NSLog(@"添加 cell ");
}
//***********************************修改密码********************************
-(void)layoutPassword
{
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 80, kMainWidth - 20, 50)];
    imageView.image = [UIImage imageNamed: @"圆角矩形-1.png"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    self.phoneField = [[UITextField alloc]initWithFrame:CGRectMake(10+kMainWidth/9, 0, kMainWidth - 20 - kMainWidth/8, 50)];
    self.phoneField.placeholder = @"请输入您的手机号";
    self.phoneField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneField.delegate = self;
    
    UILabel *phoneLable = [[UILabel alloc]initWithFrame:CGRectMake(1, 0, 50, 50)];
    phoneLable.text = @"+86";
    phoneLable.backgroundColor = [UIColor grayColor];
    phoneLable.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:phoneLable];
    [imageView addSubview:self.phoneField];
    
    UIButton *verifyButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [verifyButton setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    verifyButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [verifyButton addTarget:self action:@selector(verify:) forControlEvents:(UIControlEventTouchUpInside)];
    verifyButton.frame = CGRectMake(kMainWidth - 20 -90, 80, 90, 50);
    [self.view addSubview:verifyButton];
    
    
    UIImageView *codeimageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, imageView.frame.origin.y +70, kMainWidth - 20, 50)];
    codeimageView.image = [UIImage imageNamed: @"圆角矩形-1.png"];
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
    self.nextButton.titleLabel.font = MyButtonFont;
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


//********************************活动介绍*********************************

-(void)layoutIntroduce
{
    self.title = @"活动介绍";
    UILabel *lable = [[UILabel alloc]initWithFrame:self.view.bounds];
    lable.text = @"这个是活动介绍";
    lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
}
//********************************关于我们*********************************
-(void)layoutOurs
{
    self.title = @"关于我们";
    UILabel *lable = [[UILabel alloc]initWithFrame:self.view.bounds];
    lable.text = @"这个是关于我们";
     lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
    
}
//********************************用户反馈*********************************
-(void)layoutBack
{
    self.title = @"用户反馈";
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, kMainWidth - 20, kMainHeight/4)];
    imageView.image = [UIImage imageNamed:@"用户反馈.png"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    self.textView = [[ZWTextView alloc]initWithFrame:CGRectMake(10, 10, imageView.frame.size.width - 20, imageView.frame.size.height - 20)];
    self.textView.placeholder = @"你车我车感谢您的支持";
    self.textView.font =  [UIFont fontWithName:@"Arial" size:16.0];
    self.textView.delegate = self;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake( 10, 9, imageView.frame.size.width - 20, 3)];
    view.backgroundColor = [UIColor whiteColor];
    
    
    
    [imageView addSubview:self.textView];
    [imageView addSubview:view];
    

    self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.button.frame = CGRectMake(10, imageView.frame.origin.y + kMainHeight/4 +30 , kMainWidth - 20, kMainWidth/9);
    [self.button setBackgroundImage:[UIImage imageNamed:@"登录注册按钮背景.png"] forState:(UIControlStateNormal)];
 
    [self.button setTitle:@"提交" forState:(UIControlStateNormal)];
    [self.button addTarget:self action:@selector(tijiao:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.button setTintColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.button];
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //隐藏键盘
    [self.textView  resignFirstResponder];
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
