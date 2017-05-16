//
//  SetTagView.h
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagFactoryGenerator.h"

@interface SelectTagView : UIView

- (instancetype)initWithFrame:(CGRect)frame andStyle:(NESTagStyle)style;

@property (nonatomic) NESTagStyle style;

- (void)reloadDataWithTag:(NSArray *)tags category:(int)tagCategory;

- (BOOL)hasCacheTagsInMemoryForCategory:(int)tagCatetogry;

- (void)setDatasourceSelectTag:(SelectTag)selectTag andSelectTagCategory:(SelectTagCategory)selectTagCategory;

@end
