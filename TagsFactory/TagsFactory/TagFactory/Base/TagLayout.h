//
//  TagLayout.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/5/3.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGRect collectionViewRect;

- (instancetype)initWithCollectionViewBounds:(CGRect)rect;

@end
