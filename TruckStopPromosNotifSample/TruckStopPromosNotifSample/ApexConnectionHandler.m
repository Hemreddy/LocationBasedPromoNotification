//
//  ApexConnectionHandler.m
//  Apex
//
//  Created by Hemareddy Halli on 10/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexConnectionHandler.h"
#import "ApexDataDowloadDelegate.h"
#import "ApexConstants.h"

@interface ApexConnectionHandler ()
{//@private;
    NSURLConnection *mURLConnection;
    NSMutableData *mResponseData;
}
@property(nonatomic,strong)NSString *mFilePath;
@property(nonatomic,strong)id<ApexDataDowloadDelegate> mDelegate;
@end

@implementation ApexConnectionHandler
//@synthesize mDelegate;
#pragma mark - Misc

-(id)initWithDelegate:(id<ApexDataDowloadDelegate>)inDelegate
{
    if (self = [super init])
    {
        self.mDelegate = inDelegate;
        if (nil == mResponseData) {
            mResponseData = [[NSMutableData alloc] init];
        }

    }
    return self;
}

-(void)processRequest:(NSMutableURLRequest *)aRequest
{
    [self cancelRequest];
    
//    if (nil == mResponseData) {
//        mResponseData = [[NSMutableData alloc] init];
//    }
    mURLConnection = [[NSURLConnection alloc] initWithRequest:aRequest delegate:self];
}

-(void) cancelRequest
{
    if(mURLConnection)
    {
        [mURLConnection cancel];
    }
}

#pragma mark - NSURLConnection Delegates
-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    DEBUGLOG(@"\nResponse Status code :%ld",(long)[(NSHTTPURLResponse *)response statusCode]);
    if (nil == mResponseData) {
        mResponseData = [[NSMutableData alloc] init];
    }
    [mResponseData setLength:0];
    
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (nil == mResponseData) {
        mResponseData = [[NSMutableData alloc]init];
    }
    [mResponseData appendData:data];
}


- (void) connection:(NSURLConnection *) connection didFailWithError:(NSError *)error
{
    DEBUGLOG(@"Inside fail");
    
    [self.mDelegate dataDownloadFailedWithError:error];
    //NSMutableData *errorData = [[NSMutableData alloc]initWithData:[[error localizedDescription]dataUsingEncoding:NSUTF8StringEncoding]];
   /* if([self.mRequestTarget respondsToSelector:self.mRequestSelector]){
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.mRequestTarget performSelector:self.mRequestSelector withObject:errorData withObject:[NSNumber numberWithInt:eError]];
    #pragma clang diagnostic pop
    }*/
}

-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    if([mResponseData length] > 0)
    {
        NSString *theStr = [[NSString alloc] initWithData:mResponseData encoding:NSUTF8StringEncoding];
        DEBUGLOG(@"Response:- \n %@", theStr);
        
        if ([theStr length]>0) {
            theStr=[self stringByRemovingControlCharacters:theStr];
        }
        
        
        NSData* responseData = [[theStr dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
        [self.mDelegate dataDownloadCompleteWithData:responseData];
        /*
        if([self.mRequestTarget respondsToSelector:self.mRequestSelector]){
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.mRequestTarget performSelector:self.mRequestSelector withObject:mResponseData withObject:[NSNumber numberWithInt:eNoError]];
#pragma clang diagnostic pop*/
       // }
    }
}

- (NSString *)stringByRemovingControlCharacters: (NSString *)inputString
{
    NSCharacterSet *controlChars = [NSCharacterSet controlCharacterSet];
    NSRange range = [inputString rangeOfCharacterFromSet:controlChars];
    if (range.location != NSNotFound) {
        NSMutableString *mutable = [NSMutableString stringWithString:inputString];
        while (range.location != NSNotFound) {
            [mutable deleteCharactersInRange:range];
            range = [mutable rangeOfCharacterFromSet:controlChars];
        }
        return mutable;
    }
    return inputString;
}


@end
