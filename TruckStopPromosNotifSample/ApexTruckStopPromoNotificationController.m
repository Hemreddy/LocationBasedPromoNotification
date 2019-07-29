//
//  ApexTruckStopPromoNotificationController.m
//  TruckStopPromosNotifSample
//
//  Created by Hemareddy Halli on 1/23/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import "ApexTruckStopPromoNotificationController.h"
#import "ApexBaseDTO.h"
#import "ApexConstants.h"
#import "ApexProfileRequestResponseHandler.h"
#import "ApexLoginRequestResponseHandler.h"
#import "ApexTruckStopPromosRequestResponseHandler.h"
#import "NSString+URLEncoding.h"
#import "ApexFuelStation.h"
#import "ApexStringToRelativeDate.h"
#import "ApexLoginResponse.h"
#import "AppDelegate.h"
typedef enum
{
    eTruckStopPromosRequestType = 6555,
    eLoginRequestType,
    eProfileRequestType,
    
}ApexTruckStopPromoRequestType;

typedef enum
{
    eForegroundTruckStopFetch,
    eBackgroundTruckStopFetch,
    eNone
}ApexTruckStopFetchType;

@interface ApexTruckStopPromoNotificationController()

@end

@implementation ApexTruckStopPromoNotificationController
{
    ApexTruckStopPromoRequestType truckStopPromoRequestType;
}

#pragma mark Shared Method
+ (ApexTruckStopPromoNotificationController *)sharedApexTruckStopPromoNotificationManager
{
    static ApexTruckStopPromoNotificationController *sharedApexTruckStopPromoNotificationControllerSingleton = nil;
    
    @synchronized(self)
    {
        if (!sharedApexTruckStopPromoNotificationControllerSingleton)
            sharedApexTruckStopPromoNotificationControllerSingleton = [[ApexTruckStopPromoNotificationController alloc] init];
        
    }
    return sharedApexTruckStopPromoNotificationControllerSingleton;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        locationManager = [[CLLocationManager alloc] init];
        if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [locationManager requestAlwaysAuthorization]; //or requestWhenInUseAuthorization
        }
        locationManager.pausesLocationUpdatesAutomatically = YES;
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation; // kCLLocationAccuracyHundredMeters;
        
        locationManager.distanceFilter = kCLDistanceFilterNone;
    }
    return self;
}
#pragma mark ends

#pragma mark Start/Stop Background Truck Stop Promo set up

-(void)startBackgroundActivityForTruckStopPomos
{
    [self startSignificantLocationChangesMonitor];
    [self startTruckStopPromoDetailInBackground];
}

-(void)stopBackgroundActivityForTruckStopPomos
{
    [self stopSignificantLocationChangesMonitor];
    [self stopTruckStopPromoDetailInBackground];
    [self stopMonitoringAllRegions];
}

#pragma mark ends

#pragma mark Location enable/Disable methods

-(void)startSignificantLocationChangesMonitor
{
    if ([kUserDefaults objectForKey:kUsername] && [kUserDefaults objectForKey:kPassword] && [[kUserDefaults objectForKey:kPermissionIntegratedServiceFuelDiscount] boolValue] )
    {
        [locationManager startMonitoringSignificantLocationChanges];
    }
}

-(void)stopSignificantLocationChangesMonitor
{
    [locationManager stopMonitoringSignificantLocationChanges];
}
#pragma mark ends
#pragma mark Setup Region tracking

- (void)stopMonitoringAllRegions
{
    DEBUGLOG(@"About to stop monitoring for %lu regions", (unsigned long)[locationManager monitoredRegions].count);
    
    // stop monitoring for any and all current regions
    for (CLRegion *region in [[locationManager monitoredRegions] allObjects]) {
        [locationManager stopMonitoringForRegion:region];
    }
    
    DEBUGLOG(@"After stopping, we're currently monitoring for %lu regions", (unsigned long)[locationManager monitoredRegions].count);
}


-(void)HandleDataWithDictionary:(NSDictionary*)inDataDictionary
{
    if (mTruckStopPromosList != nil)
    {
        [mTruckStopPromosList removeAllObjects];
        mTruckStopPromosList = nil;
    }
    mTruckStopPromosList = [[NSMutableArray alloc] init];
    
    NSArray *stationArray = (NSArray*)[inDataDictionary objectForKey:kWebserviceTruckStopsWithCapitalS];
    
    for(int index=0; index<[stationArray count]; index++)
    {
        NSDictionary *fuelDictionary = (NSDictionary*)[stationArray objectAtIndex:index];
        ApexFuelStation *fuelStation = [[ApexFuelStation alloc] init];
        [fuelStation setAddress:[fuelDictionary objectForKey:kWebserviceAddress]];
        [fuelStation setApexPreice:[fuelDictionary objectForKey:kWebserviceApexPrice]];
        [fuelStation setAtm:[[fuelDictionary objectForKey:kWebserviceATM] boolValue]];
        [fuelStation setChain:[fuelDictionary objectForKey:kWebserviceChain]];
        [fuelStation setCity:[fuelDictionary objectForKey:kWebServiceCity]];
        [fuelStation setDistance:[fuelDictionary objectForKey:kWebserviceDistance]];
        [fuelStation setEffectiveDate:[fuelDictionary objectForKey:kWebserviceEffectiveDate]];
        [fuelStation setFuelFinderId:[fuelDictionary objectForKey:kWebserviceFuelStationID]];
        [fuelStation setInNetwork:[[fuelDictionary objectForKey:kWebserviceinNetwork] boolValue]];
        [fuelStation setLatitude:[fuelDictionary objectForKey:kWebserviceLatitude]];
        [fuelStation setLogitude:[fuelDictionary objectForKey:kWebserviceLongitude]];
        [fuelStation setLocation:[fuelDictionary objectForKey:kWebserviceLocation]];
        [fuelStation setMinnorRepairs:[[fuelDictionary objectForKey:kWebserviceMinorRepairs] boolValue]];
        [fuelStation setName:[fuelDictionary objectForKey:kWebServiceName]];
        [fuelStation setPhone:[fuelDictionary objectForKey:kWebServicePhoneNumber]];
        [fuelStation setPosted:[fuelDictionary objectForKey:kWebservicePosted]];
        [fuelStation setRestaurants:[[fuelDictionary objectForKey:kWebserviceRestaurants] boolValue]];
        [fuelStation setRetailPrice:[fuelDictionary objectForKey:kWebserviceRetailPrice]];
        [fuelStation setScales:[[fuelDictionary objectForKey:kWebserviceScales] boolValue]];
        [fuelStation setShowers:[[fuelDictionary objectForKey:kWebserviceShowers] boolValue]];
        [fuelStation setSignName:[fuelDictionary objectForKey:kWebserviceSignName]];
        [fuelStation setState:[fuelDictionary objectForKey:kWebServiceState]];
        [fuelStation setStateFuelTax:[fuelDictionary objectForKey:kWebserviceStateFuelTax]];
        [fuelStation setTireRepair:[[fuelDictionary objectForKey:kWebserviceTireRepair] boolValue]];
        fuelStation.promotionDate = [ApexStringToRelativeDate stringToDate:[inDataDictionary objectForKey:kPromotionDate]];
        [mTruckStopPromosList addObject:fuelStation];
        fuelStation = nil;
    }
}


-(void)startRegionMonitorByparsingResponseWithData:(NSData *)inData
{
    NSError *jsonParserError = nil;
    NSDictionary *resDictionary = [NSJSONSerialization JSONObjectWithData:inData
                                                                  options:0
                                                                    error:&jsonParserError];
    
    DEBUGLOG(@"Response data :%@",[resDictionary description]);
    [self HandleDataWithDictionary:resDictionary];
    [self startRegionMonitoring];
}

-(void)startRegionMonitoring
{
    [self stopMonitoringAllRegions];
    mRegionList = [[NSMutableArray alloc] init];
    
    if ([CLLocationManager locationServicesEnabled])
    {
        if (nil == locationManager)
        {
            locationManager = [[CLLocationManager alloc] init];
            
            
            if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
            {
                [locationManager requestAlwaysAuthorization]; //or requestWhenInUseAuthorization
            }
            locationManager.pausesLocationUpdatesAutomatically = YES;
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation; // kCLLocationAccuracyHundredMeters;
            
            locationManager.distanceFilter = kCLDistanceFilterNone;
        }
        
        
        for (int index = 0;  index < [mTruckStopPromosList count]; index++)
        {
            ApexFuelStation *fuelStation = [mTruckStopPromosList objectAtIndex:index];
            CLLocationCoordinate2D theLocationCenter = CLLocationCoordinate2DMake([fuelStation.latitude doubleValue],[fuelStation.logitude doubleValue]);
            CLCircularRegion *theRegion = [[CLCircularRegion alloc] initWithCenter:theLocationCenter radius:20.00f identifier:fuelStation.name];
            theRegion.notifyOnExit = NO;
            fuelStation.region = theRegion;
            [mRegionList addObject:theRegion];
            
            if ( [locationManager.location distanceFromLocation:[[CLLocation alloc] initWithLatitude:[fuelStation.latitude doubleValue] longitude:[fuelStation.logitude doubleValue]]])
            {
                [self handleTruckStopAtIndex:index andRegion:theRegion];
            }
            else
            {
                [locationManager requestStateForRegion:theRegion];
                [locationManager startMonitoringForRegion:theRegion];
            }
        }
    }
}

#pragma mark ends

#pragma mark background fetch Truckstops

-(void)startTruckStopPromoDetailInBackground
{
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
}

-(void)stopTruckStopPromoDetailInBackground
{
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalNever];
}

-(void)onPermissionFetchTruckStopPromoInBackground:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    if ([kUserDefaults objectForKey:kUsername] && [kUserDefaults objectForKey:kPassword] && [[kUserDefaults objectForKey:kPermissionIntegratedServiceFuelDiscount ] boolValue] )
    {
        [self requestToFetchTruckStopPromoInBackgroundModeBySession:completionHandler];
    }
    else
    {
        completionHandler(UIBackgroundFetchResultNoData);
    }
}

-(void)requestToFetchTruckStopPromoInBackgroundModeBySession:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    NSString *aRequestString = [NSString stringWithFormat:@"%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID]];
    NSString *requestURLString = [NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,kTruckStopPromosWebService,aRequestString];
    DEBUGLOG(@"**********************************");
    DEBUGLOG(@"Truck Stop Fetch URL :%@",requestURLString);
    NSURL *url = [NSURL URLWithString:requestURLString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completionHandler(UIBackgroundFetchResultFailed);
            return;
        }
        
        BOOL foundNewData;
        NSError *jsonParserError = nil;

        NSDictionary *resDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:&jsonParserError];
        if([[resDictionary valueForKey:kLoginRequired] boolValue])
        {
            DEBUGLOG(@"**********************************");
            DEBUGLOG(@"Session is expired");
            NSString *theReqStr = [NSString stringWithFormat:@"%@=%@&%@=%@&version=1.0",kWebServiceUsername,[kUserDefaults valueForKey:kUsername],kWebServicePassword,[kUserDefaults valueForKey:kPassword]];
            theReqStr= [NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,kLoginWebservice,theReqStr];
            DEBUGLOG(@"Login URL :%@",theReqStr);
            NSURL *loginURL = [NSURL URLWithString:theReqStr];
            NSURLSessionTask *task1 = [session dataTaskWithURL:loginURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                if (error)
                {
                    DEBUGLOG(@"error on login call");
                    completionHandler(UIBackgroundFetchResultFailed);
                    return;
                }
                
                NSError *jsonParserError1 = nil;
                
                NSDictionary *loginDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                              options:0
                                                                                error:&jsonParserError1];
                NSString *theSessionID = [loginDictionary objectForKey:kWebServiceSessionID];
                NSString *theEscapeSessionID = [theSessionID urlEncodeUsingEncoding:NSUTF8StringEncoding];
                [kUserDefaults setObject:theEscapeSessionID forKey:kSessionID];
                [kUserDefaults synchronize];
                DEBUGLOG(@"**********************************");
                DEBUGLOG(@"New Sessionid :%@",theSessionID);
                DEBUGLOG(@"Called Set Profile id");
                NSString *theReqStr = [NSString stringWithFormat:@"%@=%@&%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID],kWebServiceProfileID,[kUserDefaults objectForKey:kProfileId]];
                theReqStr = [NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,kGetProfileDetailWebservice,theReqStr];
                DEBUGLOG(@"Profile URL :%@",theReqStr);
                NSURL *theProfileURL = [NSURL URLWithString:theReqStr];

                NSURLSessionTask *task2 = [session dataTaskWithURL:theProfileURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    if (error) {
                        DEBUGLOG(@"error on profile call");
                        completionHandler(UIBackgroundFetchResultFailed);
                        return;
                    }
                    
                    NSError *jsonParserError2 = nil;
                    
                    NSDictionary *resDictionary2 = [NSJSONSerialization JSONObjectWithData:data
                                                                                   options:0
                                                                                     error:&jsonParserError2];
                    if (resDictionary2)
                    {
                        NSString *aRequestString = [NSString stringWithFormat:@"%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID]];
                        NSString *requestURLString = [NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,kTruckStopPromosWebService,aRequestString];
                        DEBUGLOG(@"**********************************");
                        DEBUGLOG(@"Truck Stop Fetch URL :%@",requestURLString);
                        NSURL *truckstopurl = [NSURL URLWithString:requestURLString];
                        NSURLSession *session = [NSURLSession sharedSession];
                        NSURLSessionTask *task3 = [session dataTaskWithURL:truckstopurl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                            if (error) {
                                completionHandler(UIBackgroundFetchResultFailed);
                                return;
                            }
                            
                            BOOL foundNewData;
                            NSError *jsonParserError = nil;
                            
                            NSDictionary *resDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                          options:0
                                                                                            error:&jsonParserError];
                            if([[resDictionary valueForKey:kLoginRequired] boolValue])
                            {
                                completionHandler(UIBackgroundFetchResultNoData);
                            }
                            else
                            {
                                DEBUGLOG(@"**********************************");
                                DEBUGLOG(@"New Valid Session");
                                [self startRegionMonitorByparsingResponseWithData:data];
                            }
                            
                            if (foundNewData) {
                                completionHandler(UIBackgroundFetchResultNewData);
                            } else {
                                completionHandler(UIBackgroundFetchResultNoData);
                            }
                        }];
                        
                        [task3 resume];
                    }
                    
                }];
                [task2 resume];

            }];
            [task1 resume];
        }
        else
        {
            DEBUGLOG(@"**********************************");
            DEBUGLOG(@"Session is valid");
            [self startRegionMonitorByparsingResponseWithData:data];
        }
        
        if (foundNewData) {
            completionHandler(UIBackgroundFetchResultNewData);
        } else {
            completionHandler(UIBackgroundFetchResultNoData);
        }
    }];
    
    [task resume];
}

-(void)requestToFetchTruckStopPromoInBackgroundMode
{
    DEBUGLOG(@"APEX- requestAdinBackgroundMode begin");
    if(_backgroundTask==UIBackgroundTaskInvalid)
    {
        DEBUGLOG(@"APEX- requestAdinBackgroundMode begin dispatcher");
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            DEBUGLOG(@"APEX- passed dispatcher");
            [self beginBackgroundUpdateTask];
            [self backgroundTruckStopFetch];
            
            [self endBackgroundUpdateTask];
        });
    }
}


- (void) beginBackgroundUpdateTask
{
    DEBUGLOG(@"APEX- requestAdinBackgroundMode begin");
    _backgroundTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

- (void) endBackgroundUpdateTask
{
    DEBUGLOG(@"APEX- End background task");
    [[UIApplication sharedApplication] endBackgroundTask: _backgroundTask];
    _backgroundTask = UIBackgroundTaskInvalid;
}


-(void)backgroundlogin
{
    NSString *theReqStr = [NSString stringWithFormat:@"%@=%@&%@=%@&version=1.0",kWebServiceUsername,[kUserDefaults valueForKey:kUsername],kWebServicePassword,[kUserDefaults valueForKey:kPassword]];
    theReqStr= [NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,kLoginWebservice,theReqStr];
    DEBUGLOG(@"Login URL :%@",theReqStr);
    NSURL *loginURL = [NSURL URLWithString:theReqStr];
    
    //NSURL *requestURL=[NSURL URLWithString:@"http://echo.jsontest.com/key/value/one/two"];
    if(loginURL)
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:loginURL];
        
        NSURLResponse * response = nil;
        NSError  * error = nil;
        DEBUGLOG(@"APEX- NSURLConnection url: %@",loginURL);
        NSData * responseData = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
        
        if(NSClassFromString(@"NSJSONSerialization"))
        {
            NSError *error = nil;
            id loginDictionary = [NSJSONSerialization
                                 JSONObjectWithData:responseData
                                 options:0
                                 error:&error];
            if(error)
            {
                DEBUGLOG(@"JSON reading error: %@.",[error localizedDescription]);
            }
            else
            {
                
                if(loginDictionary && [loginDictionary isKindOfClass:[NSDictionary class]])
                {
                    NSString *theSessionID = [loginDictionary objectForKey:kWebServiceSessionID];
                    NSString *theEscapeSessionID = [theSessionID urlEncodeUsingEncoding:NSUTF8StringEncoding];
                    [kUserDefaults setObject:theEscapeSessionID forKey:kSessionID];
                    [kUserDefaults synchronize];
                    [self backgroundProfileSet];
                }
            }
        }
    }

}

-(void)backgroundProfileSet
{
    NSString *theReqStr = [NSString stringWithFormat:@"%@=%@&%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID],kWebServiceProfileID,[kUserDefaults objectForKey:kProfileId]];
    theReqStr = [NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,kGetProfileDetailWebservice,theReqStr];
    DEBUGLOG(@"Profile URL :%@",theReqStr);
    NSURL *theProfileURL = [NSURL URLWithString:theReqStr];

    
    //NSURL *requestURL=[NSURL URLWithString:@"http://echo.jsontest.com/key/value/one/two"];
    if(theProfileURL)
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:theProfileURL];
        
        NSURLResponse * response = nil;
        NSError  * error = nil;
        DEBUGLOG(@"APEX- NSURLConnection url: %@",theProfileURL);
        NSData * responseData = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
        
        if(NSClassFromString(@"NSJSONSerialization"))
        {
            NSError *error = nil;
            id responseObject = [NSJSONSerialization
                                 JSONObjectWithData:responseData
                                 options:0
                                 error:&error];
            if(error)
            {
                DEBUGLOG(@"JSON reading error: %@.",[error localizedDescription]);
            }
            else
            {
                if(responseObject && [responseObject isKindOfClass:[NSDictionary class]])
                {
                    [self backgroundTruckStopFetch];
                }
            }
        }
    }
}

-(void)backgroundTruckStopFetch
{
    NSString *aRequestString = [NSString stringWithFormat:@"%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID]];
    NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,kTruckStopPromosWebService,aRequestString]];
    
    if(requestURL)
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
        
        NSURLResponse * response = nil;
        NSError  * error = nil;
        DEBUGLOG(@"APEX- NSURLConnection url: %@",requestURL);
        NSData * responseData = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
        
        if(NSClassFromString(@"NSJSONSerialization"))
        {
            NSError *error = nil;
            id responseObject = [NSJSONSerialization
                                 JSONObjectWithData:responseData
                                 options:0
                                 error:&error];
            if(error)
            {
                DEBUGLOG(@"JSON reading error: %@.",[error localizedDescription]);
            }
            else
            {
                
                if(responseObject && [responseObject isKindOfClass:[NSDictionary class]])
                {
                    if([[responseObject valueForKey:kLoginRequired] boolValue])
                    {
                        [self backgroundlogin];
                    }
                    else
                    {
                        [self startRegionMonitorByparsingResponseWithData:responseData];
                    }
                }
            }
        }
    }
}


#pragma mark ends

#pragma mark Setup Local Notification

-(void)sendLocalNotification:(CLRegion*)inRegion
{
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    notification.fireDate = [[NSDate alloc] initWithTimeIntervalSinceNow:1];
    
    NSMutableDictionary *theNotificationUserInfo = [[NSMutableDictionary alloc] init];
    [theNotificationUserInfo setObject:@"1" forKey:@"pType"];
    [theNotificationUserInfo setObject:@"Hey!! You Show me\n" forKey:@"alert"];
    //[theNotificationUserInfo setObject:fuelStation forKey:@"FuelStation"];
    notification.userInfo = theNotificationUserInfo;
    notification.alertBody = [NSString stringWithFormat:@"Hey!! You Show me\n"];
    
    //notification.soundName = UILocalNotificationDefaultSoundName;
    
    notification.alertAction = @"Data download finished";
    notification.hasAction = YES;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

#pragma mark ends
#pragma mark Handle Notifications

-(void)handlePushNotification:(CLRegion *)region
{
    DEBUGLOG(@"****User info*****");
    int theRegionAtIndex = 0;
    for (ApexFuelStation *fuelStation in mTruckStopPromosList)
    {
        if ([region isEqual:fuelStation.region])
        {
            break;
        }
        theRegionAtIndex++;
    }
    
    if ([mTruckStopPromosList count] > theRegionAtIndex)
    {
        [self handleTruckStopAtIndex:theRegionAtIndex andRegion:region];
    }
}

-(void)handleTruckStopAtIndex:(int)index andRegion:(CLRegion*)region
{
    ApexFuelStation *fuelStation = [mTruckStopPromosList objectAtIndex:index];
    AppDelegate *thedelegate = [UIApplication sharedApplication].delegate;
    
    NSMutableDictionary *theNotificationDict = [[NSMutableDictionary alloc] init];
    [theNotificationDict setObject:[NSNumber numberWithInt:1] forKey:kPID];
    [theNotificationDict setObject:[NSNumber numberWithInt:1] forKey:kPType];
    [theNotificationDict setObject:@"Truck Stop Promos" forKey:kAlert];
    [theNotificationDict setObject:[NSDate date] forKey:kNotificationReceivedDate];
    [theNotificationDict setObject:[NSNumber numberWithBool:NO] forKey:kRemoteNotificationRead];
    [theNotificationDict setObject:fuelStation forKey:kTruckStprPromosDetail];
    [thedelegate addNewNotificationDictionary:theNotificationDict];
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
    {
        [thedelegate createAndAddBannerWithText:@"Truck Stop Promos"];
    }
    else
    {
        [self sendLocalNotification:region];
    }
}

#pragma mark ends

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    DEBUGLOG(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    DEBUGLOG(@"didUpdateToLocation: %@", newLocation);
    //CLLocation *currentLocation = newLocation;
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
    {
        [self fetchTruckStopPromosInForeground];
    }
    else
    {
        [self requestToFetchTruckStopPromoInBackgroundMode];
    }

}

- (void)locationManager:(CLLocationManager *)manager
      didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    if (state ==CLRegionStateInside)
    {
        [self handlePushNotification:region];
    }
}

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region
{
    [self handlePushNotification:region];
    [locationManager stopMonitoringForRegion:region];
}

- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region
{
    [locationManager stopMonitoringForRegion:region];
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    [locationManager stopMonitoringForRegion:region];
    DEBUGLOG(@"monitoringDidFailForRegion :%@",error);
}

#pragma mark ends

#pragma mark web service Delegate methods
-(void)reduceToThreeRegionTEMP
{
    
    NSMutableArray *theArray = [[NSMutableArray alloc] init];
    if ([mTruckStopPromosList count] > 3)
    {
        ApexFuelStation *theStation = [mTruckStopPromosList objectAtIndex:0];
        theStation.latitude = [NSDecimalNumber decimalNumberWithString:@"32.735772"];
        theStation.logitude = [NSDecimalNumber decimalNumberWithString:@"-97.419968"];
        [theArray addObject:theStation];
        
        ApexFuelStation *theStation1 = [mTruckStopPromosList objectAtIndex:1];
        theStation1.latitude = [NSDecimalNumber decimalNumberWithString:@"32.735463"];
        theStation1.logitude = [NSDecimalNumber decimalNumberWithString:@"-97.416297"];
        [theArray addObject:theStation1];
        
        ApexFuelStation *theStation2 = [mTruckStopPromosList objectAtIndex:2];
        theStation2.latitude = [NSDecimalNumber decimalNumberWithString:@"32.736825"];
        theStation2.logitude = [NSDecimalNumber decimalNumberWithString:@"-97.433088"];
        [theArray addObject:theStation2];
    }
    mTruckStopPromosList = theArray;
}

-(void)successWithResponse:(ApexBaseDTO*)inData
{
    
    switch (truckStopPromoRequestType)
    {
        case eTruckStopPromosRequestType:
        {
            ApexFuelStationList *fuelStation = (ApexFuelStationList*)inData;
            if (mTruckStopPromosList)
            {
                [mTruckStopPromosList removeAllObjects];
                mTruckStopPromosList = nil;
            }
            
            mTruckStopPromosList = [[NSMutableArray alloc] initWithArray:fuelStation.fuelStationList];
            //[self reduceToThreeRegionTEMP];
            [self startRegionMonitoring];

            DEBUGLOG(@"Truck Stops: %@", inData);

        }
            break;
        case eLoginRequestType:
        {
            ApexLoginResponse *login = (ApexLoginResponse*)inData;
            NSString *theSessionID = login.sessionID;
            NSString *theEscapeSessionID = [theSessionID urlEncodeUsingEncoding:NSUTF8StringEncoding];
            [kUserDefaults setObject:theEscapeSessionID forKey:kSessionID];
            [self setProfileWithExistingProfileId];
        }
            break;
        case eProfileRequestType:
        {
            [self fetchTruckStopPromosInForeground];
        }
            break;
            
        default:
            break;
    }
}

-(void)failureWithError:(NSError*)inError andErrorDict:(NSDictionary *)errorDict
{
    if ([errorDict objectForKey:kWebServiceActionErrors])
    {
        switch (truckStopPromoRequestType)
        {
            case eTruckStopPromosRequestType:
            {
                if([[errorDict valueForKey:kLoginRequired] boolValue])
                {
                    [self loginWithExistingCredential];
                }

            }
                break;
                
            default:
                break;
        }
    }
}

-(void)failureWithError:(NSError*)inError andErrorString:(NSString*)errorString
{
}


#pragma mark ends

#pragma mark Truck Stop Promo web service method

-(void)fetchTruckStopPromosInForeground
{
    if ([kUserDefaults objectForKey:kUsername] && [kUserDefaults objectForKey:kPassword] && [[kUserDefaults objectForKey:kPermissionIntegratedServiceFuelDiscount ] boolValue] )
    {
        truckStopPromoRequestType = eTruckStopPromosRequestType;
        ApexTruckStopPromosRequestResponseHandler *theApexTruckStopPromosRequestResponseHandler = [[ApexTruckStopPromosRequestResponseHandler alloc] initWithDelegate:self];
        [theApexTruckStopPromosRequestResponseHandler formGetTruckStopPromosRequest];
    }
}

#pragma mark ends

#pragma mark Login web service methods

-(void)setProfileWithExistingProfileId
{
    //[kUserDefaults objectForKey:kProfileId];
    truckStopPromoRequestType = eProfileRequestType;
    ApexProfileRequestResponseHandler *mProfileRequestResponse = [[ApexProfileRequestResponseHandler alloc] initWithDelegate:self];
    [mProfileRequestResponse formProfileDetailRequestAndSend];
}

-(void)loginWithExistingCredential
{
    truckStopPromoRequestType = eLoginRequestType;

    NSMutableDictionary *loginDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                      [kUserDefaults objectForKey:kUsername],kUsername,
                                      [kUserDefaults objectForKey:kPassword],kPassword, nil];
    
    ApexLoginRequestResponseHandler *requestResonseHandler = [[ApexLoginRequestResponseHandler alloc] initWithDelegate:self];
    [requestResonseHandler formLoginRequestandSendWithDictionary:loginDict];
}

#pragma mark ends

#pragma mark Session Delegate methods

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error;
{
    DEBUGLOG(@"Session error :%@",[error description]);
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
{
    DEBUGLOG(@"Session URL");
    completionHandler(NSURLSessionAuthChallengeRejectProtectionSpace,nil);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    DEBUGLOG(@"URLSessionDidFinishEventsForBackgroundURLSession");
}

#pragma mark ends

@end
