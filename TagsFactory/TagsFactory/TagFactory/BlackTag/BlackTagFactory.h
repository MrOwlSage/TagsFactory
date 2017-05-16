//
//  BlackTagFactory.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagFactory.h"
#import "BlackTagCell.h"
#import "BlackTagHeaderView.h"
#import "BlackTagLayout.h"
#import "BlackTagDatasource.h"

@interface BlackTagFactory : TagFactory

+ (BlackTagFactory *)shareInstance;

@end
