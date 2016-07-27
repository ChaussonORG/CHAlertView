//
//  CHAlertView.m
//  CHAlertViewC
//
//  Created by 郭金涛 on 16/7/20.
//  Copyright © 2016年 速道科技. All rights reserved.
//

#import "CHAlertView.h"
#define MEASSAGEHUI  [UIColor colorWithRed:93 / 256.0 green:92 / 256.0 blue:98/ 256.0 alpha:1]
#define MEASSAGEGREEN  [UIColor colorWithRed:18 / 256.0 green:179 / 256.0 blue:201/ 256.0 alpha:1]
#define WECAHTHUI [UIColor colorWithRed:239/ 256.0 green:239 / 256.0 blue:244 / 256.0 alpha:1]

@interface CHAlertView()
@property (nonatomic, strong)UIView *blackView;
@property (nonatomic, strong)UIView *whiteView;

@end
@implementation CHAlertView
- (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(void (^)())cancelBlock otherButtonTitles:(NSString *)otherButtonTitles otherBlock:(void (^)())otherBlock alertType:(CHAlertStyle)alertType
{
    if (cancelBlock) {
        self.cancelBlock = cancelBlock;
    }
    if (otherBlock) {
        self.confirmBlock = otherBlock;
    }
    if (alertType == CHAlertSystemStyle) {
        if ([[[UIDevice currentDevice] systemVersion] integerValue] <= 8) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
            alert.delegate = self;
            [alert show];
        
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                           message:message
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            if (cancelButtonTitle.length > 0) {
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    if (cancelBlock) {
                        cancelBlock();
                    }
                }];
                [alert addAction:cancelAction];
            }
            if (otherButtonTitles.length > 0) {
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    if (otherBlock) {
                        otherBlock();
                    }
                }];
                [alert addAction:okAction];
            }
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        }
    }
    if (alertType == CHAlertCustomStyle) {
        [self showCustomAlerViewWithTitle:title message:message cancelButtonTitle:cancelButtonTitle cancelBlock:cancelBlock otherButtonTitles:otherButtonTitles otherBlock:otherBlock];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        if (self.cancelBlock != nil) {
            self.cancelBlock();
        }
    }
    if (buttonIndex == 1) {
        if (self.confirmBlock != nil) {
            self.confirmBlock();
        }
    }
}
- (void)showCustomAlerViewWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle cancelBlock:(nullable void (^)())cancelBlock otherButtonTitles:(  nullable NSString *)otherButtonTitles otherBlock:(nullable void (^)())otherBlock
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    self.blackView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.blackView.backgroundColor = [UIColor blackColor];
    self.blackView.alpha = 0.4;
    
    self.whiteView = [[UIView alloc] initWithFrame:CGRectMake(30, 0, [UIScreen mainScreen].bounds.size.width - 100, 100)];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    self.whiteView.layer.masksToBounds = YES;
    self.whiteView.layer.cornerRadius = 7;
    self.whiteView.userInteractionEnabled = YES;
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.numberOfLines = 0;
    titleL.lineBreakMode = NSLineBreakByWordWrapping;
    titleL.text = title;
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = [UIColor blackColor];
    [titleL setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.font = [UIFont systemFontOfSize:16];
    CGSize size = [titleL sizeThatFits:CGSizeMake(self.whiteView.frame.size.width - 20, 1000)];
    titleL.frame = CGRectMake(10, 20, self.whiteView.frame.size.width - 20, size.height);

    UILabel *messageL = [[UILabel alloc] init];
    messageL.numberOfLines = 0;
    messageL.lineBreakMode = NSLineBreakByWordWrapping;
    messageL.text = message;
    messageL.textAlignment = NSTextAlignmentCenter;
    messageL.textColor = MEASSAGEHUI;
    messageL.textAlignment = NSTextAlignmentCenter;
    messageL.font = [UIFont systemFontOfSize:13];
    CGSize size1 = [messageL sizeThatFits:CGSizeMake(self.whiteView.frame.size.width - 20, 1000)];
    messageL.frame = CGRectMake(10, 30 + titleL.frame.size.height, self.whiteView.frame.size.width - 20, size1.height);
    
    self.whiteView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, 90 + size1.height + size.height );
    self.whiteView.center = self.blackView.center;
  
    UIButton *cancleButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [cancleButton setTitle:cancelButtonTitle forState:(UIControlStateNormal)];
    [cancleButton setTitleColor:MEASSAGEHUI forState:(UIControlStateNormal)];
    [cancleButton addTarget:self action:@selector(cancleAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *otherButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [otherButton setTitle:otherButtonTitles forState:(UIControlStateNormal)];
    [otherButton setTitleColor:MEASSAGEGREEN forState:(UIControlStateNormal)];
    [otherButton addTarget:self action:@selector(otherAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.whiteView.frame.size.height - 40, self.whiteView.frame.size.width, 1)];
    lineView.backgroundColor = WECAHTHUI;
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(self.whiteView.frame.size.width / 2, self.whiteView.frame.size.height - 40, 1, 40)];
    lineView1.backgroundColor = WECAHTHUI;
    
    if (cancelButtonTitle != nil && otherButtonTitles != nil) {
        cancleButton.frame = CGRectMake(0, self.whiteView.frame.size.height - 40, self.whiteView.frame.size.width / 2, 40);
        otherButton.frame = CGRectMake(self.whiteView.frame.size.width / 2, self.whiteView.frame.size.height - 40, self.whiteView.frame.size.width / 2, 40);
        [self.whiteView addSubview:lineView];
        [self.whiteView addSubview:lineView1];
    }
    if (cancelButtonTitle == nil && otherButtonTitles != nil) {
        otherButton.frame = CGRectMake(0, self.whiteView.frame.size.height - 40, self.whiteView.frame.size.width, 40);
        [self.whiteView addSubview:lineView];
    }
    if (cancelButtonTitle != nil && otherButtonTitles == nil) {
        cancleButton.frame = CGRectMake(0, self.whiteView.frame.size.height - 40, self.whiteView.frame.size.width, 40);
        [self.whiteView addSubview:lineView];
    }
    if (cancelButtonTitle == nil && otherButtonTitles == nil) {
        self.whiteView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, 15 + size1.height + size.height );
        self.whiteView.center = self.blackView.center;
    }
    [self addSubview:self.blackView];
    [self addSubview:self.whiteView];
    [self.whiteView addSubview:titleL];
    [self.whiteView addSubview:messageL];
    [self.whiteView addSubview:cancleButton];
    [self.whiteView addSubview:otherButton];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setDuration:0.3];
    animation.fromValue = [NSNumber numberWithInt:0];
    animation.toValue = [NSNumber numberWithInt:1];
    [self.whiteView.layer addAnimation:animation forKey:@"animation"];
}
- (void)cancleAction
{
    if (self.cancelBlock != nil) {
        self.cancelBlock();
    }
    [self removeFromSuperview];
}
- (void)otherAction
{
    if (self.confirmBlock != nil) {
        self.confirmBlock();
    }
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
