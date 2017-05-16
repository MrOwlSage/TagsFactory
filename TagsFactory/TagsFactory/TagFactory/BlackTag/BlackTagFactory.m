//
//  BlackTagFactory.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "BlackTagFactory.h"

NSString * const kBlackTagHeaderIdentifier = @"BlackHeaderView";
NSString * const kBlackTagCellIdentifier = @"BlackTagCell";

@implementation BlackTagFactory

+ (BlackTagFactory *)shareInstance {
    static BlackTagFactory *blackTagFactory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        blackTagFactory = [[BlackTagFactory alloc] init];
    });
    
    return blackTagFactory;
}

- (TagHeaderView *)createHeaderViewForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath andSelectSuscriptCategory:(SelectTagCategory)selectTagCategory {
    TagHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([BlackTagHeaderView class]) forIndexPath:indexPath];
    headerView.selectTagCategory = selectTagCategory;
    
    return headerView;
}

- (TagCell *)createTagCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath {
    
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBlackTagCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (TagDatasource *)createDatasourceForCollectionView:(UICollectionView *)collectionView {
    return [[BlackTagDatasource alloc] initWithCollectionView:collectionView andFactory:self];
}

- (UICollectionViewFlowLayout *)createFlowLayoutForCollectionViewBounds:(CGRect)rect {
    return (UICollectionViewFlowLayout *)[[BlackTagLayout alloc] initWithCollectionViewBounds:rect];
}

- (Class)tagCellClass {
    return [BlackTagCell class];
}

- (Class)tagHeaderViewClass {
    return [BlackTagHeaderView class];
}

@end
