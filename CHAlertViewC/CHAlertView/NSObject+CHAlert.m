//
//  NSObject+CHAlert.m
//  CHAlertView
//
//  Created by 郭金涛 on 16/7/20.
//  Copyright © 2016年 速道科技. All rights reserved.
//

#import "NSObject+CHAlert.h"
#import <objc/runtime.h>

@implementation NSObject (CHAlert)
/*
*  @brief 只有确定按钮的提示框
*/
- (void)ch_alertConfimTitle:(NSString *)title message:(NSString *)message
{
 
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:nil cancelBlock:nil otherButtonTitles:@"确定" otherBlock:nil alertType:CHAlertSystemStyle];
}
/**
 *  @brief 只有确定按钮的提示框 并且可以传入type改变样式
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                      style:(CHAlertStyle )style
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:nil cancelBlock:nil otherButtonTitles:@"确定" otherBlock:nil alertType:style];
}
/**
 *  @brief 只有确定按钮的提示框 并且 确定按钮有回调方法
 */

- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void (^)())confim
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:nil cancelBlock:nil otherButtonTitles:@"确定" otherBlock:confim alertType:CHAlertSystemStyle];
}
/**
 *  @brief 只有确定按钮的提示框 并且确定按钮有回调方法 传入type可以改变样式
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void (^)())confim
                      style:(CHAlertStyle )style
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:nil cancelBlock:nil otherButtonTitles:@"确定" otherBlock:confim alertType:style];
}
/**
 *  @brief 只有一个按钮  可以改变按钮文字有回调方法
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimTitle:(nullable NSString *)confimTitle
                confimBlock:(nullable void (^)())confim
{
 
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:nil cancelBlock:nil otherButtonTitles:confimTitle otherBlock:confim alertType:CHAlertSystemStyle];

}
/**
 *  @brief 只有一个按钮  可以改变按钮文字有回调方法  传入type可以改变样式
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimTitle:(nullable NSString *)confimTitle
                confimBlock:(nullable void (^)())confim
                      style:(CHAlertStyle )style
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:nil cancelBlock:nil otherButtonTitles:confimTitle otherBlock:confim alertType:style];
    
}
/**
 *  @brief 有俩个按钮确定与取消 并且确定按钮有回调方法
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void(^)())confimBlock
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:@"取消" cancelBlock:nil otherButtonTitles:@"确定" otherBlock:confimBlock alertType:CHAlertSystemStyle];
}
/**
 *  @brief 有俩个按钮确定与取消 确定按钮有回调方法 可以传入type改变样式
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void(^)())confimBlock
                      style:(CHAlertStyle )style
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:@"取消" cancelBlock:nil otherButtonTitles:@"确定" otherBlock:confimBlock alertType:style];
}
/**
 *  @brief 有俩个按钮确定与取消 确定与取消按钮都有回调方法
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                cancelBlock:(nullable void(^)())cancelBlock
                confimBlock:(nullable void(^)())confimBlock
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:@"取消" cancelBlock:cancelBlock otherButtonTitles:@"确定" otherBlock:confimBlock alertType:CHAlertSystemStyle];
}
/**
 *  @brief 有俩个按钮确定与取消 确定与取消按钮都有回调方法 并且传入type可以改变样式
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                cancelBlock:(nullable void(^)())cancelBlock
                confimBlock:(nullable void(^)())confimBlock
                      style:(CHAlertStyle )style
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:@"取消" cancelBlock:cancelBlock otherButtonTitles:@"确定" otherBlock:confimBlock alertType:style];
}
/**
 *  @brief 有俩个按钮 可以改变按钮文字 俩个按钮都有回调方法
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                cancelBlock:(nullable void(^)())cancelBlock
                confimBlock:(nullable void(^)())confimBlock
          cancelButtonTitle:(nullable NSString *)cancelTitle
          confimButtonTitle:(nullable NSString *)confimTitle
{
  
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:cancelTitle cancelBlock:cancelBlock otherButtonTitles:confimTitle otherBlock:confimBlock alertType:CHAlertSystemStyle];
}
/**
 *  @brief 有俩个按钮 可以改变按钮文字 俩个按钮都有回调方法 并且传入type可以改变样式
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void(^)())confimBlock
                cancelBlock:(nullable void(^)())cancelBlock
          cancelButtonTitle:(nullable NSString *)cancelTitle
          confimButtonTitle:(nullable NSString *)confimTitle
                      style:(CHAlertStyle )style
{
    CHAlertView *alerV = [[CHAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alerV alertWithTitle:title message:message cancelButtonTitle:cancelTitle cancelBlock:cancelBlock otherButtonTitles:confimTitle otherBlock:confimBlock alertType:style];
}
@end
