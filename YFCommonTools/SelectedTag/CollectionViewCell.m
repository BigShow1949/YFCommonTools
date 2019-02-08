//
//  CollectionViewCell.m
//  CollectionViewSubscriptionLabel
//
//  Created by chenyk on 15/4/24.
//  Copyright (c) 2015年 chenyk. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIColor+Extension_yf.h"
@implementation CollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder: (NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}
- (id)sharedInit {
    [self setup];
    return self;
}

- (void)setup {
    self.titleLabel = [UILabel new];
    self.titleLabel.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    
    self.titleLabel.layer.cornerRadius = 5.0;
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.titleLabel.layer.borderWidth = 1;
    self.titleLabel.layer.masksToBounds = YES;
    self.isSelected = NO;
    [self.contentView addSubview:self.titleLabel];
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (_isSelected) {
        UIColor *redColor = [UIColor colorWithHexString:@"ff3400"];
        self.titleLabel.textColor = redColor;
        self.titleLabel.layer.borderColor = redColor.CGColor;
        
    }else {
        UIColor *grayColor = [UIColor lightGrayColor];
        self.titleLabel.textColor = grayColor;
        self.titleLabel.layer.borderColor = grayColor.CGColor;
    }
}
@end
