//
//  TagFactory.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TagDatasource.h"


@class TagCell;
@class TagHeaderView;
@class TagLayout;
//@class TagDatasource;

@interface TagFactory : NSObject

- (TagCell *)createTagCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath;

- (TagHeaderView *)createHeaderViewForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath andSelectSuscriptCategory:(SelectTagCategory)selectTagCategory;

- (TagDatasource *)createDatasourceForCollectionView:(UICollectionView *)collectionView;

- (UICollectionViewFlowLayout *)createFlowLayoutForCollectionViewBounds:(CGRect)rect;

- (Class)tagCellClass;

- (Class)tagHeaderViewClass;
@end
