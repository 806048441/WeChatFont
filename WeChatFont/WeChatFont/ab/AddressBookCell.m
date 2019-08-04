//
//  AddressBookCell.m
//  WeChatFontSize
//
//  Created by 神州第一坑 on 2019/8/2.
//  Copyright © 2019 FirstKeng. All rights reserved.
//

#import "AddressBookCell.h"
@interface AddressBookCell ()

@property (strong,nonatomic)UIImageView * headerImageView;
@property (strong,nonatomic)UILabel * nameLabel;
@property (strong,nonatomic)UILabel * contentLabel;
@end
@implementation AddressBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}
- (void)setup{
    
    
    _headerImageView =[[UIImageView alloc]init];
    _headerImageView.backgroundColor =[UIColor blueColor];
    _nameLabel=[[UILabel alloc]init];
    _nameLabel.text =@"that's a name";
    _contentLabel =[[UILabel alloc]init];
    _contentLabel.text =@"this's a content";
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_contentLabel];
}

- (void)layoutSubviews{
    
    _headerImageView.frame =CGRectMake(10, 10, fit_scale(60), fit_scale(60));
    _nameLabel.frame =CGRectMake(10+10+fit_scale(60), 10, KSCREEN_WIDTH-10-10-10-fit_scale(60), fit_scale(30));
    _nameLabel.font =font_set(fit_scale(16));
    _contentLabel.frame =CGRectMake(10+10+fit_scale(60), 10+fit_scale(30), KSCREEN_WIDTH-10-10-10-fit_scale(60), fit_scale(30));
    _contentLabel.font =font_set(fit_scale(15));
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, fit_scale(60)+10+10, fit_scale(60)+20-0.5);
    CGContextAddLineToPoint(context, KSCREEN_WIDTH, fit_scale(60)+20-0.5);
    CGContextSetLineWidth(context, 0.5);
    [[UIColor redColor] setStroke];
    CGContextDrawPath(context, kCGPathStroke);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
