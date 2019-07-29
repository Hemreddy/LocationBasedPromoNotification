//
//  ApexTruckStopPromoNotificationController.h
//  TruckStopPromosNotifSample
//
//  Created by Hemareddy Halli on 1/23/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "ApexFuelStationList.h"
#import "ApexResponseDataDelegate.h"
@interface ApexTruckStopPromoNotificationController : NSObject<CLLocationManagerDelegate,ApexResponseDataDelegate,NSURLSessionDelegate>
{
    NSMutableArray              *mRegionList;
    NSMutableArray              *mTruckStopPromosList;
    UIBackgroundTaskIdentifier  _backgroundTask;
    CLLocationManager           *locationManager;
}

+ (ApexTruckStopPromoNotificationController *)sharedApexTruckStopPromoNotificationManager;
-(void)requestToFetchTruckStopPromoInBackgroundMode;
-(void)fetchTruckStopPromosInForeground;
-(void)onPermissionFetchTruckStopPromoInBackground:(void (^)(UIBackgroundFetchResult result))completionHandler;
-(void)startBackgroundActivityForTruckStopPomos;
-(void)stopBackgroundActivityForTruckStopPomos;
@end
