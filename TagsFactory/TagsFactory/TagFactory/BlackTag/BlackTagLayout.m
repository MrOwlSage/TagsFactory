//
//  BlackTagLayout.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/5/6.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "BlackTagLayout.h"

@implementation BlackTagLayout

- (instancetype)initWithCollectionViewBounds:(CGRect)rect {
    if (self = [super initWithCollectionViewBounds:rect]) {
        self.itemSize = CGSizeMake(100, 32);
        self.headerReferenceSize = CGSizeMake(rect.size.width, 40);
    }
    
    return self;
}


@end
