//
//  TagHeaderView.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "TagHeaderView.h"
#import "UIColor+Hex.h"

@implementation TagHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self configUI];
    }
    return self;
}

#pragma mark - Config UI 

- (void)configUI {
    [self configContainerView];
    [self configCorperationButton];
    [self configNativeButton];
    [self configBottomLine];
    
    [self subcriptButtonClicked:self.corperationButton];
}

- (void)configContainerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 18, self.frame.size.width, self.frame.size.height-18)];
        [self addSubview:_containerView];
    }
}

- (void)configCorperationButton {
    if (!_corperationButton) {
        _corperationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_corperationButton setTitle:@"Tag1" forState:UIControlStateNormal];
        _corperationButton.frame = CGRectMake(0, 0, _containerView.bounds.size.width/2, _containerView.bounds.size.height);
        [_corperationButton  addTarget:self action:@selector(subcriptButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_containerView addSubview:self.corperationButton];
    }
}

- (void)configNativeButton {
    if (!_nativeButton) {
        _nativeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nativeButton setTitle:@"Tag2" forState:UIControlStateNormal];
        _nativeButton.frame = CGRectMake(_containerView.bounds.size.width/2, 0, _containerView.bounds.size.width/2, _containerView.bounds.size.height);
        [_nativeButton addTarget:self action:@selector(subcriptButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_containerView addSubview:self.nativeButton];
    }
}

- (void)configBottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, _containerView.bounds.size.height-1, _containerView.bounds.size.width, 1)];
        _bottomLine.frame = CGRectMake(0, _containerView.bounds.size.height-1, _containerView.bounds.size.width, 1);
        [_containerView addSubview:self.bottomLine];
    }
}

#pragma mark - Button clicked method

- (void)subcriptButtonClicked:(UIButton *)sender {
    if (sender.selected) {
        return;
    }
}

- (void)performTagCategorySelected:(UIButton *)sender {
    if (self.selectTagCategory) {
        if (sender == self.corperationButton) {
            self.selectTagCategory(NESTagCategoryStyleCorperation);
        } else {
            self.selectTagCategory(NESTagCategoryStyleNative);
        }
    }
}

@end
