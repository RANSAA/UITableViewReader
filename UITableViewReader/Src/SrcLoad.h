//
//  SrcLoad.h
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SrcLoad : NSObject
/**
 根据文件夹名称加载bundle中指定文件夹的所有图片
 */
+ (NSArray *)loadBundleImagesWithName:(NSString *)fileName;


+ (NSMutableArray *)allImageURL;

@end

NS_ASSUME_NONNULL_END
