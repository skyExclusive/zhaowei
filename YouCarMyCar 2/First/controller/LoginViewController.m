//
//  LoginViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/4.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "LoginViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <QZoneConnection/ISSQZoneApp.h>
#import "ForgetViewController.h"
#import "RegistViewController.h"

@interface LoginViewController ()<UIActionSheetDelegate,UITextFieldDelegate>

@end
@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"登录界面";

    
    
    [self coustom];//布局
}

-(void)viewWillAppear:(BOOL)animated
{
    
    self.tabBarController.tabBar.hidden = YES;
    
    
}
-(void)coustom
{
    self.indextX = self.view.frame.size.width / 320;
    self.indextY = self.view.frame.size.height / 480;
    
    
    //分享按钮
    
    
    UIButton *share = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [share setTitle:@"一键分享" forState:(UIControlStateNormal)];
    share.frame = CGRectMake(0, 0, 80, 30);
    [share addTarget:self action:@selector(share:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:share ];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:share];
    self.navigationItem.rightBarButtonItem = right;
    

    
    
    //返回的箭头
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    
    
    // 布局登录
    
    //1photo
    self.photoImabeView  = [[UIImageView alloc]initWithFrame:CGRectMake(120 *self.indextX, 84 * self.indextY, 80, 80)];
    
    self.photoImabeView.image = [UIImage imageNamed:@"3.jpg"];
    self.photoImabeView.layer.cornerRadius = 40;
    self.photoImabeView.layer.masksToBounds = YES;
    [self.view addSubview:self.photoImabeView];
    
    //username
    
    self.userNameLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 180 * self.indextY, 300*self.indextX, 40  )];
    self.userNameLable.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.userNameLable];
    
    self.userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(40,  180 * self.indextY, (320 - 40) * self.indextX , 40)];
    self.userNameTextField.placeholder = @"输入手机号";
    self.userNameTextField.delegate = self;
    
    [self.view addSubview:self.userNameTextField];
    
    
    self.userNameImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 180 * self.indextY +5 , 20, 30)];
    self.userNameImageView.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:self.userNameImageView];
    
    
    
    
    
    //password
    
    self.userPassWordLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 180*self.indextY + 60, 300*self.indextX, 40)];
    self.userPassWordLable.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.userPassWordLable];

    
    self.userPassWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(40,  180 * self.indextY+ 60, (320 - 40) * self.indextX , 40)];
    self.userPassWordTextField.placeholder = @"输入密码";
    self.userPassWordTextField.delegate = self;
    [self.view addSubview:self.userPassWordTextField];
    
    self.forgetPasswordButton  = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.forgetPasswordButton.frame = CGRectMake(230 * self.indextX, 180 * self.indextY + 60, 80, 40);
    
    [self.forgetPasswordButton setTitle:@"忘记密码?" forState:(UIControlStateNormal)];
    [self.forgetPasswordButton addTarget:self action:@selector(forget) forControlEvents:(UIControlEventTouchUpInside)];
     self.forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    
    //self.forgetPasswordButton.titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    [self.forgetPasswordButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [self.view addSubview:self.forgetPasswordButton];

    
    self.userPassWordImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 180 * self.indextY +5 + 60 , 20, 30)];
    self.userPassWordImageView.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:self.userPassWordImageView];
    
    //登录按钮
    
    self.loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.loginButton.frame = CGRectMake(10, 290 *self.indextY, 300 *self.indextX, 40);
    [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
    [self.loginButton  setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.loginButton.backgroundColor = [UIColor greenColor];
    [self.loginButton addTarget:self action:@selector(loginButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.loginButton];
    
    
    
    //注册按钮
    
    self.registerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.registerButton.frame = CGRectMake(10, 290 *self.indextY + 55, 300 *self.indextX, 40);
    [self.registerButton setTitle:@"注册" forState:(UIControlStateNormal)];
    [self.registerButton  setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.registerButton.backgroundColor = [UIColor greenColor];
    [self.registerButton addTarget:self action:@selector(registerButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.registerButton];
    

    
    
    
   // 第三方登录
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, (460 - 55) *self.indextY , 320 * self.indextX, 50)];
    myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myView];
    //
    
    self.qqImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, (460 - 55) *self.indextY, 50, 50)];
    self.qqImageView.image = [UIImage imageNamed:@"sns_icon_24.png"];
    [self.view addSubview:self.qqImageView];
    self.qqImageView.tag = 101;
    self.qqImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(login:)];
    [self.qqImageView addGestureRecognizer:tap];
    
    //
    self.weixinImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 40 ) / 3 - 20 + 50, (460 - 55) *self.indextY,50, 50)];
    self.weixinImageView.tag = 102;
    self.weixinImageView.userInteractionEnabled = YES;
    self.weixinImageView.image = [UIImage imageNamed:@"weixin.png"];
    UITapGestureRecognizer *tapweixin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(login:)];
    [self.weixinImageView addGestureRecognizer:tapweixin];
    [self.view addSubview:self.weixinImageView];
    
    //
    self.xinlangImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 30 - (self.view.frame.size.width - 40 ) / 3 + 20 , (460 - 55) *self.indextY, 50,50)];
    self.xinlangImageView.image = [UIImage imageNamed:@"sdk_weibo_logo.png"];
    UITapGestureRecognizer *tapxinlang = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(login:)];
    [self.xinlangImageView addGestureRecognizer:tapxinlang];
    self.xinlangImageView.tag = 103;
    self.xinlangImageView.userInteractionEnabled = YES;
    [self.view addSubview:self.xinlangImageView];
    
    
    
    
}
//点击textfield
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"点击textfiele");
    
    if (self.indextX == 1) {
        
        [UIView beginAnimations:@"animat" context:nil];
        //设置时间
        [UIView setAnimationDuration:0.5f];
        self.view.transform = CGAffineTransformMakeTranslation(0, -64);
        self.view.transform = CGAffineTransformScale(self.view.transform, 1.01, 1.01);
        [UIView commitAnimations];
        

        
    }
    
    
    
    return YES;
    
    
}
//点击return

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    [self.userPassWordTextField resignFirstResponder];
    [self.userNameTextField resignFirstResponder];
    [UIView beginAnimations:@"animat" context:nil];
    //设置时间
    [UIView setAnimationDuration:0.5f];
    self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    self.view.transform = CGAffineTransformScale(self.view.transform, 1.01, 1.01);
    [UIView commitAnimations];
    
    
    
    

    return YES;
    
}

//点击空白
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userPassWordTextField resignFirstResponder];
    [self.userNameTextField resignFirstResponder];
    
    [UIView beginAnimations:@"animat" context:nil];
    //设置时间
    [UIView setAnimationDuration:0.5f];
    self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    self.view.transform = CGAffineTransformScale(self.view.transform, 1.01, 1.01);
    [UIView commitAnimations];
    
    
    
}
-(void)loginButton:(UIButton *)button
{
    NSLog(@"登录");
    
}
-(void)registerButton:(UIButton *)button
{
    NSLog(@"注册");
    
    RegistViewController *regis = [[RegistViewController alloc]init];
    [self.navigationController pushViewController:regis animated:YES];
    
    
}
//忘记密码的点击事件

-(void)forget
{
    NSLog(@"忘记密码");
    
    [self.userPassWordTextField resignFirstResponder];
    [self.userNameTextField resignFirstResponder];

    //设置时间
    [UIView setAnimationDuration:0.5f];
    self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    self.view.transform = CGAffineTransformScale(self.view.transform, 1.01, 1.01);
    [UIView commitAnimations];
    

    
    ForgetViewController *forget = [[ForgetViewController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
    
    
    
    
    
}
-(void)share:(UIButton *)share
{
    //1.定制分享的内容
    NSString* path = [[NSBundle mainBundle]pathForResource:@"fdssfsf" ofType:@"jpg"];
    id<ISSContent> publishContent = [ShareSDK content:@"Hello,nichewoche.com" defaultContent:nil image:[ShareSDK imageWithPath:path] title:@"This is title" url:@"http://nichewoche.com" description:@"This is description" mediaType:SSPublishContentMediaTypeNews];
    
    
    NSArray *shareList = [ShareSDK customShareListWithType:
                          SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),SHARE_TYPE_NUMBER(ShareTypeQQ),SHARE_TYPE_NUMBER(ShareTypeWeixiTimeline),nil];
    
    //2.调用分享菜单分享
    [ShareSDK showShareActionSheet:nil shareList:shareList content:publishContent statusBarTips:YES authOptions:nil shareOptions:nil result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
        //如果分享成功
        
    
      
        
        
        if (state == SSResponseStateSuccess) {
            NSLog(@"分享成功");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"分享成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        //如果分享失败
        if (state == SSResponseStateFail) {
            NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"分享失败，请看日记错误描述" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        if (state == SSResponseStateCancel){
            NSLog(@"分享取消");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"进入了分享取消状态" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];

}
-(void)login:(UITapGestureRecognizer *)sent
{
    UIImageView *image = (UIImageView *)sent.view;
        if (image.tag == 101) {
        NSLog(@"QQ登录");
            id<ISSQZoneApp> app =(id<ISSQZoneApp>)[ShareSDK getClientWithType:ShareTypeQQSpace];
           
                [app setIsAllowWebAuthorize:YES];
                   [ShareSDK getUserInfoWithType:ShareTypeQQSpace authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
            if (result) {
                NSLog(@"授权登陆成功，已获取用户信息");
                NSString *uid = [userInfo uid];
                NSString *nickname = [userInfo nickname];
                NSString *profileImage = [userInfo profileImage];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:[NSString stringWithFormat:@"授权登陆成功,用户ID:%@,昵称:%@,头像:%@",uid,nickname,profileImage] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                NSLog(@"source:%@",[userInfo sourceData]);
                NSLog(@"uid:%@",[userInfo uid]);
                
                
            }else{
                NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"授权失败，请看日记错误描述" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];

        
    }else if (image.tag == 102){
        
        NSLog(@"微信登录");
        [ShareSDK getUserInfoWithType:ShareTypeWeixiSession authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
            if (result) {
                NSLog(@"授权登陆成功，已获取用户信息");
                NSString *uid = [userInfo uid];
                NSString *nickname = [userInfo nickname];
                NSString *profileImage = [userInfo profileImage];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:[NSString stringWithFormat:@"授权登陆成功,用户ID:%@,昵称:%@,头像:%@",uid,nickname,profileImage] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                NSLog(@"source:%@",[userInfo sourceData]);
                NSLog(@"uid:%@",[userInfo uid]);
                
                
            }else{
                NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"授权失败，请看日记错误描述" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];

        
    }else if (image.tag == 103){
        
        NSLog(@"微博登录");
        id<ISSQZoneApp> app =(id<ISSQZoneApp>)[ShareSDK getClientWithType:ShareTypeQQSpace];
        [app setIsAllowWebAuthorize:YES];
        
        [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
            if (result) {
                NSLog(@"授权登陆成功，已获取用户信息");
                NSString *uid = [userInfo uid];
                NSString *nickname = [userInfo nickname];
                NSString *profileImage = [userInfo profileImage];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:[NSString stringWithFormat:@"授权登陆成功,用户ID:%@,昵称:%@,头像:%@",uid,nickname,profileImage] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                NSLog(@"source:%@",[userInfo sourceData]);
                NSLog(@"uid:%@",[userInfo uid]);
            }else{
            
                NSLog(@"分享失败,错误码:%ld,错误描述%@",(long)[error errorCode],[error errorDescription]);
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Code4App" message:@"授权失败，请看日记错误描述" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }];

        
    }
    
    
}

-(void)pop
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
