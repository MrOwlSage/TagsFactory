//
//  TagLayout.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/5/3.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagLayout.h"

@interface TagLayout()

@end

@implementation TagLayout

- (instancetype)initWithCollectionViewBounds:(CGRect)rect {
    if (self = [self init]) {
        _collectionViewRect = rect;
    }
    
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

//- (CGSize)collectionViewContentSize
//{
//    return CGSizeZero;
//}
//
//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    NSMutableArray *layoutAttributes = [NSMutableArray array];
//    
//    return layoutAttributes;
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return nil;
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:kind withIndexPath:indexPath];
//    
//    return attributes;
//}
//
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    return YES;
//}


@end
