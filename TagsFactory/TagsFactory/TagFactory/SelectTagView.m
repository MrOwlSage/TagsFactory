//
//  SetTagView.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "SelectTagView.h"
#import "TagFactoryGenerator.h"
#import "TagDatasource.h"
#import "TagLayout.h"
#import "WhiteTagDatasource.h"

@interface SelectTagView()

@property (strong, nonatomic) UICollectionView *mainCollectionView;
@property (strong, nonatomic) TagCell *tagCell;
@property (strong, nonatomic) TagHeaderView *tagHeaderView;

@property (strong, nonatomic) TagFactory *tagFactory;
@property (strong, nonatomic) TagDatasource *tagDatasource;

@end

@implementation SelectTagView

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NESTagStyle)style {
    if (self = [self initWithFrame:frame]) {
        _style = style;
        
        [self p_configUIWithStyle:style];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

#pragma mark - config UI

- (void)p_configUIWithStyle:(NESTagStyle)style {
    self.tagFactory = [TagFactoryGenerator generateTagFactoryWithStyle:style];
    [self p_configCollectionView];
}

- (void)p_configCollectionView {
    [self addSubview:self.mainCollectionView];
    self.mainCollectionView.dataSource = self.tagDatasource;
    self.mainCollectionView.delegate = self.tagDatasource;
}

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *tagLayout = [self.tagFactory createFlowLayoutForCollectionViewBounds:self.bounds];

        _mainCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:tagLayout];
    }
    
    return _mainCollectionView;
}

- (TagDatasource *)tagDatasource {
    if (!_tagDatasource) {
        _tagDatasource = [self.tagFactory createDatasourceForCollectionView:self.mainCollectionView];
    }
    
    return _tagDatasource;
}

- (void)reloadDataWithTag:(NSArray *)tags category:(int)tagCategory {
    [self.tagDatasource reloadDataWithTags:tags category:tagCategory];
}

- (BOOL)hasCacheTagsInMemoryForCategory:(int)tagCatetogry {
    return [self.tagDatasource hasCacheTagsInMemoryForCategory:tagCatetogry];
}

- (void)setDatasourceSelectTag:(SelectTag)selectTag andSelectTagCategory:(SelectTagCategory)selectTagCategory {
    self.tagDatasource.selectTag = selectTag;
    self.tagDatasource.selectTagCategory = selectTagCategory;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
