//
//  DetectionViewController.m
//  WeChatFontSize
//
//  Created by 神州第一坑 on 2019/8/2.
//  Copyright © 2019 FirstKeng. All rights reserved.
//

#import "DetectionViewController.h"

@interface DetectionViewController ()
{

    UIImageView *hd;
    UILabel*nl;
    UILabel*cl;
}
@end

@implementation DetectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fontReload) name:@"fontReload" object:nil];
    
    self.navigationItem.title =@"发现";

    UIImageView *headerImageView =[[UIImageView alloc]init];
    headerImageView.backgroundColor =[UIColor blueColor];
    hd=headerImageView;
    
    UILabel *label1 =[[UILabel alloc]init];
    label1.text =@"name";
    nl=label1;
    
    UILabel *label2 =[[UILabel alloc]init];
    label2.textColor =[UIColor lightGrayColor];
    label2.text =@"content";
    cl=label2;

    [self.view addSubview:headerImageView];
    [self.view addSubview:label1];
    [self.view addSubview:label2];


}

- (void)viewDidLayoutSubviews{

    hd.frame =CGRectMake(100, 100, fit_scale(80), fit_scale(80));
    nl.frame =CGRectMake(100+fit_scale(80)+10, 100, fit_scale(100), fit_scale(40));
    cl.frame =CGRectMake(100+fit_scale(80)+10, 100+fit_scale(40), fit_scale(100), fit_scale(40));
    nl.font =font_set(fit_scale(25));
    cl.font =font_set(fit_scale(20));
}

- (void)fontReload{
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
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
