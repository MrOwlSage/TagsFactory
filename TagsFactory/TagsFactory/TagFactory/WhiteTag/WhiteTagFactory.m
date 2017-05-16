//
//  WhiteTagFactory.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "WhiteTagFactory.h"

NSString * const kWhiteTagHeaderIdentifier = @"WhiteHeaderView";
NSString * const kWhiteTagCellIdentifier = @"WhiteTagCell";

@implementation WhiteTagFactory

+ (WhiteTagFactory *)shareInstance {
    static WhiteTagFactory *whiteTagFactory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        whiteTagFactory = [[WhiteTagFactory alloc] init];
    });
    
    return whiteTagFactory;
}

- (TagHeaderView *)createHeaderViewForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath andSelectSuscriptCategory:(SelectTagCategory)selectTagCategory {
    TagHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([WhiteTagHeaderView class]) forIndexPath:indexPath];
    headerView.selectTagCategory = selectTagCategory;
    
    return headerView;
}

- (TagCell *)createTagCellForCollectionView:(UICollectionView *)collectionView withIndexPath:(NSIndexPath *)indexPath {
    
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WhiteTagCell class]) forIndexPath:indexPath];
    
    return cell;
}

- (TagDatasource *)createDatasourceForCollectionView:(UICollectionView *)collectionView {
    return [[WhiteTagDatasource alloc] initWithCollectionView:collectionView andFactory:self];
}

- (UICollectionViewFlowLayout *)createFlowLayoutForCollectionViewBounds:(CGRect)rect {
    return (UICollectionViewFlowLayout *)[[WhiteTagLayout alloc] initWithCollectionViewBounds:rect];
}

- (Class)tagCellClass {
    return [WhiteTagCell class];
}

- (Class)tagHeaderViewClass {
    return [WhiteTagHeaderView class];
}

@end
