//
//  ApexLoginRequestResponseHandler.m
//  Apex
//
//  Created by Hemareddy Halli on 11/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexLoginRequestResponseHandler.h"
#import "ApexLoginResponse.h"
#import "ApexConstants.h"

@interface ApexLoginRequestResponseHandler()
@property(nonatomic,strong)id<ApexResponseDataDelegate> mDelegate;
@property(nonatomic,strong) NSString* password;
@end

@implementation ApexLoginRequestResponseHandler

-(id)initWithDelegate:(id<ApexResponseDataDelegate>)inDelegate
{
    if (self = [super init])
    {
        self.mDelegate = inDelegate;
    }
    return self;
}

#pragma mark - Form Login Request
/*
 * Method Name	: formLoginRequestWithDictionary
 * Description	: This methiod is responsible to form requst for login.
 */
-(void)formLoginRequestandSendWithDictionary:(NSMutableDictionary*)aDict
{
    NSString *theActionVal = kLoginWebservice;
    
    NSString *theReqStr = [NSString stringWithFormat:@"%@=%@&%@=%@&version=1.0",kWebServiceUsername,[aDict valueForKey:kUsername],kWebServicePassword,[aDict valueForKey:kPassword]];
    self.password = [[NSString alloc]initWithString:[aDict valueForKey:kPassword]];

    ApexRequestResponseHandler *reqResHandler = [[ApexRequestResponseHandler alloc] initWithDelegate:self];
    [reqResHandler createGETRequest:theReqStr andMethodName:theActionVal];
}

#pragma mark - Form Login Response
/*
 * Method Name	: formLoginResponseWithDictionary
 * Description	: This methiod is responsible to form response for login.
 */

-(void)dataToHandlerWithSuccessWithDictionary:(NSDictionary *)inDataDictionary
{
    if([inDataDictionary objectForKey:kWebServiceActionErrors] != nil)
    {
       // NSArray *errorArray = [inDataDictionary objectForKey:kWebServiceActionErrors];
        [self.mDelegate failureWithError:nil andErrorDict:inDataDictionary];
    }
    else
    {
        ApexLoginResponse *login = [[ApexLoginResponse alloc] init];
        [login setUserName:[inDataDictionary objectForKey:kWebServiceUsername]];
        [login setSessionID:[inDataDictionary objectForKey:kWebServiceSessionID]];
        [login setFriendlyName:[inDataDictionary objectForKey:kWebServiceFriendlyname]];
        [login setRequiredDocuments:[inDataDictionary objectForKey:kWebServiceRequiredDocuments]];
        [login setPassword:self.password];
        self.password = nil;
        [self.mDelegate successWithResponse:login];
    }
}

-(void)dataToHandlerWithFailureWithError:(NSError *)inError
{
    [self.mDelegate failureWithError:inError andErrorDict:nil];
}


@end
