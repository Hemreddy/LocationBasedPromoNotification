//
//  ApexTruckStopPromosRequestResponseHandler.m
//  Apex
//
//  Created by Hemareddy Halli on 1/12/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import "ApexTruckStopPromosRequestResponseHandler.h"
#import "ApexResponseDataDelegate.h"
#import "ApexFuelStationList.h"
#import "ApexFuelStation.h"
#import "ApexStringToRelativeDate.h"
#import "ApexConstants.h"

@interface ApexTruckStopPromosRequestResponseHandler()
@property(nonatomic,strong)id<ApexResponseDataDelegate> mDelegate;

@end

@implementation ApexTruckStopPromosRequestResponseHandler


-(id)initWithDelegate:(id<ApexResponseDataDelegate>)inDelegate
{
    if (self = [super init])
    {
        self.mDelegate = inDelegate;
    }
    return self;
}

-(void)formGetTruckStopPromosRequest
{
    NSString *theReqStr = [NSString stringWithFormat:@"%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID]];
    
    ApexRequestResponseHandler *reqResHandler = [[ApexRequestResponseHandler alloc] initWithDelegate:self];
    [reqResHandler createGETRequest:theReqStr andMethodName:kTruckStopPromosWebService];
}

#pragma mark - Delegate methods

-(void)dataToHandlerWithSuccessWithDictionary:(NSDictionary *)inDataDictionary
{
    if([inDataDictionary objectForKey:kWebServiceActionErrors] != nil)
    {
       // NSArray *errorArray = [inDataDictionary objectForKey:kWebServiceActionErrors];
        //if ([errorArray count] > 0)
            [self.mDelegate failureWithError:nil andErrorDict:inDataDictionary];
    }
    else
    {
        ApexFuelStationList *stationList = [[ApexFuelStationList alloc] init];
        stationList.latitude = [inDataDictionary objectForKey:kWebserviceLatitude];
        
        stationList.longitude = [inDataDictionary objectForKey:kWebserviceLongitude];
        NSMutableArray *stationListArray = [[NSMutableArray alloc] init];
        
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
            [stationListArray addObject:fuelStation];
            fuelStation = nil;
        }
        
        [stationList setFuelStationList:stationListArray];
        stationListArray = nil;
        [self.mDelegate successWithResponse:stationList];

        
    }
}

-(void)dataToHandlerWithFailureWithError:(NSError *)inError
{
    [self.mDelegate failureWithError:inError andErrorDict:nil];
}


@end
