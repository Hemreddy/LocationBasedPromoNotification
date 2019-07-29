//
//  ApexProfileRequestResponseHandler.h
//  Apex
//
//  Created by Hemareddy Halli on 11/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApexRequestResponseHandler.h"
#import "ApexResponseDataDelegate.h"

@interface ApexProfileRequestResponseHandler : NSObject<ApexDataHandlerDelegate>

-(void)formProfileListRequestAndSend;
-(void)formProfileDetailRequestAndSend;
-(void)formProfilePermissionRequestAndSend;

-(id)initWithDelegate:(id<ApexResponseDataDelegate>)inDelegate;
@end
