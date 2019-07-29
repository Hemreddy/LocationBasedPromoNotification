//
//  AppDelegate.h
//  TruckStopPromosNotifSample
//
//  Created by Hemareddy Halli on 1/23/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApexTruckStopPromoNotificationController.h"
#import "ApexConstants.h"
#import "ApexBannerViewContorller.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    ApexTruckStopPromoNotificationController *mApexTruckStopPromoNotificationController;
    ApexBannerViewContorller *mApexBannerViewContorller;
    NSMutableArray           *mBannerArray;
}

@property (strong, nonatomic) UIWindow *window;
-(void)createAndAddBannerWithText:(NSString*)intext;
-(void)addNewNotificationDictionary:(NSDictionary*)inDict;
@end

