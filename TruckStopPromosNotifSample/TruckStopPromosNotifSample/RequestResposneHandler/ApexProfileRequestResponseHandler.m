//
//  ApexProfileRequestResponseHandler.m
//  Apex
//
//  Created by Hemareddy Halli on 11/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexProfileRequestResponseHandler.h"
#import "ApexRequestResponseHandler.h"
#import "ApexProfileList.h"
#import "ApexProfileListArray.h"
#import "ApexProfileDetail.h"
#import "ApexAccountBalance.h"
#import "ApexBankNumber.h"
#import "ApexConstants.h"

@interface ApexProfileRequestResponseHandler()
{
    ApexRequestResponseHandler *mReqResHandler;
    NSString *theActionVal;
}
@property(nonatomic,strong)id<ApexResponseDataDelegate> mDelegate;
@end

@implementation ApexProfileRequestResponseHandler

-(id)initWithDelegate:(id<ApexResponseDataDelegate>)inDelegate
{
    if (self = [super init])
    {
        self.mDelegate = inDelegate;
    }
    return self;
}

#pragma mark - Form Profile Request
/*
 * Method Name	: formProfileListRequest
 * Description	: This method is responsible to form requst for Profile List.
 */
-(void)formProfileListRequestAndSend
{
    theActionVal = kGetProfileListWebservice;
    
    NSString *theReqStr = [NSString stringWithFormat:@"%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID]];
    
    mReqResHandler = [[ApexRequestResponseHandler alloc] initWithDelegate:self];
    [mReqResHandler createGETRequest:theReqStr andMethodName:theActionVal];
}

/*
 * Method Name	: formProfileDetailRequest
 * Description	: This method is responsible to form requst for Profile Detail.
 */
-(void)formProfileDetailRequestAndSend
{
    theActionVal = kGetProfileDetailWebservice;
    
    NSString *theReqStr = [NSString stringWithFormat:@"%@=%@&%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID],kWebServiceProfileID,[kUserDefaults objectForKey:kProfileId]];

    mReqResHandler = [[ApexRequestResponseHandler alloc] initWithDelegate:self];
    [mReqResHandler createGETRequest:theReqStr andMethodName:theActionVal];
}

/*
 * Method Name	: formProfilePermissionRequestWithProfileID
 * Description	: This method is responsible to form requst for Profile Permission.
 */
-(void)formProfilePermissionRequestAndSend
{
    theActionVal = kPermissionWebservice;
    
    NSString *theReqStr = [NSString stringWithFormat:@"%@=%@",kWebServiceSessionID,[kUserDefaults objectForKey:kSessionID]];
    
    mReqResHandler = [[ApexRequestResponseHandler alloc] initWithDelegate:self];
    [mReqResHandler createGETRequest:theReqStr andMethodName:theActionVal];
    
}

#pragma mark - Delegate Methods

-(void)dataToHandlerWithSuccessWithDictionary:(NSDictionary *)inDataDictionary
{
    if([inDataDictionary objectForKey:kWebServiceActionErrors] != nil)
    {
        //NSArray *errorArray = [inDataDictionary objectForKey:kWebServiceActionErrors];
        [self.mDelegate failureWithError:nil andErrorDict:inDataDictionary];
    }
    else
    {
        if([theActionVal isEqualToString:kGetProfileListWebservice])
        {
            NSMutableArray *theProfileDTOsArray = nil;
            theProfileDTOsArray = [[NSMutableArray alloc] init];
            NSArray *theProfileListArray = [inDataDictionary objectForKey:kWebServiceProfiles];
            for(int index=0; index<[theProfileListArray count]; index++)
            {
                NSDictionary *accountDictionary = (NSDictionary*)[theProfileListArray objectAtIndex:index];
                ApexProfileList *theProfile = [[ApexProfileList alloc] init];
                [theProfile setCompanyName:[accountDictionary objectForKey:kWebServiceCompanyName]];
                [theProfile setCity:[accountDictionary objectForKey:kWebServiceCity]];
                [theProfile setState:[accountDictionary objectForKey:kWebServiceState]];
                [theProfile setProfileID:[accountDictionary valueForKey:kWebServiceProfileID] ];
                [theProfileDTOsArray addObject:theProfile];
                theProfile = nil;
            }
            ApexProfileListArray * profileList = [[ApexProfileListArray alloc] init];
            profileList.profileList = theProfileDTOsArray;
            [self.mDelegate successWithResponse:profileList];
        }
        else if([theActionVal isEqualToString:kGetProfileDetailWebservice])
        {
            ApexProfileDetail *theProfileDetailDTO = nil;
            NSDictionary *profileDictionary = [inDataDictionary objectForKey:kWebServiceProfile];
            NSDictionary *infoDictionary = [profileDictionary objectForKey:kWebServicePersonalInfo];
            theProfileDetailDTO = [[ApexProfileDetail alloc] init];
            [theProfileDetailDTO setEmailId:[infoDictionary objectForKey:kWebServiceEmailId]];
            [theProfileDetailDTO setExtension:[infoDictionary objectForKey:kWebServiceExtension]];
            [theProfileDetailDTO setGroupEmailId:[infoDictionary objectForKey:kWebServiceGroupEmailId]];
            [theProfileDetailDTO setName:[infoDictionary objectForKey:kWebServiceName]];
            [theProfileDetailDTO setPhoneNumber:[infoDictionary objectForKey:kWebServicePhoneNumber]];
            [theProfileDetailDTO setCity:[profileDictionary objectForKey:kWebServiceCity]];
            [theProfileDetailDTO setCompanyId:[infoDictionary objectForKey:kWebServiceCompanyId]];
            [theProfileDetailDTO setCompanyName:[infoDictionary objectForKey:kWebServiceCompanyName]];
            [theProfileDetailDTO setState:[profileDictionary objectForKey:kWebServiceState]];
            
            NSArray *balanceArray = (NSArray*)[profileDictionary objectForKey:kWebServiceBalances];
            NSMutableArray *theBalanceDTOArray = [[NSMutableArray alloc] init];
            
            for(int index=0; index<[balanceArray count]; index++)
            {
                ApexAccountBalance *theAccountBalanceDTO = [[ApexAccountBalance alloc] init];
                [theAccountBalanceDTO setName:[[balanceArray objectAtIndex:index] objectForKey:kWebServiceName]];
                [theAccountBalanceDTO setBalance:[[balanceArray objectAtIndex:index] objectForKey:kWebServiceValue]];
                [theBalanceDTOArray addObject:theAccountBalanceDTO];
                theAccountBalanceDTO = nil;
            }
            [theProfileDetailDTO setBalanceArray:theBalanceDTOArray];
            
            NSArray *bankNumberArray = (NSArray*)[profileDictionary objectForKey:kWebServiceBankNumbers];
            NSMutableArray *theBankNumbersDTOArray = [[NSMutableArray alloc] init];
            
            for(int index=0; index<[bankNumberArray count]; index++)
            {
                ApexBankNumber *theBankNumberDTO = [[ApexBankNumber alloc] init];
                [theBankNumberDTO setAccountNumber:[[bankNumberArray objectAtIndex:index] objectForKey:kWebServiceAccountNumber]];
                [theBankNumberDTO setBankId:[[bankNumberArray objectAtIndex:index] objectForKey:kWebServiceBankId]];
                [theBankNumberDTO setType:[[bankNumberArray objectAtIndex:index] objectForKey:kWebServiceType]];
                [theBankNumbersDTOArray addObject:theBankNumberDTO];
                theBankNumberDTO = nil;
            }
            [theProfileDetailDTO setBankNumberArray:theBankNumbersDTOArray];
            [self.mDelegate successWithResponse:theProfileDetailDTO];
        }
        else if([theActionVal isEqualToString:kPermissionWebservice])
        {
            [self setDefaultValuesForUserDefaults];
            NSArray *permissionArray = (NSArray*)[inDataDictionary objectForKey:kWebServiceRoles];
            for(int index=0; index<[permissionArray count]; index++)
            {
                NSString *permissionString = [[permissionArray objectAtIndex:index] objectForKey:kWebServiceCode];
//                NSString *hiddenString = [[permissionArray objectAtIndex:index] objectForKey:kWebServiceHidden];
//                BOOL permissionValue = NO;
//                if([hiddenString isEqualToString:@"N"])
//                    permissionValue = YES;
                // [kAppDefaults setBool:YES forKey:@"credit"];
                [kUserDefaults setObject:[NSNumber numberWithBool:YES] forKey:permissionString];
                [kUserDefaults synchronize];

            }
            [self.mDelegate successWithResponse:nil];
        }
    }
}

-(void)dataToHandlerWithFailureWithError:(NSError *)inError
{
    [self.mDelegate failureWithError:inError andErrorDict:nil];
}

-(void)setDefaultValuesForUserDefaults
{
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSchedules];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSchedulesView];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReports];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionBalances];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReportsPayment];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReportsFunding];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReportsReserve];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReportsAging];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReportConcentration];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReportsPurchase];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionReportsUnresolvedIssues];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionOnlineInv];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionOnlineInvCreateSchedule];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionOnlineInvImageUpload];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionOnlineInvMailSubmit];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionOnlineInvOnlineSubmit];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionCreditCheck];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionCreditCheckView];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionCreditCheckSubmit];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionCreditCheckAdditional];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSelfFund];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSelfFundWrite];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSelfFundAch];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSelfFundEfs];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSelfFundTChek];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSelfFundTch];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionIntegratedService];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionIntegratedServiceBillable];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionIntegratedServiceTrippack];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionIntegratedServiceFuelDiscount];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSmartScan];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSmartScanOnlineInvoice];
    [kUserDefaults setObject:[NSNumber numberWithBool:NO] forKey:kPermissionSmartScanInvoice];
    [kUserDefaults synchronize];

}
@end
