//
//  AddressBookViewController.m
//  WeChatFontSize
//
//  Created by 神州第一坑 on 2019/8/2.
//  Copyright © 2019 FirstKeng. All rights reserved.
//

#import "AddressBookViewController.h"
#import "AddressBookCell.h"
#import <objc/message.h>
@interface AddressBookViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)UITableView * myTableView;
@end

@implementation AddressBookViewController

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
    
    self.navigationItem.title =@"通讯录";
    
    [self.view addSubview:self.myTableView];
    
//    unsigned count;
//    Method *methodList= class_copyMethodList([UITableViewCell class], &count);
//
//    for (int i=0; i<count; i++) {
//
//        Method method =methodList[i];
//        NSLog(@"%s----%s",method_getName(method),method_copyReturnType(method));
//    }
//    free(methodList);

}
#pragma mark - Custom Accessors

- (UITableView*)myTableView{
    
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate =self;
        _myTableView.dataSource =self;
        _myTableView.estimatedRowHeight=0;
        _myTableView.estimatedSectionFooterHeight=0;
        _myTableView.estimatedSectionHeaderHeight=0;
        [_myTableView setContentInset:UIEdgeInsetsMake(NAVBAR_HEIGHT, 0, TABBAR_HEIGHT, 0)];
        if (@available(iOS 11.0, *)) {
            
            _myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        _myTableView.showsVerticalScrollIndicator = NO;
        [_myTableView registerClass:[AddressBookCell class] forCellReuseIdentifier:@"AddressBookCell"];
        [_myTableView setSeparatorColor:[UIColor redColor]];
        [_myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _myTableView;
}


#pragma mark - Private
- (void)fontReload {
    
    [self.myTableView reloadData];
}
#pragma mark - Protocol conformance
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressBookCell *cell =[tableView dequeueReusableCellWithIdentifier:@"AddressBookCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return fit_scale(60)+20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
