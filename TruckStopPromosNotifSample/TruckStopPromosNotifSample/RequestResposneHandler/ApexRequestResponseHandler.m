//
//  ApexRequestResponseHandler.m
//  Apex
//
//  Created by Hemareddy Halli on 10/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexRequestResponseHandler.h"
#import "ApexConstants.h"
//#import "Reachability.h"



@interface ApexRequestResponseHandler()
@property(nonatomic,strong)id<ApexDataHandlerDelegate> mDelegate;

@end

@implementation ApexRequestResponseHandler


-(id)initWithDelegate:(id<ApexDataHandlerDelegate>)inDelegate
{
    if (self = [super init])
    {
        self.mDelegate = inDelegate;
    }
    return self;
}

#pragma mark - Handle Response

-(void)dataDownloadCompleteWithData:(NSData*)inData
{
    NSError *jsonParserError = nil;
    NSDictionary *resDictionary = [NSJSONSerialization JSONObjectWithData:inData
                                                                  options:0
                                                                    error:&jsonParserError];
    [self.mDelegate dataToHandlerWithSuccessWithDictionary:resDictionary];
}

-(void)dataDownloadFailedWithError:(NSError*)inError
{
    [self.mDelegate dataToHandlerWithFailureWithError:inError];
}

#pragma mark - HTTP POST Requests

-(void)createPOSTRequestAndSend:(NSDictionary*)aBodyMessage andMethodName:(NSString*)methodName andRequestString:(NSString*)string
{
    NSURL *theURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,methodName,string]];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL
                                                              cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSError *error;
    NSData* theHTTPBodyData = [NSJSONSerialization dataWithJSONObject:aBodyMessage
                                                              options:NSJSONWritingPrettyPrinted error:&error];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [theRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[theHTTPBodyData length]] forHTTPHeaderField:@"Content-Length"];
//    NSData* theHTTPBodyData =  [NSKeyedArchiver archivedDataWithRootObject:aBodyMessage];

    [theRequest setHTTPBody:theHTTPBodyData];
    //DEBUGLOG(@"Request Web-service URL :%@",theURL);
    
    ApexConnectionHandler *connectionHandler = [[ApexConnectionHandler alloc] initWithDelegate:self];
    [connectionHandler processRequest:theRequest];
}


#pragma mark - HTTP GET Requests
/*
 * Method Name	: createHTTPRequestAndSend
 * Description	: This is a generic methiod to create the HTTP body from get method and the request using the connection manager.
 */

-(void)createGETRequest:(NSString*)aRequestString andMethodName:(NSString*)methodName{
    
        NSURL *theURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",kWebServiceURL,methodName,aRequestString]];
    
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL
                                                              cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        [theRequest setHTTPMethod:@"GET"];
        DEBUGLOG(@"--------------------------Request--------------------------");
        DEBUGLOG(@"GET service URL :%@",theURL);
        ApexConnectionHandler *connectionHandler = [[ApexConnectionHandler alloc] initWithDelegate:self];
        [connectionHandler processRequest:theRequest];
}

-(void)createGETForGoogleApiRequest:(NSString*)aRequestString andURLString:(NSString*)urlString
{
    NSURL *theURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",urlString,aRequestString]];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:theURL
                                                              cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [theRequest setHTTPMethod:@"GET"];
    DEBUGLOG(@"--------------------------Request--------------------------");
    DEBUGLOG(@"GET service URL :%@",theURL);
    ApexConnectionHandler *connectionHandler = [[ApexConnectionHandler alloc] initWithDelegate:self];
    [connectionHandler processRequest:theRequest];

}

@end
