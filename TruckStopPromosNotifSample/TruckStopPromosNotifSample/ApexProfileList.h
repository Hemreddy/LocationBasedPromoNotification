//
//  ApexProfileList.h
//  Apex
//
//  Created by Hemareddy Halli on 11/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexBaseDTO.h"

@interface ApexProfileList : ApexBaseDTO
@property(nonatomic,strong) NSString *companyName;
@property(nonatomic,strong) NSString *city;
@property(nonatomic,strong) NSString *state;
@property(nonatomic,strong) NSNumber *profileID;

@end
