//
//  TagDatasource.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/5/3.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagDatasource.h"
#import "TagFactoryGenerator.h"
#import "BlackTagCell.h"
#import "BlackTagHeaderView.h"
#import "WhiteTagCell.h"
#import "WhiteTagHeaderView.h"

@interface TagDatasource()

@end

@implementation TagDatasource

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView andFactory:(TagFactory *)factory {
    if (self = [self init]) {
        _collectionView = collectionView;
        _tagFactory = factory;
        [self p_configUI];
    }
    
    return self;
}

- (id)init {
    if (self = [super init]) {
    }
    
    return self;
}

#pragma mark - Config UI 
- (void)p_configUI {
    [self configCollectionView];
}

- (void)configCollectionView {
    // regist class for colleciontView
    [self.collectionView registerClass:[self.tagFactory tagCellClass] forCellWithReuseIdentifier:NSStringFromClass([self.tagFactory tagCellClass])];
//    [self.collectionView registerClass:[TagGroupCell class] forCellWithReuseIdentifier:NSStringFromClass([TagGroupCell class])];
    [self.collectionView registerClass:[self.tagFactory tagHeaderViewClass] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([self.tagFactory tagHeaderViewClass])];
        
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        default:
            return self.tags.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TagCell *cell = [self.tagFactory createTagCellForCollectionView:self.collectionView withIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        [cell updateUI:nil];

    } else {
        Tag *tag = self.tags[indexPath.row];
        [cell updateUI:tag];
    }
    
    return cell;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    TagHeaderView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        reusableView = [self.tagFactory createHeaderViewForCollectionView:collectionView withIndexPath:indexPath andSelectSuscriptCategory:self.selectTagCategory];
    }
    return reusableView;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//下面的回调是必须的；
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectTag) {
        if (indexPath.section == 0) {
            self.selectTag(nil);
        } else {
            if (self.tags.count > 0 && self.tags) {
                self.selectTag(self.tags[indexPath.row]);
            }
        }
    }
    
//    [collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    TagCell *cell = (TagCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setSelected:NO];
}

- (void)reloadDataWithTags:(NSArray *)tags category:(int)tagCategory {
    self.tags = tags;
    
    [self.collectionView reloadData];
}

- (BOOL)hasCacheTagsInMemoryForCategory:(int)tagCategory {
    if (tagCategory == NESTagCategoryStyleCorperation) {
        return self.corperationTags != nil;
    } else {
        return self.nativeTags != nil;
    }
}

@end
