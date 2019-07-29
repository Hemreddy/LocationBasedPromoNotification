//
//  ApexFuelStation.h
//  Apex
//
//  Created by Hemareddy Halli on 12/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexBaseDTO.h"
#import <CoreLocation/CoreLocation.h>
@interface ApexFuelStation : ApexBaseDTO
@property(nonatomic,strong) NSString        *address;
@property(nonatomic,strong) NSNumber        *apexPreice;
@property(nonatomic,assign) BOOL            atm;
@property(nonatomic,strong) NSString        *chain;
@property(nonatomic,strong) NSString        *city;
@property(nonatomic,strong) NSNumber        *distance;
@property(nonatomic,strong) NSString        *effectiveDate;
@property(nonatomic,strong) NSNumber        *fuelFinderId;
@property(nonatomic,assign) BOOL            inNetwork;
@property(nonatomic,strong) NSDecimalNumber *latitude;
@property(nonatomic,strong) NSDecimalNumber *logitude;
@property(nonatomic,strong) NSString        *location;
@property(nonatomic,assign) BOOL            minnorRepairs;
@property(nonatomic,strong) NSString        *name;
@property(nonatomic,strong) NSString        *phone;
@property(nonatomic,strong) NSString        *posted;
@property(nonatomic,assign) BOOL            restaurants;
@property(nonatomic,strong) NSDecimalNumber *retailPrice;
@property(nonatomic,assign) BOOL            scales;
@property(nonatomic,assign) BOOL            showers;
@property(nonatomic,strong) NSString        *signName;
@property(nonatomic,strong) NSString        *state;
@property(nonatomic,strong) NSString        *stateFuelTax;
@property(nonatomic,assign) BOOL            tireRepair;
@property(nonatomic,strong) NSDate          *promotionDate;
@property(nonatomic,retain) CLRegion        *region;
@end
