//
//  EquipmentCell.h
//  lampApp
//
//  Created by 陈万里 on 15/11/3.
//  Copyright © 2015年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EquipmentCell : UICollectionViewCell{
    UIImageView *_editorImg;
}
@property(nonatomic,strong)UIImageView *equipmentImg;
@property(nonatomic,strong)UILabel *nameLable;
@property(nonatomic,assign)BOOL editor;
@end
