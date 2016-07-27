//
//  CHAlertView.h
//  CHAlertViewC
//
//  Created by 郭金涛 on 16/7/20.
//  Copyright © 2016年 速道科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CHAlertStyle){
    CHAlertSystemStyle,//系统提示框
    CHAlertCustomStyle//自定义提示框
};
@interface CHAlertView : UIView<UIAlertViewDelegate>
/*
 初始化方法,直接调用传入你需要的参数与,blcok为俩个按钮的调用方法
 */
- (void)alertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle cancelBlock:(nullable void (^)())cancelBlock otherButtonTitles:(  nullable NSString *)otherButtonTitles otherBlock:(nullable void (^)())otherBlock alertType:(CHAlertStyle)alertType;
@property(nonatomic, copy, nullable) void (^confirmBlock)();
@property(nonatomic, copy, nullable) void (^cancelBlock)();
@end
