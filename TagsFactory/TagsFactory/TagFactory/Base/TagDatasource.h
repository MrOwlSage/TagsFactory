//
//  TagDatasource.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/5/3.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tag.h"

@class TagFactory;

typedef NS_ENUM(NSInteger, NESTagCategoryStyle) {
    NESTagCategoryStyleCorperation = 1,
    NESTagCategoryStyleNative
};

typedef void (^SelectTag)(Tag *tag);
typedef void (^SelectTagCategory)(NESTagCategoryStyle categoryStyle);


@interface TagDatasource : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (weak, nonatomic) TagFactory *tagFactory;
@property (nonatomic, copy) NSArray *corperationTags;
@property (nonatomic, copy) NSArray *nativeTags;
@property (nonatomic, assign) int currentTagCategory;
@property (nonatomic, copy) NSArray *tags;

@property SelectTag selectTag;
@property SelectTagCategory selectTagCategory;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView andFactory:(TagFactory *)factory;

- (void)configCollectionView;

- (void)reloadDataWithTags:(NSArray *)tags category:(int)tagCategory;

- (BOOL)hasCacheTagsInMemoryForCategory:(int)tagCategory;

@end
