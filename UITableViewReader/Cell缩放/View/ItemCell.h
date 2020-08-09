//
//  ItemCell.h
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemScrollView.h"


NS_ASSUME_NONNULL_BEGIN

@interface ItemCell : UICollectionViewCell
@property(nonatomic, strong) ItemScrollView *zoomView;
- (void)restZoom;
@end

NS_ASSUME_NONNULL_END
