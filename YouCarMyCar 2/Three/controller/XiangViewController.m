//
//  XiangViewController.m
//  YouCarMyCar
//
//  Created by ZhaoWei on 15/7/1.
//  Copyright (c) 2015年 LLY. All rights reserved.
//

#import "XiangViewController.h"
#import "TouxiangTableViewCell.h"
#import "TongyongTableViewCell.h"
#import "PrefixHeader.pch"
@interface XiangViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableDictionary *dic;
@property (nonatomic,retain)UIView *myView;
@property (nonatomic,retain)UIImage *myimage;
@property (nonatomic,retain)UIView *viewNM;
@end

@implementation XiangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //布局view
    [self layoutView];
    
    //轻怕手势   老夫到此一游  66666666 
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(remove:)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap1];
    
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setImage:[UIImage imageNamed:@"向左白色箭头.png"] forState:(UIControlStateNormal)];
    
    button.frame =CGRectMake(0, 0, 15, 25);
    [button addTarget:self action:@selector(pop) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIBarButtonItem *lift = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = lift;
    


}
-(void)pop
{
    [self.navigationController  popToRootViewControllerAnimated:YES];
}

-(void)remove:(UITapGestureRecognizer *)tap
{
    [self.myView removeFromSuperview];
}

//布局view
-(void)layoutView
{
    
    self.navigationItem.title = @"个人信息";
    
    self.dic = [[NSMutableDictionary alloc]init];
    NSArray *array1 = [[NSArray alloc]initWithObjects:@"用户名",@"手机号",@"性别",@"地址管理",@"密码服务", nil];
    
    [self.dic  setValue:array1 forKey:@"1"];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TouxiangTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TongyongTableViewCell" bundle:nil] forCellReuseIdentifier:@"tongCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.myimage = [UIImage imageNamed:@"2.png"];
    
    //右item
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame =CGRectMake(0, 0, 45, 25);
    [button setTitle:@"编辑" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(bianji) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
    
    
}

//编辑的点击事件
-(void)bianji
{
    NSLog(@"---------------------编辑---------------------");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
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
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section == 1 || section  ==0) {
//        return 0;
//    }else{
//        return 5;
//    }
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = [self.dic valueForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]];
    
    NSString *str = array[indexPath.row];
    
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        
        TouxiangTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
        cell.photoImage.layer.cornerRadius = cell.photoImage.frame.size.height/2;
        cell.photoImage.layer.masksToBounds = YES;
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        cell.photoImage.image = self.myimage;
        cell.backimage.image = self.myimage;
        
        UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        visualEfView.frame = CGRectMake(cell.backimage.frame.origin.x, cell.backimage.frame.origin.y-2, cell.backimage.frame.size.width, cell.backimage.frame.size.height+2);
        visualEfView.alpha = 1.0;
        [cell.backimage addSubview:visualEfView];
        cell.photoImage.userInteractionEnabled = YES;
        cell.superview.superview.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        //轻怕手势
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(push:)];
        self.view.userInteractionEnabled = YES;
        [cell.photoImage addGestureRecognizer:tap1];
        return cell;
        
        
    }else{
        
        TongyongTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tongCell" forIndexPath:indexPath];;
        //        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.lableText.text = str;
        cell.lableText.textColor = [UIColor colorWithRed:15 / 255.0 green:15/ 255.0  blue:15/ 255.0  alpha:1];
        if (indexPath.section == 1  && indexPath.row < 4) {
            cell.myView.alpha = 1;
        }
        
        return cell;
    }
}

//头像的点击事件
-(void)push:(UITapGestureRecognizer *)tap
{
    self.myView = [[UIView alloc]initWithFrame:CGRectMake(80, 200, 215, 130)];
    [_myView setBackgroundColor:[UIColor colorWithRed:148 green:148 blue:148 alpha:1]];
    _myView.layer.cornerRadius =10;
    //_myView.layer.masksToBounds = 10;
    _myView.clipsToBounds = YES;
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 215, 40)];
    myLabel.backgroundColor = [UIColor grayColor];
    
    myLabel.text = @"设置你的靓照";
    myLabel.textAlignment = NSTextAlignmentCenter;
    [_myView addSubview:myLabel];
    
    UIButton *zhaoBT = [UIButton buttonWithType:UIButtonTypeSystem];
    zhaoBT.frame = CGRectMake(34, 45, 60, 60);
    //[zhaoBT setBackgroundColor:[UIColor grayColor]];
    zhaoBT.layer.cornerRadius = 30;
    [zhaoBT addTarget:self action:@selector(zhaoxiang:) forControlEvents:UIControlEventTouchDown];
    [zhaoBT setBackgroundImage:[UIImage imageNamed:@"20150418072910824_easyicon_net_1024.png"] forState:UIControlStateNormal];
    [_myView addSubview:zhaoBT];
    UILabel *zhaolb = [[UILabel alloc]initWithFrame:CGRectMake(34, 100, 60, 30)];
    zhaolb.text = @"照相";
    zhaolb.font = [UIFont systemFontOfSize:13];
    zhaolb.textAlignment = NSTextAlignmentCenter;
    [_myView addSubview:zhaolb];
    
    UIButton *xiangBT = [UIButton buttonWithType:UIButtonTypeSystem];
    xiangBT.frame = CGRectMake(120, 45, 60, 60);
    [xiangBT setBackgroundImage:[UIImage imageNamed:@"20150418072826995_easyicon_net_1024.png"] forState:UIControlStateNormal];
    // [xiangBT setBackgroundColor:[UIColor grayColor]];
    xiangBT.layer.cornerRadius = 30;
    [xiangBT addTarget:self action:@selector(xiangce:) forControlEvents:UIControlEventTouchDown];
    [_myView addSubview:xiangBT];
    
    UILabel *xianglb = [[UILabel alloc]initWithFrame:CGRectMake(120, 100, 60, 30)];
    xianglb.text = @"相册";
    xianglb.font = [UIFont systemFontOfSize:13];
    xianglb.textAlignment = NSTextAlignmentCenter;
    [_myView addSubview:xianglb];
    
    [self.view addSubview:_myView];
    

}


-(void)zhaoxiang:(UIButton *)button
{
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
    
}
-(void)xiangce:(UIButton *)button
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
    self.viewNM = [[UIView alloc]initWithFrame:CGRectMake(0, 620, 375, 48)];
    
    
    [self.view addSubview:_viewNM];
    UIButton *sureBT = [UIButton buttonWithType:UIButtonTypeSystem];
    sureBT.frame = CGRectMake(184.5, 0, 188.5, 48);
    sureBT.backgroundColor = [UIColor colorWithRed:95/255.0 green:68/255.0 blue:56/255.0 alpha:1];
    [sureBT addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
    sureBT.layer.cornerRadius = 10;
    [_viewNM addSubview:sureBT];
    
    UIButton *cancelBT = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelBT.frame = CGRectMake(5, 0, 173.5, 48);
    cancelBT.backgroundColor = [UIColor colorWithRed:95/255.0 green:68/255.0 blue:56/255.0 alpha:1];
    cancelBT.layer.cornerRadius = 10;
    
    [cancelBT addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [_viewNM addSubview:cancelBT];
    

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(65, 3, 48, 43)];
    [imageView setImage:[UIImage imageNamed:@"cancel.png"]];
    [cancelBT addSubview:imageView];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(65, 3, 48, 43)];
    [imageView2 setImage:[UIImage imageNamed:@"sure.png"]];
    [sureBT addSubview:imageView2];
    
    [self.myView removeFromSuperview];
    
}
//确定选择的照片
-(void)sure:(UIButton *)button
{
    [_viewNM removeFromSuperview];
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
        self.myimage = image;
    }else{
        self.myimage = image;
    }
    [self.tableView  reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
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
