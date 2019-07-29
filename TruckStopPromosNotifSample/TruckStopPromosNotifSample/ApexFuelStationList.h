//
//  ApexFuelStationList.h
//  Apex
//
//  Created by Hemareddy Halli on 12/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexBaseDTO.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ApexFuelStationList : ApexBaseDTO
@property(nonatomic,strong)NSString *overViewPolyline;
@property(nonatomic,strong)NSDecimalNumber *latitude;
@property(nonatomic,strong)NSDecimalNumber *longitude;
@property(nonatomic,strong)NSArray *fuelStationList;
@property(nonatomic,strong)GMSCoordinateBounds *mapBounds;
@end
