//
//  TagFactory.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagFactory.h"
#import "TagHeaderView.h"
#import "TagCell.h"

@implementation TagFactory

- (TagCell *)createTagCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (TagHeaderView *)createHeaderViewForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath andSelectSuscriptCategory:(SelectTagCategory)selectTagCategory {
    return nil;
}

- (TagDatasource *)createDatasourceForCollectionView:(UICollectionView *)collectionView {
    return nil;
}

- (UICollectionViewFlowLayout *)createFlowLayoutForCollectionViewBounds:(CGRect)rect {
    return nil;
}

- (Class)tagCellClass {
    return nil;
}

- (Class)tagHeaderViewClass {
    return nil;
}

@end
