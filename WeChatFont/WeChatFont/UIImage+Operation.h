//
//  UIImage+Operation.h
//  ClassMoudle
//
//  Created by 神州第一坑 on 2019/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Operation)

+ (UIImage *)imageWithColor:(UIColor *)color;
//- (UIColor *)colorAtPoint:(CGPoint )point;
//more accurate method ,colorAtPixel 1x1 pixel
//- (UIColor *)colorAtPixel:(CGPoint)point;
//返回该图片是否有透明度通道
//- (BOOL)hasAlphaChannel;

///获得灰度图
//+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

/*
 一种不失真的图片处理方式
 */
-(UIImage*)originImageScaleToSize:(CGSize)size;

/*
 图片压缩
 */
- (UIImage *)resetSizeOfImageMaxSize:(NSInteger)maxSize;


- (UIImage *)fixOrientation:(UIImage *)aImage;
@end

NS_ASSUME_NONNULL_END
