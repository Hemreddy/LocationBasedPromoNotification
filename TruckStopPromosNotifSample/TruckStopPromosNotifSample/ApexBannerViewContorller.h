//
//  ApexBannerViewContorller.h
//  ShowTopBannerSample
//
//  Created by Hemareddy Halli on 1/12/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApexBannerViewContorller : UIViewController
{
    NSTimer     *mTimer;
    UILabel     *mTextLabel;
}

-(void)inValidateTimer;
-(void)showBannerWithText:(NSString*)inmessage;
-(void)closeBanner;

@end
