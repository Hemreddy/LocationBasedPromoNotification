//
//  ApexProfileDetail.h
//  Apex
//
//  Created by Hemareddy Halli on 11/13/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexBaseDTO.h"

@interface ApexProfileDetail : ApexBaseDTO
@property(nonatomic,strong) NSString *emailId;
@property(nonatomic,strong) NSString *extension;
@property(nonatomic,strong) NSString *groupEmailId;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *phoneNumber;
@property(nonatomic,strong) NSString *city;
@property(nonatomic,strong) NSString *companyId;
@property(nonatomic,strong) NSString *companyName;
@property(nonatomic,strong) NSString *state;
@property(nonatomic,strong) NSArray *balanceArray;
@property(nonatomic,strong) NSArray *bankNumberArray;

@end
