//
//  BlackTagHeaderView.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "BlackTagHeaderView.h"
#import "UIColor+Hex.h"

NSString * const kBlackStyleSelectedColor = @"23b4f3";
NSString * const kBlackStyleUnselectedColor = @"c0c0c0";

@interface BlackTagHeaderView()

@property (strong, nonatomic) UIView *bottomSelectedView;

@end

@implementation BlackTagHeaderView

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
    
    self.containerView.frame = CGRectMake(self.containerView.frame.origin.x, 0, self.containerView.frame.size.width, self.frame.size.height);
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
    [button setTitleColor:[UIColor colorWithHexString:kBlackStyleUnselectedColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:kBlackStyleSelectedColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor colorWithHexString:kBlackStyleSelectedColor] forState:UIControlStateHighlighted];
}

- (void)configBottomLine {
    [super configBottomLine];
    
    self.bottomLine.backgroundColor = [UIColor colorWithHexString:@"3a3a3a"];
}

- (UIView *)bottomSelectedView {
    if (!_bottomSelectedView) {
        _bottomSelectedView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-4, 60, 4)];
        _bottomSelectedView.center = CGPointMake(self.corperationButton.center.x, _bottomSelectedView.center.y);
        _bottomSelectedView.backgroundColor = [UIColor colorWithHexString:kBlackStyleSelectedColor];
        [self addSubview:_bottomSelectedView];
    }
    
    return _bottomSelectedView;
}

#pragma mark Button clicked method

- (void)subcriptButtonClicked:(UIButton *)sender {
    [super subcriptButtonClicked:sender];
    
    [self p_resetTagButtons];
    [self p_changeSelectedButtonStatus:sender];
    [self p_runAnimationForSelectedButton:sender];
    [self performTagCategorySelected:sender];
}

- (void)p_resetTagButtons {
    self.corperationButton.selected = NO;
    self.nativeButton.selected = NO;
}

- (void)p_changeSelectedButtonStatus:(UIButton *)sender {
    sender.selected = YES;
}

- (void)p_runAnimationForSelectedButton:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomSelectedView.center = CGPointMake(sender.center.x, self.bottomSelectedView.center.y);
    }];
}

@end
