//
//  TagCell.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tag;

@interface TagCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *tagTitleLabel;
@property (strong, nonatomic) Tag *tag;

// 配置UI
- (void)configSelfProperty;
- (void)configTagTitleLabel;

- (void)updateUI:(Tag *)tag;

@end
