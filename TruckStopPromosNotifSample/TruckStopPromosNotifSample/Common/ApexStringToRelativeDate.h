//
//  ApexStringToRelativeDate.h
//  Apex
//
//  Created by Hemareddy Halli on 11/27/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApexStringToRelativeDate : NSObject
+(NSDate*)stringToDate:(NSString*)dateString;
+ (NSString *)relativeDateStringForDate:(NSDate *)date;
+(NSString *)changeTheDate:(NSString*)dateString formatFrom:(NSString*)currentFormat to:(NSString*)requiredFormat;
+(NSString *)changeTheDate:(NSDate*)dateString to:(NSString*)requiredFormat;
@end
