//
//  UIButton+LayoutTextImage.h
//  NMButton
//
//  Created by zuopengliu on 20/10/2017.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, UIButtonLayoutStyle) {
    UIButtonLayoutStyleLeftText,
    UIButtonLayoutStyleRightText,
    UIButtonLayoutStyleTopText,
    UIButtonLayoutStyleBottomText,
};

@interface UIButton (LayoutTextImage)

/**
 使用新的样式排版按钮。默认与边框的间距是5.f

 @param newStyle 按钮样式
 @param spacing 图片与文件间距
 */
- (void)layoutForStyle:(UIButtonLayoutStyle)newStyle /** 图片与文字排版样式 */
           withSpacing:(CGFloat)spacing; /** 图片与文件间距 */

- (void)layoutForStyle:(UIButtonLayoutStyle)newStyle /** 图片与文字排版样式 */
           withSpacing:(CGFloat)spacing /** 图片与文件间距 */
                margin:(CGFloat)margin; /** 文字或图片与边框间距离 */

//- (void)layoutForStyle:(UIButtonLayoutStyle)newStyle /** 图片与文字排版样式 */
//           withSpacing:(CGFloat)spacing /** 图片与文件间距 */
//           marginInset:(UIEdgeInsets)marginInset; /** 文字或图片与四个边框的间距 */

@end
