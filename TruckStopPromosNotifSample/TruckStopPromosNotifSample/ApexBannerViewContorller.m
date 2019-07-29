//
//  ApexBannerViewContorller.m
//  ShowTopBannerSample
//
//  Created by Hemareddy Halli on 1/12/15.
//  Copyright (c) 2015 Hemareddy Halli. All rights reserved.
//

#import "ApexBannerViewContorller.h"
#import "AppDelegate.h"

#define BANNER_HEIGHT   64
@interface ApexBannerViewContorller ()

@end

@implementation ApexBannerViewContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetInitialProperties];
    [self addButton];
    self.view.autoresizesSubviews = YES;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)SetInitialProperties
{
    self.view.backgroundColor = [UIColor blackColor];
    self.view.alpha = 0.8;
}

-(void)addButton
{
    mTextLabel = [[UILabel alloc]  initWithFrame:CGRectMake(10.0f,20.0f, self.view.frame.size.width - 20 - 34, BANNER_HEIGHT -30)];
    mTextLabel.numberOfLines = 0;
    mTextLabel.textColor = [UIColor whiteColor];
    mTextLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    mTextLabel.font = [UIFont fontWithName:kLatoRegularFontName size:13];
    [self.view addSubview:mTextLabel];
    
    UIButton *theButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f,0.0f, self.view.frame.size.width, BANNER_HEIGHT )];
    theButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [theButton addTarget:self action:@selector(closeBanner) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:theButton];
    
    UIButton *theCloseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *listImage = [UIImage imageNamed:@"close_btn_MP"];
    theCloseButton.frame = CGRectMake(self.view.frame.size.width - 34,25.0f, listImage.size.width,  listImage.size.height);
    [theCloseButton setImage:listImage forState:UIControlStateNormal];
    theCloseButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [theCloseButton addTarget:self action:@selector(closeBanner) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:theCloseButton];
    
}
-(void)setUpTimer
{
    mTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(removeBanner) userInfo:nil repeats:NO];
}
-(void)inValidateTimer
{
    [mTimer invalidate];
    mTimer = nil;
}

-(void)removeBanner
{
    AppDelegate *theDelegate =(AppDelegate*) [UIApplication sharedApplication].delegate;
    [UIView animateWithDuration:0.3
                          delay:.2
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         [self.view setFrame:CGRectMake(0.0f, -BANNER_HEIGHT, theDelegate.window.rootViewController.view.frame.size.width, BANNER_HEIGHT)];
                     } completion:^(BOOL finished) {
                         //do nothing
                     }];

}


-(void)showBannerWithText:(NSString*)inmessage
{
    AppDelegate *theDelegate =(AppDelegate*) [UIApplication sharedApplication].delegate;
    mTextLabel.text = inmessage;

    [UIView animateWithDuration:0.3
                          delay:.2
                        options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         [self.view setFrame:CGRectMake(0.0f, 0.0f, theDelegate.window.rootViewController.view.frame.size.width, BANNER_HEIGHT)];
                     } completion:^(BOOL finished) {
                         //do nothing
                     }];
    
    [self setUpTimer];

}

-(void)closeBanner
{
    [self inValidateTimer];
    [self removeBanner];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
