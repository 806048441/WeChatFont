//
//  MineViewController.m
//  WeChatFontSize
//
//  Created by 神州第一坑 on 2019/8/2.
//  Copyright © 2019 FirstKeng. All rights reserved.
//

#import "MineViewController.h"
#import "UIImage+Operation.h"
#import <objc/message.h>

#define color_rdm [UIColor colorWithRed:arc4random() %256/256.0 green:arc4random() %256/256.0 blue:arc4random() %256/256.0 alpha:1]

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSArray <NSArray*>*contexts;
    NSArray <NSArray*>*images;
}

@property (strong,nonatomic)UITableView * myTableView;
@end

@implementation MineViewController

#pragma mark - Lifecycle
- (instancetype)init {
    self = [super init];
    if (self){
        
    }
    return self;
}
- (void)dealloc {
    NSLog(@"---%s----",__func__);
}
- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fontReload) name:@"fontReload" object:nil];

    
    self.navigationItem.title =@"我";
    
    contexts =@[@[@"支付"],@[@"收藏",@"相册",@"卡包",@"表情"],@[@"设置"]];
    images =@[@[[self getColorImage]],@[[self getColorImage],[self getColorImage],[self getColorImage],[self getColorImage]],@[[self getColorImage]]];
    
    [self.view addSubview:self.myTableView];
}

#pragma mark - Custom Accessors
- (UITableView*)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate =self;
        _myTableView.dataSource =self;
        _myTableView.estimatedRowHeight=50;
        _myTableView.estimatedSectionFooterHeight=0;
        _myTableView.estimatedSectionHeaderHeight=0;
        [_myTableView setContentInset:UIEdgeInsetsMake(NAVBAR_HEIGHT, 0, TABBAR_HEIGHT, 0)];
        if (@available(iOS 11.0, *)) {
            
            _myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.backgroundColor = [UIColor lightGrayColor];
    }
    return _myTableView;
}
#pragma mark - prvite

- (UIImage*)getColorImage{
    
    return [[UIImage imageWithColor:color_rdm] originImageScaleToSize:CGSizeMake(fit_scale(20), fit_scale(20))];
}
- (void)fontReload{
    
    images =@[@[[self getColorImage]],@[[self getColorImage],[self getColorImage],[self getColorImage],[self getColorImage]],@[[self getColorImage]]];
    [self.myTableView reloadData];
}
#pragma mark - Protocol conformance
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return contexts.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contexts[section].count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.font =font_set(fit_scale(14));
    cell.textLabel.text =contexts[indexPath.section][indexPath.row];
    cell.imageView.image =images[indexPath.section][indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30+fit_scale(20);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section==2) {
        
        [FontSize shareInstance].baseScale =(arc4random()%15+5)/10.0;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"fontReload" object:nil];
        
    }
}





@end
