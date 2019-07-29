//
//  ApexStringToRelativeDate.m
//  Apex
//
//  Created by Hemareddy Halli on 11/27/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import "ApexStringToRelativeDate.h"

@implementation ApexStringToRelativeDate

+(NSDate*)stringToDate:(NSString*)dateString
{
    // Convert string to date object
    NSDateFormatter *theFormat = [ApexStringToRelativeDate getFormater:@"MM/dd/yy HH:mm"];
    NSDate *theDate = [theFormat dateFromString:dateString];
    if (theDate == NULL)
    {
        theFormat = [ApexStringToRelativeDate getFormater:@"yyyy-MM-dd'T'HH:mm:ss"];
        theDate = [theFormat dateFromString:dateString];
        if (theDate == NULL)
        {
            theFormat = [ApexStringToRelativeDate getFormater:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
            theDate = [theFormat dateFromString:dateString];
            
            if  (theDate == NULL) {
                theFormat = [ApexStringToRelativeDate getFormater:@"MM/dd/yyyy"];
                theDate = [theFormat dateFromString:dateString];
            }
        }
    }
    return theDate;
}

+(NSDateFormatter*)getFormater:(NSString*)inDateFormat
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"CST"];
    [dateFormat setTimeZone:timeZone];
    [dateFormat setDateFormat:inDateFormat];
    
    return dateFormat;
}

+(NSString *)changeTheDate:(NSString*)dateString formatFrom:(NSString*)currentFormat to:(NSString*)requiredFormat
{
    NSDateFormatter *theCurrentFormat = [ApexStringToRelativeDate getFormater:currentFormat];
    NSDate *theDate = [theCurrentFormat dateFromString:dateString];
    NSDateFormatter *theRequiredFormat = [ApexStringToRelativeDate getFormater:requiredFormat];
    NSString *desiredString = [theRequiredFormat stringFromDate:theDate];
    return desiredString;
}

+(NSString *)changeTheDate:(NSDate*)dateString to:(NSString*)requiredFormat
{
    NSDateFormatter *theRequiredFormat = [ApexStringToRelativeDate getFormater:requiredFormat];
    NSString *desiredString = [theRequiredFormat stringFromDate:dateString];
    return desiredString;
}

+ (NSString *)relativeDateStringForDate:(NSDate *)date
{
    NSCalendarUnit units = NSDayCalendarUnit | NSWeekOfYearCalendarUnit |
    NSMonthCalendarUnit | NSYearCalendarUnit;
    
    // if `date` is before "now" (i.e. in the past) then the components will be positive
    NSDateComponents *components = [[NSCalendar currentCalendar] components:units
                                                                   fromDate:date
                                                                     toDate:[NSDate date]
                                                                    options:0];
    
    if (components.year == 1) {
        return [NSString stringWithFormat:@"%ld year ago", (long)components.year];
    } else if (components.month == 1) {
        return [NSString stringWithFormat:@"%ld month ago", (long)components.month];
    } else if (components.weekOfYear == 1) {
        return [NSString stringWithFormat:@"%ld week ago", (long)components.weekOfYear];
    } else if (components.day == 1) {
        return [NSString stringWithFormat:@"%ld day ago", (long)components.day];
    }else if (components.year > 1) {
        return [NSString stringWithFormat:@"%ld years ago", (long)components.year];
    } else if (components.month > 1) {
        return [NSString stringWithFormat:@"%ld months ago", (long)components.month];
    } else if (components.weekOfYear > 1) {
        return [NSString stringWithFormat:@"%ld weeks ago", (long)components.weekOfYear];
    } else if (components.day > 1) {
        //        if (components.day > 1) {
        return [NSString stringWithFormat:@"%ld days ago", (long)components.day];
        //        } else {
        //            return @"Yesterday";
        //        }
    } else {
        return @"Today";
    }
}

@end
