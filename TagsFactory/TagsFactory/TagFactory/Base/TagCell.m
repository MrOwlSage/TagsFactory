//
//  TagCell.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagCell.h"
#import "UIColor+Hex.h"
#import "Tag.h"

NSString * const kSelectedColor = @"23b4f3";
NSString * const kSelectedTextColor = @"ffffff";

@interface TagCell()

@end

@implementation TagCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_configUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self p_configUI];
    }
    return self;
}

#pragma mark - Config UI 

- (void)p_configUI {
    [self configSelfProperty];
    [self configTagTitleLabel];

}

- (void)configSelfProperty {
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 1.0;
}

- (void)configTagTitleLabel {
    // create tagTitleLabel
    if (!_tagTitleLabel) {
        _tagTitleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _tagTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.tagTitleLabel];
    }
}

- (void)updateUI:(Tag *)tag {
    if (!tag) {
        self.tagTitleLabel.text = @"无";
    } else {
        self.tagTitleLabel.text = tag.name;
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected) {
        self.backgroundColor = [UIColor colorWithHexString:kSelectedColor];
        self.tagTitleLabel.textColor = [UIColor colorWithHexString:kSelectedTextColor];
        self.layer.borderWidth = 0;
    } else {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 1.0;
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.tag = nil;
    self.tagTitleLabel.text = @"";
    self.contentView.backgroundColor = [UIColor clearColor];
}

@end
