//
//  UIImage+Operation.m
//  ClassMoudle
//
//  Created by 神州第一坑 on 2019/7/26.
//

#import "UIImage+Operation.h"

@implementation UIImage (Operation)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
//- (UIColor *)colorAtPoint:(CGPoint )point
//{
//    if (point.x < 0 || point.y < 0) return nil;
//
//    CGImageRef imageRef = self.CGImage;
//    NSUInteger width = CGImageGetWidth(imageRef);
//    NSUInteger height = CGImageGetHeight(imageRef);
//    if (point.x >= width || point.y >= height) return nil;
//
//    unsigned char *rawData = malloc(height * width * 4);
//    if (!rawData) return nil;
//
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    NSUInteger bytesPerPixel = 4;
//    NSUInteger bytesPerRow = bytesPerPixel * width;
//    NSUInteger bitsPerComponent = 8;
//    CGContextRef context = CGBitmapContextCreate(rawData,
//                                                 width,
//                                                 height,
//                                                 bitsPerComponent,
//                                                 bytesPerRow,
//                                                 colorSpace,
//                                                 kCGImageAlphaPremultipliedLast
//                                                 | kCGBitmapByteOrder32Big);
//    if (!context) {
//        CGColorSpaceRelease(colorSpace);
//        free(rawData);
//        return nil;
//    }
//    CGColorSpaceRelease(colorSpace);
//    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
//    CGContextRelease(context);
//
//    int byteIndex = (bytesPerRow * point.y) + point.x * bytesPerPixel;
//    CGFloat red   = (rawData[byteIndex]     * 1.0) / 255.0;
//    CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
//    CGFloat blue  = (rawData[byteIndex + 2] * 1.0) / 255.0;
//    CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;
//
//    UIColor *result = nil;
//    result = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
//    free(rawData);
//    return result;
//}
//- (UIColor *)colorAtPixel:(CGPoint)point
//{
//    // Cancel if point is outside image coordinates
//    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
//        return nil;
//    }
//
//    // Create a 1x1 pixel byte array and bitmap context to draw the pixel into.
//    // Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
//    NSInteger pointX = trunc(point.x);
//    NSInteger pointY = trunc(point.y);
//    CGImageRef cgImage = self.CGImage;
//    NSUInteger width = self.size.width;
//    NSUInteger height = self.size.height;
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    int bytesPerPixel = 4;
//    int bytesPerRow = bytesPerPixel * 1;
//    NSUInteger bitsPerComponent = 8;
//    unsigned char pixelData[4] = { 0, 0, 0, 0 };
//    CGContextRef context = CGBitmapContextCreate(pixelData,
//                                                 1,
//                                                 1,
//                                                 bitsPerComponent,
//                                                 bytesPerRow,
//                                                 colorSpace,
//                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
//    CGColorSpaceRelease(colorSpace);
//    CGContextSetBlendMode(context, kCGBlendModeCopy);
//
//    // Draw the pixel we are interested in onto the bitmap context
//    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
//    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
//    CGContextRelease(context);
//
//    // Convert color values [0..255] to floats [0.0..1.0]
//    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
//    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
//    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
//    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
//    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
//}

//- (BOOL)hasAlphaChannel
//{
//    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
//    return (alpha == kCGImageAlphaFirst ||
//            alpha == kCGImageAlphaLast ||
//            alpha == kCGImageAlphaPremultipliedFirst ||
//            alpha == kCGImageAlphaPremultipliedLast);
//}

//转成黑白图像
//+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage
//{
//    int width = sourceImage.size.width;
//    int height = sourceImage.size.height;
//
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
//    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGImageAlphaNone);
//    CGColorSpaceRelease(colorSpace);
//
//    if (context == NULL) {
//        return nil;
//    }
//
//    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
//    CGImageRef contextRef = CGBitmapContextCreateImage(context);
//    UIImage *grayImage = [UIImage imageWithCGImage:contextRef];
//    CGContextRelease(context);
//    CGImageRelease(contextRef);
//
//    return grayImage;
//}


/*
 
 一种不失真的图片处理方式
 */
-(UIImage*)originImageScaleToSize:(CGSize)size{
    
    //这种处理图片不会失真
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

/*
 图片压缩
 */
- (UIImage *)resetSizeOfImageMaxSize:(NSInteger)maxSize
{
    //先调整分辨率
    CGSize newSize = CGSizeMake(self.size.width, self.size.height);
    
    CGFloat tempHeight = newSize.height / 1024;
    CGFloat tempWidth = newSize.width / 1024;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(self.size.width / tempWidth, self.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(self.size.width / tempHeight, self.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //调整大小
    NSData *imageData = UIImageJPEGRepresentation(newImage,1.0);
    NSUInteger sizeOrigin = [imageData length];
    NSUInteger sizeOriginKB = sizeOrigin / 1024;
    if (sizeOriginKB > maxSize) {
        NSData *finallImageData = UIImageJPEGRepresentation(newImage,0.3);
        return [UIImage imageWithData:finallImageData];
    }
    
    return [UIImage imageWithData:imageData];
}

- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}

- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}
@end
