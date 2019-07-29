//
//  ApexRequestResponseHandler.h
//  Apex
//
//  Created by Hemareddy Halli on 10/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApexConnectionHandler.h"
#import "ApexDataDowloadDelegate.h"
#import "ApexDataHandlerDelegate.h"

@interface ApexRequestResponseHandler : NSObject<ApexDataDowloadDelegate>

-(id)initWithDelegate:(id<ApexDataHandlerDelegate>)inDelegate;
-(void)createGETRequest:(NSString*)aRequestString andMethodName:(NSString*)methodName;
-(void)createPOSTRequestAndSend:(NSDictionary*)aBodyMessage andMethodName:(NSString*)methodName andRequestString:(NSString*)string;
-(void)createGETForGoogleApiRequest:(NSString*)aRequestString andURLString:(NSString*)urlString;
@end
