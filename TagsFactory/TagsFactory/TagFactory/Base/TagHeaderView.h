//
//  TagHeaderView.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagDatasource.h"

@interface TagHeaderView : UICollectionReusableView

@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) UIButton *corperationButton;
@property (strong, nonatomic) UIButton *nativeButton;
@property (strong, nonatomic) UIView *bottomLine;

@property SelectTagCategory selectTagCategory;

// 配置UI
- (void)configUI;
- (void)configContainerView;
- (void)configCorperationButton;
- (void)configNativeButton;
- (void)configBottomLine;

// Button点击
- (void)subcriptButtonClicked:(UIButton *)sender;
- (void)performTagCategorySelected:(UIButton *)sender;

@end
