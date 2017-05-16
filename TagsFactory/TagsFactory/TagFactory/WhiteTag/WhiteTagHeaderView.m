//
//  WhiteTagHeaderView.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "WhiteTagHeaderView.h"
#import "UIColor+Hex.h"

NSString * const kWhiteStyleSelectedColor = @"b93131";
NSString * const kWhiteStyleUnselectedColor = @"555555";

@implementation WhiteTagHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Config UI

- (void)configUI {
    [super configUI];
}

- (void)configContainerView {
    [super configContainerView];
    
    self.containerView.backgroundColor = [UIColor whiteColor];
}

- (void)configCorperationButton {
    [super configCorperationButton];
    
    [self p_configButtonSelectedStatus:self.corperationButton];
}

- (void)configNativeButton {
    [super configNativeButton];
    
    [self p_configButtonSelectedStatus:self.nativeButton];
}

- (void)p_configButtonSelectedStatus:(UIButton *)button {
    [button setTitleColor:[UIColor colorWithHexString:kWhiteStyleUnselectedColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:kWhiteStyleSelectedColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor colorWithHexString:kWhiteStyleSelectedColor] forState:UIControlStateHighlighted];
}

- (void)configBottomLine {
    [super configBottomLine];
    
    self.bottomLine.backgroundColor = [UIColor colorWithHexString:@"f0f0f2"];
}

#pragma mark Button clicked method

- (void)subcriptButtonClicked:(UIButton *)sender {
    [super subcriptButtonClicked:sender];
    
    [self p_resetTagButtons];
    [self p_changeSelectedButtonStatus:sender];
    
    [self performTagCategorySelected:sender];
}

- (void)p_resetTagButtons {
    self.corperationButton.selected = NO;
    self.nativeButton.selected = NO;
    
    self.corperationButton.titleLabel.font = [self unselectedButtonFont];
    self.nativeButton.titleLabel.font = [self unselectedButtonFont];
}

- (UIFont *)unselectedButtonFont {
    return [UIFont systemFontOfSize:15.0f];
}

- (void)p_changeSelectedButtonStatus:(UIButton *)sender {
    sender.selected = YES;
    
    sender.titleLabel.font = [UIFont systemFontOfSize:17.0f];
}


@end
