//
//  ApexResponseDataDelegate.h
//  Apex
//
//  Created by Hemareddy Halli on 11/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApexBaseDTO.h"

@protocol ApexResponseDataDelegate <NSObject>
@required
-(void)successWithResponse:(ApexBaseDTO*)inData;
-(void)failureWithError:(NSError*)inError andErrorString:(NSString*)errorString;
-(void)failureWithError:(NSError*)inError andErrorDict:(NSDictionary *)errorDict;
@end
