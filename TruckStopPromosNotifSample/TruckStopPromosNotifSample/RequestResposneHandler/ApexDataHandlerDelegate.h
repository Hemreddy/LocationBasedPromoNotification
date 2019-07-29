//
//  ApexDataHandlerDelegate.h
//  Apex
//
//  Created by Hemareddy Halli on 11/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApexDataHandlerDelegate <NSObject>

@required
-(void)dataToHandlerWithSuccessWithDictionary:(NSDictionary*)inDataDictionary;
-(void)dataToHandlerWithFailureWithError:(NSError*)inError;

@end
