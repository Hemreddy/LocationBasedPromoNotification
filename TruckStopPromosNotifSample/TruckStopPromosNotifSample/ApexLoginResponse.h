//
//  ApexLoginResponse.h
//  Apex
//
//  Created by Hemareddy Halli on 11/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexBaseDTO.h"


@interface ApexLoginResponse : ApexBaseDTO

@property(nonatomic,strong) NSString *sessionID;
@property(nonatomic,strong) NSString *friendlyName;
@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSString *password;
@property(nonatomic,strong) NSArray *requiredDocuments;
@end
