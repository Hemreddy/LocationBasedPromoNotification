//
//  ApexTruckStopPromosRequestResponseHandler.h
//  Apex
//
//  Created by Hemareddy Halli on 1/12/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApexRequestResponseHandler.h"
#import "ApexDataHandlerDelegate.h"
#import "ApexResponseDataDelegate.h"
@interface ApexTruckStopPromosRequestResponseHandler : NSObject<ApexDataHandlerDelegate>

-(id)initWithDelegate:(id<ApexResponseDataDelegate>)inDelegate;
-(void)formGetTruckStopPromosRequest;
@end
