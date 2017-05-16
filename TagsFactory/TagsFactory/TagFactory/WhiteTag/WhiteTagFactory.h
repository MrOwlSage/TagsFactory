//
//  WhiteTagFactory.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagFactory.h"
#import "WhiteTagCell.h"
#import "WhiteTagHeaderView.h"
#import "WhiteTagLayout.h"
#import "WhiteTagDatasource.h"

@interface WhiteTagFactory : TagFactory

+ (WhiteTagFactory *)shareInstance;

@end
