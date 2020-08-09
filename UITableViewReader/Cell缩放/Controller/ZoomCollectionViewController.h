//
//  ZoomCollectionViewController.h
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//
/**
 该控制器的缩放方式是：
 在cell中添加子控件，这个控件是UIScrollView,然后在在UIScrollView中添加一个UIImageView，
 对这个UIImageView进行缩放操作，整个缩放控制是在cell中进行的

 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZoomCollectionViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
