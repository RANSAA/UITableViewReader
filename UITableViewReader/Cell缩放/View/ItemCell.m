//
//  ItemCell.m
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//

#import "ItemCell.h"

#define minScale  1
#define maxScale  5

@interface ItemCell () <UIScrollViewDelegate>

@end

@implementation ItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super  initWithFrame:frame]) {
        [self setupUIWith:frame];

    }
    return self;
}

- (void)setupUIWith:(CGRect)frame
{
    frame.origin = CGPointZero;
    _zoomView = [[ItemScrollView alloc] initWithFrame:frame];
    _zoomView.backgroundColor = UIColor.grayColor;
    _zoomView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    _zoomView.showsHorizontalScrollIndicator = NO;
    _zoomView.showsVerticalScrollIndicator = NO;
    _zoomView.bounces = NO;
//    _zoomView.bouncesZoom = NO; //打开注释回关闭缩小过程
    _zoomView.minimumZoomScale = minScale;
    _zoomView.maximumZoomScale = maxScale;
    _zoomView.delegate = self;
    [self.contentView addSubview:_zoomView];
    _zoomView.contentSize = frame.size;

}


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (_zoomView) {
        frame.origin = CGPointZero;
        _zoomView.frame = frame;
    }
}

- (void)restZoom
{
    [_zoomView setZoomScale:1.0 animated:YES];
}

#pragma mark UIScrollViewDelegate
//返回需要被缩放的view
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _zoomView.zoomImageView;
}

// 即将开始缩放的时候调用
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2){
    NSLog(@"即将缩放  %s",__func__);
}

// 缩放时调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"缩放中。。。。scale:%f",_zoomView.zoomScale);
    NSLog(@"缩放中。。。。zoomView contentSize:%@",NSStringFromCGSize(_zoomView.contentSize));
    NSLog(@"缩放中。。。。zoomImageView frame:%@",NSStringFromCGRect(_zoomView.zoomImageView.frame));
}



@end
