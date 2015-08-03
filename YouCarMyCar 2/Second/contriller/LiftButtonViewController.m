//
//  LiftButtonViewController.m
//  YouCarMyCar
//
//  Created by LLY on 15/7/29.
//  Copyright (c) 2015年 LLY. All rights reserved.
//


#define kZwTextViewWidth (self.zwTextView.frame.size.width)
#define kZwTextViewHeight (self.zwTextView.frame.size.height)


#import "LiftButtonViewController.h"
#import "PrefixHeader.pch"
#import "ShiYongTitleTableViewCell.h"
#import "EvaluateTableViewCell.h"
#import "GradeTableViewCell.h"
#import "Evaluate2TableViewCell.h"
#import "TiJiaoTableViewCell.h"
#import "ZWTextView.h"
#import "CWStarRateView.h"
#import "XieYiViewController.h"
#import "XieYiViewController.h"
@interface LiftButtonViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,strong)UITableView *shiYongTableView;
@property (nonatomic,strong)ZWTextView *zwTextView;
@property (nonatomic,strong)UIImageView *zhaoxiangImage;
@property (strong, nonatomic) CWStarRateView *starRateView;
@property (nonatomic)BOOL change;
@property (nonatomic ,strong)EvaluateTableViewCell *myCell;

@end

@implementation LiftButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"试用报告";
    self.view .backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState :(UIControlStateNormal)];
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    
    
    //布局试用报告
    [self layoutshiYongTableView];
    
}

//布局试用报告
-(void)layoutshiYongTableView
{
    self.shiYongTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.shiYongTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.shiYongTableView];
    
    self.shiYongTableView.delegate = self;
    self.shiYongTableView.dataSource = self;
    self.shiYongTableView.backgroundColor = MainBackGround;
    
    
    [self.shiYongTableView registerNib:[UINib nibWithNibName:@"ShiYongTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"shiyongCell"];
    [self.shiYongTableView registerNib:[UINib nibWithNibName:@"EvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"evaluateCell"];
    [self.shiYongTableView registerNib:[UINib nibWithNibName:@"GradeTableViewCell" bundle:nil] forCellReuseIdentifier:@"gradeCell"];
    [self.shiYongTableView registerNib:[UINib nibWithNibName:@"Evaluate2TableViewCell" bundle:nil] forCellReuseIdentifier:@"evaluate2Cell"];
    [self.shiYongTableView registerNib:[UINib nibWithNibName:@"TiJiaoTableViewCell" bundle:nil] forCellReuseIdentifier:@"tijiaoCell"];
    self.zhaoxiangImage = [[UIImageView alloc]initWithFrame:CGRectMake(kMainWidth - 64, 174, 48, 43)];
    self.zhaoxiangImage.image = [UIImage imageNamed: @""];
    
    self.shiYongTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.zhaoxiangImage.userInteractionEnabled = NO;
    [self.shiYongTableView addSubview:self.zhaoxiangImage];
    self.change = YES;

    
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 130;
    }else if (indexPath.row >0 && indexPath.row <5) {
        return 90;
    }else {
        return 50;
    }
}

//cell 的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 5) {
        //        if (self.zwTextView.tag == 101 && [self.zwTextView.text  isEqual: @""]) {
        //            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(kZwTextViewWidth - 60, -20, 60, 20)];
        //            lable.font = [UIFont fontWithName:@"Arial"size:10.0f];
        //            lable.text = @"请对产品外观做出评价";
        //            [self.zwTextView addSubview:lable];
        //            NSLog(@"============================");
        //
        //        }
        XieYiViewController *xiexieVC= [[XieYiViewController alloc]init];
        xiexieVC.k = 1;
        
        [self.navigationController   pushViewController:xiexieVC animated:YES];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 ) {
        ShiYongTitleTableViewCell *cell = [self.shiYongTableView dequeueReusableCellWithIdentifier:@"shiyongCell" forIndexPath:indexPath];
        cell.backgroundColor = MainBackGround;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1) {
        
        EvaluateTableViewCell *cell = [self.shiYongTableView dequeueReusableCellWithIdentifier:@"evaluateCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        self.zwTextView = [[ZWTextView alloc]initWithFrame:CGRectMake(7, 1, kMainWidth /4 *3 - 20, cell.textImage.frame.size.height - 2)];
        self.zwTextView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.zwTextView.layer.borderWidth =1.0;
        cell.textImage.userInteractionEnabled = YES;
        self.zwTextView.placeholder = @"请您写下您使用该产品的美观程度...";
        self.zwTextView.tag = 101;
        [cell.textImage addSubview:self.zwTextView];
        cell.backgroundColor = MainBackGround;
        [cell.zhaoxiangButton addTarget:self action:@selector(zhaoxiang) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
        
    }else if (indexPath.row > 1 && indexPath.row <4) {
        Evaluate2TableViewCell *cell = [self.shiYongTableView dequeueReusableCellWithIdentifier:@"evaluate2Cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.shiyongImage.userInteractionEnabled = YES;
        if (indexPath.row == 2) {
            self.zwTextView = [[ZWTextView alloc]initWithFrame:CGRectMake(7, 1, kMainWidth - 40, cell.shiyongImage.frame.size.height - 2)];
            self.zwTextView.placeholder = @"请您写下您使用该产品的质量问题和建议...";
            self.zwTextView.tag = 102 ;
            [cell.shiyongImage addSubview:self.zwTextView];
        }else{
            cell.shiyongIcon.image = [UIImage imageNamed:@"产品价格.png"];
            cell.shiyongTitle.text = @"产品价格";
            self.zwTextView = [[ZWTextView alloc]initWithFrame:CGRectMake(7, 1, kMainWidth - 40, cell.shiyongImage.frame.size.height - 2)];
            self.zwTextView.placeholder = @"请您写下您使用该产品的价格的满意程度...";
            self.zwTextView.tag = 103;
            [cell.shiyongImage addSubview:self.zwTextView];
        }
        cell.backgroundColor = MainBackGround;
        return cell;
    }else if (indexPath.row == 4){
        GradeTableViewCell *cell = [self.shiYongTableView dequeueReusableCellWithIdentifier:@"gradeCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.xieyiButton addTarget:self action:@selector(xieyi) forControlEvents:(UIControlEventTouchUpInside)];
        self.starRateView = [[CWStarRateView alloc] initWithFrame:CGRectMake(0, 0, cell.xingxingView.frame.size.width-10, 27) numberOfStars:5];
        self.starRateView.scorePercent = 0.3;
        self.starRateView.allowIncompleteStar = YES;
        self.starRateView.hasAnimation = YES;
        cell.xingxingView.backgroundColor = [UIColor clearColor];
        [cell.xingxingView addSubview:self.starRateView];
        cell.backgroundColor = MainBackGround;
        return cell;
        
    }else {
        
        TiJiaoTableViewCell *cell = [self.shiYongTableView dequeueReusableCellWithIdentifier:@"tijiaoCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = MainBackGround;
        return cell;
        
    }
    
    
}

//协议的点击事件
-(void)xieyi
{
    
    XieYiViewController *xieyiVC = [[XieYiViewController alloc]init];
    xieyiVC.k = 2;
    [self.navigationController pushViewController:xieyiVC animated:YES];
    
}




//照相的点击事件
-(void)zhaoxiang
{
    UIAlertController  *view=   [UIAlertController
                                 alertControllerWithTitle:nil
                                 message:nil
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;//设置UIImagePickerController的代理，同时要遵循UIImagePickerControllerDelegate，UINavigationControllerDelegate协议
            picker.allowsEditing = YES;//设置拍照之后图片是否可编辑，如果设置成可编辑的话会在代理方法返回的字典里面多一些键值。PS：如果在调用相机的时候允许照片可编辑，那么用户能编辑的照片的位置并不包括边角。
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;//UIImagePicker选择器的类型，UIImagePickerControllerSourceTypeCamera调用系统相机
            [self presentViewController:picker animated:YES completion:nil];
        }
        else{
            //如果当前设备没有摄像头
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"哎呀，当前设备没有摄像头。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }
        
    }];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController * picker = [[UIImagePickerController alloc]init];
            picker.delegate = self;
            picker.allowsEditing = YES;//是否可以对原图进行编辑
            
            //打开相册选择照片
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:nil];
        }
        else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"图片库不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }
        
        
    }];
    [view addAction:cancelAction];
    [view addAction:deleteAction];
    [view addAction:archiveAction];
    [self presentViewController:view animated:YES completion:nil];
    
    
    
}

//取消选择照片
-(void)cancel:(UIButton *)button
{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;//是否可以对原图进行编辑
        
        //打开相册选择照片
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"图片库不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }
    
}


// 点击图片触发
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"如果允许编辑%@",info);//picker.allowsEditing= YES允许编辑的时候 字典会多一些键值。
    //获取图片
    //    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];//原始图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];//编辑后的图片
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);//把图片存到图片库
        self.zhaoxiangImage.image = image;
    }else{
        self.zhaoxiangImage.image = image;
    }
//    [self.shiYongTableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}



-(void)pop
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
