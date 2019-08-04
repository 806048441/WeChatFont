//
//  FontSize.h
//  WeChatFontSize
//
//  Created by 神州第一坑 on 2019/8/2.
//  Copyright © 2019 FirstKeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FontSize : NSObject

+(instancetype)shareInstance;
@property (assign,nonatomic)float  baseScale;
@end

NS_ASSUME_NONNULL_END
