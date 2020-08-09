//
//  SrcLoad.m
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//

#import "SrcLoad.h"

@implementation SrcLoad

/**
 根据文件夹名称加载bundle中指定文件夹的所有图片
 */
+ (NSArray *)loadBundleImagesWithName:(NSString *)fileName
{
    NSMutableArray *ary = @[].mutableCopy;
    NSString *dirPath = [[NSBundle mainBundle] pathForResource:@"Image" ofType:@"bundle"];
    dirPath = [dirPath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *fileAry = [fileManager contentsOfDirectoryAtPath:dirPath error:nil];
    fileAry = [fileAry sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *name in fileAry) {
        NSString *path = [NSString stringWithFormat:@"file://%@/%@",dirPath,name];
        [ary addObject:path];
//        [ary addObject:[dirPath stringByAppendingPathComponent:name]];
    }
    return ary;
}

+ (NSMutableArray *)allImageURL
{
    NSMutableArray *dataAry = @[].mutableCopy;
    [dataAry addObjectsFromArray:[SrcLoad loadBundleImagesWithName:@"ani1"]];
    [dataAry addObjectsFromArray:[SrcLoad loadBundleImagesWithName:@"ani2"]];
    [dataAry addObjectsFromArray:[SrcLoad loadBundleImagesWithName:@"ani3"]];
    [dataAry addObjectsFromArray:[SrcLoad loadBundleImagesWithName:@"ani4"]];
    [dataAry addObjectsFromArray:[SrcLoad loadBundleImagesWithName:@"ani5"]];
    return dataAry;
}

@end
