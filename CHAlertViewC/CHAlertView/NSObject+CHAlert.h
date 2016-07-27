//
//  NSObject+CHAlert.h
//  CHAlertView
//
//  Created by 郭金涛 on 16/7/20.
//  Copyright © 2016年 速道科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHAlertView.h"
@interface NSObject (CHAlert)
/*
*  @param title 显示的标题
*  @param message  显示的详细内容
*  @param cancelTitle  左侧按钮的标题
*  @param confimTitle 右侧按钮标题
*  @param cancelBlock  左侧按钮回调方法
*  @param confimBlock 右侧按钮回调方法
*  @brief 只有确定按钮的提示框
*/

- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message;

/**
 *  @brief 有俩个按钮确定与取消 并且确定按钮有回调方法
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void(^)())confimBlock;


/**
 *  @brief 只有确定按钮的提示框 并且可以传入type改变样式
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                      style:(CHAlertStyle )style;



/**
 *  @brief 只有确定按钮的提示框 并且 确定按钮有回调方法
 */

- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void (^)())confim;
/**
 *  @brief 只有确定按钮的提示框 并且确定按钮有回调方法 传入type可以改变样式
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void (^)())confim
                      style:(CHAlertStyle )style;
/**
 *  @brief 只有一个按钮  可以改变按钮文字有回调方法
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimTitle:(nullable NSString *)confimTitle
                confimBlock:(nullable void (^)())confim;
/**
 *  @brief 只有一个按钮  可以改变按钮文字有回调方法  传入type可以改变样式
 */
- (void)ch_alertConfimTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimTitle:(nullable NSString *)confimTitle
                confimBlock:(nullable void (^)())confim
                      style:(CHAlertStyle )style;






/**
 *  @brief 有俩个按钮确定与取消 确定按钮有回调方法 可以传入type改变样式
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void(^)())confimBlock
                      style:(CHAlertStyle )style;
/**
 *  @brief 有俩个按钮确定与取消 确定与取消按钮都有回调方法
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                cancelBlock:(nullable void(^)())cancelBlock
                confimBlock:(nullable void(^)())confimBlock;
/**
 *  @brief 有俩个按钮确定与取消 确定与取消按钮都有回调方法 并且传入type可以改变样式
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                cancelBlock:(nullable void(^)())cancelBlock
                confimBlock:(nullable void(^)())confimBlock
                      style:(CHAlertStyle )style;
/**
 *  @brief 有俩个按钮 可以改变按钮文字 俩个按钮都有回调方法
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                cancelBlock:(nullable void(^)())cancelBlock
                confimBlock:(nullable void(^)())confimBlock
          cancelButtonTitle:(nullable NSString *)cancelTitle
          confimButtonTitle:(nullable NSString *)confimTitle;

/**
 *  @brief 有俩个按钮 可以改变按钮文字 俩个按钮都有回调方法 并且传入type可以改变样式
 */
- (void)ch_alertDialogTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
                confimBlock:(nullable void(^)())confimBlock
                cancelBlock:(nullable void(^)())cancelBlock
          cancelButtonTitle:(nullable NSString *)cancelTitle
          confimButtonTitle:(nullable NSString *)confimTitle
                      style:(CHAlertStyle )style;

@end
