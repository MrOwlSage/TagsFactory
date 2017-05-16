//
//  TagFactoryGenerator.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/27.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TagFactory.h"

@class BlackTagFactory;
@class WhiteTagFactory;

typedef NS_ENUM(NSInteger, NESTagStyle) {
    NESTagStyleWhite = 1,
    NESTagStyleBlack
};

@interface TagFactoryGenerator : NSObject

+ (TagFactory *)generateTagFactoryWithStyle:(NESTagStyle)tagStyle;

@end
