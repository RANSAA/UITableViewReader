//
//  ItemScrollView.m
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//

#import "ItemScrollView.h"

@implementation ItemScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUIWith:frame];
    }
    return self;
}

- (void)setupUIWith:(CGRect)frame
{
    _zoomImageView = [UIImageView new];
    _zoomImageView.frame = frame;
//    _zoomImageView.contentMode = UIViewContentModeScaleAspectFit;
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;
    _zoomImageView.layer.masksToBounds = YES;
    [self addSubview:_zoomImageView];

     NSLog(@"ItemScrollView frame:%@",NSStringFromCGRect(frame));
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (_zoomImageView) {
        CGRect rect = CGRectZero;
        rect.size = frame.size;
        _zoomImageView.frame = rect;
        NSLog(@"ItemScrollView rect:%@",NSStringFromCGRect(rect));
    }
}

@end
