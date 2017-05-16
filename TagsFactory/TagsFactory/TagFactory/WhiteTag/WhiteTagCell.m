//
//  WhiteTagCell.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "WhiteTagCell.h"
#import "UIColor+Hex.h"

NSString * const kWhiteStyleTextColor = @"686868";


@implementation WhiteTagCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configSelfProperty {
    [super configSelfProperty];
    
    self.layer.borderColor = [[UIColor colorWithHexString:kWhiteStyleTextColor] CGColor];
}

- (void)configTagTitleLabel {
    [super configTagTitleLabel];
    
    self.tagTitleLabel.textColor = [UIColor colorWithHexString:kWhiteStyleTextColor];
    self.tagTitleLabel.text = @"hah";
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (!selected) {
        self.tagTitleLabel.textColor = [UIColor colorWithHexString:kWhiteStyleTextColor];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
}


@end
