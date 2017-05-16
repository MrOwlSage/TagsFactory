//
//  TagFactoryGenerator.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/27.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagFactoryGenerator.h"
#import "WhiteTagFactory.h"
#import "BlackTagFactory.h"

@implementation TagFactoryGenerator

+ (TagFactory *)generateTagFactoryWithStyle:(NESTagStyle)tagStyle {
    switch (tagStyle) {
        case NESTagStyleWhite:
            return [WhiteTagFactory shareInstance];
        case NESTagStyleBlack:
            return [BlackTagFactory shareInstance];
        default:
            return nil;
    }
}

@end
