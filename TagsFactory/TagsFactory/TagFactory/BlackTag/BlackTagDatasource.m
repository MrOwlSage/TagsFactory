//
//  BlackTagDatasource.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/5/6.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "BlackTagDatasource.h"

@implementation BlackTagDatasource

- (void)configCollectionView {
    [super configCollectionView];
    
    self.collectionView.backgroundColor = [UIColor blackColor];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((collectionView.bounds.size.width - 48) / 2, 33);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(18, 15, 18, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 18;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 18;
}

//下面的回调是必须的；
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }
    
    return CGSizeMake(collectionView.bounds.size.width, 40);
}

@end
