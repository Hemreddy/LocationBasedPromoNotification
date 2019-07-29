//
//  ApexConnectionHandler.h
//  Apex
//
//  Created by Hemareddy Halli on 10/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApexDataDowloadDelegate;

@interface ApexConnectionHandler : NSObject<NSURLConnectionDelegate>

-(id)initWithDelegate:(id<ApexDataDowloadDelegate>)inDelegate;
-(void)processRequest:(NSMutableURLRequest *)aRequest;
-(void)cancelRequest;
-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response;
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void) connection:(NSURLConnection *) connection didFailWithError:(NSError *)error;
-(void) connectionDidFinishLoading:(NSURLConnection *) connection;
@end
