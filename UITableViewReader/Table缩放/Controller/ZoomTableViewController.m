//
//  ZoomTableViewController.m
//  UITableViewReader
//
//  Created by PC on 2020/8/9.
//  Copyright © 2020 PC. All rights reserved.
//

#import "ZoomTableViewController.h"
#import "TableViewCell.h"


#define minScale  1
#define maxScale  5

@interface ZoomTableViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) NSMutableArray *dataAry;
@end

@implementation ZoomTableViewController{
    CGFloat width;
    CGFloat height;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self instansView];
}

- (void)instansView
{
    self.dataAry = @[].mutableCopy;
    [self.dataAry addObjectsFromArray:[SrcLoad allImageURL]];

    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = UIColor.grayColor;
    _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.minimumZoomScale = minScale;
    _scrollView.maximumZoomScale = maxScale;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
//    _scrollView.bouncesZoom = NO; //打开注释回关闭缩小过程
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = self.view.frame.size;


    width  = [UIScreen mainScreen].bounds.size.width/1700;
    height = width*2408;
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.rowHeight = height;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_scrollView addSubview:_tableView];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataAry.count;
}

- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    [cell.zoomImageView sd_setImageWithURL:[NSURL URLWithString:self.dataAry[indexPath.row]]];
    return cell;;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click row:%ld",indexPath.row);
}


#pragma mark UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _tableView;;
}

// 即将开始缩放的时候调用
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2){
    NSLog(@"即将缩放  %s",__func__);
}

// 缩放时调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"缩放中。。。。scale:%f",_scrollView.zoomScale);
    NSLog(@"缩放中。。。。_scrollView contentSize:%@",NSStringFromCGSize(_scrollView.contentSize));
    NSLog(@"缩放中。。。。_tableView frame:%@",NSStringFromCGRect(_tableView.frame));
}

// scale between minimum and maximum. called after any 'bounce' animations缩放完毕的时候调用。
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
//    [_tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
