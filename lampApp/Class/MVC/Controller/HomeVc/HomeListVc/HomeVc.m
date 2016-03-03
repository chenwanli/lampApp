//  主页
//  HomeVc.m
//  lampApp
//
//  Created by 冯景安先生 on 15/11/1.
//  Copyright © 2015年 anan. All rights reserved.
//

#import "HomeVc.h"
#import "OperationVC.h"
#import "EquipmentCell.h"
@interface HomeVc ()

@end

@implementation HomeVc

- (void)viewWillAppear:(BOOL)animated{
    if (self.collectionView != nil) {
        NSLog(@"刷新数据");
        self.dataArray = [DataStorage sharedManager].userDataArray;
        
        [self.collectionView reloadData];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_A(39, 40, 43, 1);
    
    UIView *navView = [self setNavigationBarOrSo:@"设备" leftImg:@"barbuttonicon_add" rightImg:@"barbuttonicon_delete"];
    
    UIButton *rightBtn = navView.subviews[2];
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(20, 10, 0, 10);
    
    
    self.dataArray = [DataStorage sharedManager].userDataArray;
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight - 64)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 5;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 10, kDeviceWidth - 40, bgView.height - 10) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [bgView addSubview:self.collectionView];
    
    //    注册
    [self.collectionView registerClass:[EquipmentCell class] forCellWithReuseIdentifier:@"EquipmentCell"];
    
    
//    if (self.dataArray.count == 0) {
//        _equipmentListLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
//        _equipmentListLabel.text = @"尚无添加设备\n请点击左上角按钮搜索周边设备进行添加";
//        _equipmentListLabel.textAlignment = 1;
//        _equipmentListLabel.textColor = [UIColor grayColor];
//        _equipmentListLabel.numberOfLines = 0;
//        [self.view addSubview:_equipmentListLabel];
//    }
    
    OperationVC *operationVC = [[OperationVC alloc]init];
    [self.navigationController pushViewController:operationVC animated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.dataArray.count > 0) {
        _equipmentListLabel.hidden = YES;
    }else{
        _equipmentListLabel.hidden = NO;
    }
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DataStorage *dataStorage = self.dataArray[indexPath.row];
    static NSString *cellIdentifier = @"EquipmentCell";
    EquipmentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.equipmentImg.image = [UIImage imageNamed:@"灯2"];
    cell.nameLable.text = dataStorage.nickname;
    cell.editor = !_editor;
    return cell;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float equipmentImgWidth = (kDeviceWidth - 80) / 3;
    return CGSizeMake(equipmentImgWidth, equipmentImgWidth + 20);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_editor) {
        CWLAlert *alert = [[CWLAlert alloc]initAlertTitle:nil message:@"是否删除该设备" titleBtn:@"取消" otherBtn:@"确定" VC:self];
        alert.delegate = self;
        _delRow = indexPath.row;
    }else{
        OperationVC *operationVC = [[OperationVC alloc]init];
        operationVC.dataStorage = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:operationVC animated:YES];
    }
}

- (void)alertView:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [[DataStorage sharedManager].userDataArray removeObjectAtIndex:_delRow];
        if ([[DataStorage sharedManager].userDataArray count] == 0) {
            _editor = NO;
        }
        [self.collectionView reloadData];
    }
}


- (void)peripheralDevicesVCDelegate{
    [self.collectionView reloadData];
}

- (void)navBtn:(UIButton *)sender{
    if(sender.tag == 0){
        PeripheralDevicesVC *peripheralDevicesVC = [[PeripheralDevicesVC alloc]init];
        peripheralDevicesVC.dategate = self;
        [self.navigationController pushViewController:peripheralDevicesVC animated:YES];
        
    }else{
        _editor = !_editor;
        if (_editor) {
            [sender setTitle:@"取消" forState:UIControlStateNormal];
            [sender setImage:nil forState:UIControlStateNormal];
        }else{
            [sender setTitle:nil forState:UIControlStateNormal];
            [sender setImage:[UIImage imageNamed:@"barbuttonicon_delete"] forState:UIControlStateNormal];
        }
        [self.collectionView reloadData];
    }
}

@end
