//
//  BlackTagCell.m
//  LiveRecorder
//
//  Created by DoctorGG on 2017/4/26.
//  Copyright © 2017年 NetEase, Inc. All rights reserved.
//

#import "BlackTagCell.h"
#import "UIColor+Hex.h"

NSString * const kBlackStyleTextColor = @"c0c0c0";

@implementation BlackTagCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)configSelfProperty {
    [super configSelfProperty];
    
    self.layer.borderColor = [[UIColor colorWithHexString:kBlackStyleTextColor] CGColor];
}

- (void)configTagTitleLabel {
    [super configTagTitleLabel];
    
    self.tagTitleLabel.textColor = [UIColor colorWithHexString:kBlackStyleTextColor];
    self.tagTitleLabel.text = @"hah";
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (!selected) {
        self.tagTitleLabel.textColor = [UIColor colorWithHexString:kBlackStyleTextColor];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.tagTitleLabel.text = @"";
    self.contentView.backgroundColor = [UIColor clearColor];
}

@end
