//
//  AppDelegate.m
//  TruckStopPromosNotifSample
//
//  Created by Hemareddy Halli on 1/23/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import "AppDelegate.h"
#import "NSString+URLEncoding.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - Notification methods

-(void)createAndAddBannerWithText:(NSString*)intext
{
    ApexBannerViewContorller* theApexBannerViewContorller = [[ApexBannerViewContorller alloc] init];
    
    theApexBannerViewContorller.view.frame = CGRectMake(0.0f, -44.0f, self.window.frame.size.width, 44);
    
    [self.window addSubview:theApexBannerViewContorller.view];
    [theApexBannerViewContorller showBannerWithText:intext];
    if (mBannerArray == nil)
    {
        mBannerArray = [[NSMutableArray alloc] init];
        [mBannerArray addObject:theApexBannerViewContorller];
    }
    else
        [mBannerArray addObject:theApexBannerViewContorller];
}

-(NSString *)getAppDocumentFolderPath
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,    NSUserDomainMask ,YES );
    NSString *Path = nil;
    if ([paths count] >0)
    {
        NSString *documentsDir = [paths objectAtIndex:0];
        Path = [documentsDir stringByAppendingPathComponent:kSavedNotifications];
    }
    return Path;
}

-(void)addNewNotificationDictionary:(NSDictionary*)inDict
{
    if (inDict != nil)
    {
        NSArray *thelist = [self retriveLocallyCachedNotificationData];
        NSMutableArray *theArray = [[ NSMutableArray alloc] initWithArray:thelist];
        [theArray addObject:inDict];
        //NSLog(@"After receiving notif : %@",theArray);
        [self writeToDocumentFolderWithList:theArray];
    }
}

-(void)writeToDocumentFolderWithList:(NSArray*)inArray
{
    [inArray writeToFile:[self getAppDocumentFolderPath] atomically:YES];
    
}

-(void)markAllRemoteNotificationHasRead
{
    NSArray *theNotificationList = [self retriveLocallyCachedNotificationData];
    NSMutableArray *theModifiableList = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < [theNotificationList count]; index++)
    {
        NSMutableDictionary *theDict = [[NSMutableDictionary alloc] initWithDictionary: [theNotificationList objectAtIndex:index]];
        [theDict setObject:[NSNumber numberWithBool:YES] forKey:kRemoteNotificationRead];
        [theModifiableList addObject:theDict];
    }
    
    [self writeToDocumentFolderWithList:theModifiableList];
}

-(void)checkAndcleanUpExpiriedNotifications
{
    NSMutableArray *theModifiableList = [[NSMutableArray alloc] initWithArray:[self retriveLocallyCachedNotificationData]];
    NSMutableIndexSet *discardedItems = [NSMutableIndexSet indexSet];
    
    for (int index = 0; index < [theModifiableList count]; index++)
    {
        NSMutableDictionary *theDict = [[NSMutableDictionary alloc] initWithDictionary: [theModifiableList objectAtIndex:index]];
        NSDate *theNotificationReceivedDate = [theDict objectForKey:kNotificationReceivedDate];
        NSDate *theExpireDate;
        switch ([[theDict objectForKey:kPType] integerValue])
        {
            case eCreditCheckNotificationType:
            case eTruckStopPricePromosNotificationType:
            {
                theExpireDate = [self oldDateFromNowByDays:7];
            }
                break;
            case eGenericTruckStopPromosNotificationType:
            case eGenericInformationalNotificationType:
            {
                theExpireDate = [self oldDateFromNowByDays:30];
            }
                break;
                
            default:
                break;
                
        }
        
        if ([theExpireDate compare:theNotificationReceivedDate] == NSOrderedDescending)
        {
            [discardedItems addIndex:index];
        }
    }
    
    [theModifiableList removeObjectsAtIndexes:discardedItems];
    [self writeToDocumentFolderWithList:theModifiableList];
}

-(NSDate *)oldDateFromNowByDays:(int)inDays
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:-inDays];
    NSDate *oldDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:currentDate options:0];
    return oldDate;
}

-(NSArray*)retirveUnexpiredCachedNotificationData
{
    [self checkAndcleanUpExpiriedNotifications];
    NSArray *thefinallist = [self retriveLocallyCachedNotificationData];
    return thefinallist;
}

-(NSArray*)retriveLocallyCachedNotificationData
{
    NSArray *thelist = [NSArray arrayWithContentsOfFile:[self getAppDocumentFolderPath]];
    //NSLog(@"After receiving  : %@",thelist);
    return thelist;
}

-(void)registerForNotification
{
    

    
    UIApplication *application = [UIApplication sharedApplication];
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge
                                                                                             |UIRemoteNotificationTypeSound
                                                                                             |UIRemoteNotificationTypeAlert) categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    else {
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
        [application registerForRemoteNotificationTypes:myTypes];
    }
    
}


#pragma mark end


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    mApexTruckStopPromoNotificationController = [[ApexTruckStopPromoNotificationController alloc] init];
    [self registerForNotification ];
    NSString *theSessionID = @"NTc1MzIyNQ==";
    NSString *theProfileID = @"57447";
    NSString *theUserName = @"appletest";
    NSString *thePassword = @"asdf1234";
    [kUserDefaults setObject:theUserName forKey:kUsername];
    [kUserDefaults setObject:thePassword forKey:kPassword];
    [kUserDefaults synchronize];
    
    NSString *theEscapeSessionID = [theSessionID urlEncodeUsingEncoding:NSUTF8StringEncoding];
    [kUserDefaults setObject:theEscapeSessionID forKey:kSessionID];
    [kUserDefaults setObject:theProfileID forKey:kProfileId];
    
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[ApexTruckStopPromoNotificationController sharedApexTruckStopPromoNotificationManager] requestToFetchTruckStopPromoInBackgroundMode];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //[mApexTruckStopPromoNotificationController fetchTruckStopPromosInForeground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    NSLog(@"performFetchWithCompletionHandler");
    [[ApexTruckStopPromoNotificationController sharedApexTruckStopPromoNotificationManager] onPermissionFetchTruckStopPromoInBackground:completionHandler];
    //completionHandler(UIBackgroundFetchResultNewData);
    
}

#pragma ends
#pragma mark Notification delegate
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"token data :%@", deviceToken);
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //[PFPush handlePush:userInfo];
    NSLog(@"****User info %@",userInfo);
    //[self handlePushNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    NSLog(@"****User info %@",userInfo);
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark ends


@end
