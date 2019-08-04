//
//  FontSize.m
//  WeChatFontSize
//
//  Created by 神州第一坑 on 2019/8/2.
//  Copyright © 2019 FirstKeng. All rights reserved.
//

#import "FontSize.h"

@implementation FontSize
FontSize *f;

+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        f=[[super allocWithZone:NULL]init];
    });
    
    return f;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    return [self shareInstance];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (float)baseScale{
    
    return _baseScale?_baseScale:1;
}
@end
