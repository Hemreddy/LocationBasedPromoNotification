//
//  ApexLoginRequestResponseHandler.h
//  Apex
//
//  Created by Hemareddy Halli on 11/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApexRequestResponseHandler.h"
#import "ApexResponseDataDelegate.h"

@interface ApexLoginRequestResponseHandler : NSObject<ApexDataHandlerDelegate>

-(void)formLoginRequestandSendWithDictionary:(NSMutableDictionary*)aDict;
-(id)initWithDelegate:(id<ApexResponseDataDelegate>)inDelegate;
@end
