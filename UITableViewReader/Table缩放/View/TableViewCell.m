//
//  TableViewCell.m
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _zoomImageView = [[UIImageView alloc] init];
//    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_zoomImageView];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (_zoomImageView) {
        frame.origin = CGPointZero;
        frame.size.height -= 8;
        _zoomImageView.frame = frame;
    }
}


@end
