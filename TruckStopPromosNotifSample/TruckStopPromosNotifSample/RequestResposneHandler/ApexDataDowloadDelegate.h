//
//  ApexDataDowloadDelegate.h
//  Apex
//
//  Created by Hemareddy Halli on 11/12/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApexDataDowloadDelegate <NSObject>
@required
-(void)dataDownloadCompleteWithData:(NSData*)inData;
-(void)dataDownloadFailedWithError:(NSError*)inError;

@end
