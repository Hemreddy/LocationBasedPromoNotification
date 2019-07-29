//
//  ApexBankNumber.h
//  Apex
//
//  Created by Hemareddy Halli on 11/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexBaseDTO.h"

@interface ApexBankNumber : ApexBaseDTO
@property(nonatomic,strong) NSString *accountNumber;
@property(nonatomic,strong) NSNumber *bankId;
@property(nonatomic,strong) NSString *type;

@end
