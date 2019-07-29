//
//  ApexConstants.h
//  Apex
//
//  Created by Hemareddy Halli on 10/14/14.
//  Copyright (c) 2014 Hemareddy Halli. All rights reserved.
//

#ifndef Apex_ApexConstants_h
#define Apex_ApexConstants_h

//#import "ApexAppDelegate.h"
//#import "UIView+Additions.h"
//#import "UILabel+Additions.h"

#ifdef DEBUG
#define DEBUGLOG NSLog
#else
#define DEBUGLOG(x,...)
#endif

#pragma mark - Type def

typedef enum
{
    eNoError = 0,
    eError,
}ApexError;

typedef enum
{
    eLoginBtnTag = 500,
    eLogoImageViewTag,
    eTopLabelTag,
    eTextFieldBGImageViewTag,
    eUsernameImageViewTag,
    ePasswordImageViewTag,
    eUsernameTxtFldTag,
    ePasswordTxtFldTag,
    eUsernameTxtFldSeparatorImageViewTag,
    ePasswordTxtFldSeparatorImageViewTag,
    eBackGroundImageViewTag,
    eQuickDialDirectotyBtnTag,
    eNotAnApexClientBtnTag,
    eBottomSeperatorImageViewTag,
    
}LoginViewComponentsTag;

typedef enum
{
    eBgImageViewTag = 600,
    eContentWeviewTag,
    eAgreeBtnTag,
    eDisagreeBtnTag,
    
}AgreementTag;

typedef enum
{
    eDialDirectoryHeaderViewTag = 700,
    eDialDirectoryHeaderLabeltag,
    eDialDirectoryBackBtnTag,
    eDialDirectoryTableViewTag,
    eDialDirectoryTransaparentBtnTag,
}DialDirectoryComponentsTag;

typedef enum
{
    eYesBtnTag = 800,
    eNoBtnTag,
    ePinImgViewTag,
    ePinInfoTag,
    ePinConfirmationLblTag,
    eBackgroundImgViewForPinTag,
    ePlaceholderLbl,
    ePlaceholderTextField,
    ePinHolderViewTag,
    ePinKeyboardTag,
    ePinCollectionViewTag,
    ePinBottemLineTag,
}PinViewTag;

typedef enum
{
    eMobileImageViewTag = 900,
    eHeadingLabelTag,
    eInfoLabelTag,
    eWarningAgreeBtnTag,
}WarningViewTag;

typedef enum
{
    eProfileHeaderViewTag = 1000,
    eProfileHeaderLabelTag,
    eProfileBackBtnTag,
    eProfileTableViewTag,
}ProfileListViewTag;

typedef enum
{
    eNotAnApexInfoLabelTag = 1100,
    eNotAnApexBenifitsLabelTag,
    eNotAnApexTableViewTag,
    eNotAnApexHeaderViewTag,
    eNotAnApexHeadeHeaderLabelTag,
    eNotAnApexHeadeBackBtnTag,
    eNotAnApexHeadeTransaparentBtnTag,
    eNotAnApexBenefitsLabelTag,
    eNotAnApexBenefitsTabelTag,
    eNotAnApexCallImageTag,
    eNotAnApexSalesBtnTag,
    eNotAnApexBottemDeviderTag,
    eNotAnApexEmailImageTag,
    eNotAnApexEmailBtnTag,
}NotAnApexViewTag;


typedef enum
{
    eHomePersonalInfoViewTag = 1200,
    ePersonNameLabelTag,
    ePersonLocationLblTag,
    ePersonLocImgTag,
    eBalanceInfoViewTag,
    eBalanceInfoLblTag,
    eReserveHeaderLblTag,
    eReserveDataLblTag,
    eEfsHeaderLblTag,
    eEfsDataLblTag,
    eRequestReserveBtnTag,
    eFundReportDropDownBtnTag,
    eRecentScheduleDropDownBtnTag,
    eFundReportHeaderViewTag,
    eFundReportHeaderLblTag,
    eRecentScheduleHeaderLblTag,
    eRecentScheduleHeaderViewTag,
    eHeaderBgImgViewTag,
    eCustomTblTag,
    eMenuBtnTag,
    eApexImgViewTag,
    eNavViewTag,
    eScrollView,
    eLineViewTag,
    eBottomLineViewTag,
    eBalDropDownBtnTag,
    eBalInfoHeaderTag,
    eEFSTblTag,
    eScheduleTblTag,
    eHomeHeaderLabelTag,
    eHomeViewTransparentBtnTag,
    
    
}HomeViewComponentsTag;

typedef enum
{
    
    eSlideBgViewTag=300,
    eLogOutBtnTag,
    eSlideLogoImageViewTag,
    eSlideStaticTblHeaderViewTag,
    eSlideDynamicTblHeaderViewTag,
    eSlideHeaderStaticLblTag,
    eSlideHeaderDynamicLblTag,
    eSlideSectionHeaderBgImgViewTag,
    eSlideSectionHeaderLblTag,
    
}homeSlideComponentsTag;


typedef enum
{
    eReserveRequestHeaderViewTag = 1300,
    eReserveRequestHeaderLabeltag,
    eReserveRequestBtnTag,
    eReserveRequestTransaparentBtnTag,
    eReserveRequestTableViewTag,
}ReserveRequestTag;

typedef enum
{
    eReserveRequestDetailHeaderViewTag = 1400,
    eReserveRequestDetailHeaderLabeltag,
    eReserveRequestDetailBtnTag,
    eReserveRequestDetailTransaparentBtnTag,
    eReserveRequestDetailTableViewTag,
    eReserveRequestAmountTag,
    eReserveRequestInstructionTextViewTag,
    
}ReserveRequestDetailTag;

typedef enum
{
    eOptionsHeaderViewTag = 1500,
    eOptionsHeaderLabelTag,
    eOptionsFirstSectionTag,
    eOptionsFirstSectionLblTag,
    eOptionsUnregisterPinTag,
    eOptionsSecondSectionTag,
    eOptionsSecondSectionLblTag,
    eOptionsShowTaxPriceLblTag,
    eOptionsOnOffButtonTag,
    eOptionsLineImageViewTag,
    eOptionsMenuButtonTag,
    
}OptionsTag;

typedef enum
{
    eGiveFeedbackHeaderViewTag = 1600,
    eGiveFeedbackHeaderLabelTag,
    eGiveFeedbackBackButtonTag,
    eGiveFeedbackIdeaButtonTag,
    eGiveFeedbackHappyButtonTag,
    eGiveFeedbackSadButtonTag,
    eGiveFeedbackBugButtonTag,
    eGiveFeedbackClearButtonTag,
    eGiveFeedbackSendButtonTag,
    eGiveFeedbackTextfeildTag,
    eGiveFeedbackDividerImageTag,
    
}GiveFeedbackTag;
typedef enum
{
    eCustomPopoverTransparentViewTag = 1700,
    eCustomPopoverViewTag,
    eCustomPopoverHeaderImageViewTag,
    eCustomPopoverHeaderLabelTag,
    eCustomPopoverInfoLabelTag,
    eCustomPopoverOKBtnTag,
    eCustomPopoverCancelBtnTag,
    eCustomPopoverAmountTextFieldTag,
    eCustomPopoverDollarImageViewTag,
    eCustomPopoverHeaderViewTag,
    eCustomPopoverLineImageViewTag,
    eCustomPopoverTextViewTag,
}CustomPopOverTag;

typedef enum
{
    eWithoutPermissionNameLabelTag = 1800,
    eWithoutPermissionFuelFinderBtnTag,
    eWithoutPermissionContactApexBtnTag,
    eWithoutPermissionCreditCheckBtnTag,
    eWithoutPermissionInfoLabelTag,
    eWithoutPermissionArrowImageViewTag,
    
}WithoutPermissionHomeViewTag;

typedef enum
{
    eCallFromInvoiceReview = 1900,
    eCallFromCreateInvoice,
    eCallFromViewInvoiceDetail,
    eCallFromNone,
    
}CallingSelectCustomerScreenType;

typedef enum
{
    eCallFromViewManageInvoice = 2800,
    eCallFromCreateSchedule,
    eCallFromInvoiceHome,
    
}CallingInvoiceReviewScreenType;

typedef enum
{
    eSaveInvoiceForLater = 2400,
    eCreateAnotherInvoice,
    eSubmitScheduleInvoice
}SaveInvoiceType;

typedef enum
{
    eCustomerNoMatchFound = 2100,
    eSubmitCreditCheck,
    eRequestMoreCredit,
    eFeedbackSubmit,
    eSubmitLocationProblem,
    eReportLocationProblem,
    eConfirmationForSaveInvoice,
    eConfirmationForCreateAnotherInvoice,
    eErrorToProceedToCreateInvoice,
    eUnregisterPin,
    eRequestAmountAlertMessage,
    eSuccessSubmitSchedule,
    eSuccessSubmitCompany,
    eReserveRequestRecieve,
    eCompanySubmitSuccessful,
    eRequestAmountSubmittedSuccess,
}PopOverType;


typedef enum
{
    eEMCStatusCodeType200 = 200 ,//OK
    eEMCStatusCodeType201,  //Created
    eEMCStatusCodeType202,  //Accepted
    eEMCStatusCodeType203,  //Non-Authoritative Information
    eEMCStatusCodeType204,  //No Content
    eEMCStatusCodeType205,  //Reset Content
    eEMCStatusCodeType206,  //Partial Content
    
}eEMCStatusCodeTypeSuccessful;
typedef enum
{
    eEMCStatusCodeType300 = 300, //Multiple Choices
    eEMCStatusCodeType301 , //Moved permanenetly
    eEMCStatusCodeType302 , //Found
    eEMCStatusCodeType303 , //See Other
    eEMCStatusCodeType304 , //Not modified
    eEMCStatusCodeType305 , //Use Proxy
    eEMCStatusCodeType306 , //Unused
    eEMCStatusCodeType307 , //Remporary Redirect
    
}eEMCStatusCodeTypeRedirection;

/***Client Error 4xx ***/
typedef enum
{
    eEMCStatusCodeType400 = 400, //Bad Request
    eEMCStatusCodeType401 , //Unuthorised
    eEMCStatusCodeType402 , //Payment required
    eEMCStatusCodeType403 , //Frobidden
    eEMCStatusCodeType404 , //Not found
    eEMCStatusCodeType405 , //Method not allowed
    eEMCStatusCodeType406 , //Not acceptable
    eEMCStatusCodeType407 , //Proxy authentication Required
    eEMCStatusCodeType408 , //Request Timeout
    eEMCStatusCodeType409 , //Conflict
    eEMCStatusCodeType410 , //Gone
    eEMCStatusCodeType411 , //Length Required
    eEMCStatusCodeType412 , //Precondition Failed
    eEMCStatusCodeType413 , //Request Entity Too Large
    eEMCStatusCodeType414 , //Request-URI Too Long
    eEMCStatusCodeType415 , //Unsupported Media Type
    eEMCStatusCodeType416 , //Requested Range Not Satisfiable
    eEMCStatusCodeType417 , //Expectation Failed
}eEMCStatusCodeTypeClientError;

/*** Server Error 5xx ***/
typedef enum
{
    eEMCStatusCodeType500 = 500, //Internal Server Error
    eEMCStatusCodeType501,  //Not Implemented
    eEMCStatusCodeType502,  //Bad Gateway
    eEMCStatusCodeType503, //Service Unavailable
    eEMCStatusCodeType504,//Gateway Timeout
    eEMCStatusCodeType505 ,//HTTP Version Not Supported
}eEMCStatusCodeTypeServerError;


//--------------------------Device Type Constants-------------------------------

#define kApexDeviceTypeIphone               [[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone
#define kApexDeviceTypeIpad                 [[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPad

#define kApexDeviceOrientationIsPortrait    UIDeviceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])
#define kApexDeviceOrientationIsLandscape   UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])

//--------------------------Network Activity & Orientation Constants-------------------------------

#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO

#define UIAppDelegate               ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//----------------------------------  Constants  ---------------------------

#pragma mark - Constants
#define kWebServiceURL      @"https://clientsbeta.apexcapitalcorp.com/m3clients/mobile"

#define kNumberOfPinAttempt 5
#define kUserAgreementID        @"UserAgreement"

#define kUnassigned @"Unassigned"
#define kOpen       @"Open"
#define kClosed     @"Closed"
#define kAll        @"All"

#define kSubmitted          @"Submitted"
#define kUnsubmitted        @"Unsubmitted"

// Login
#define kUsername           @"Username"
#define kPassword           @"Password"
#define kDocumentID         @"DocumentID"
#define kIsAccepted         @"IsAccepted"

////Dial Directory
//#define kApexMainLine               @"Apex Main Line"
//#define kCreditDepartment           @"Credit Department"
//#define kIntegratedService          @"Integrated Services"
//#define kSales                      @"Sales"
//#define kDeviceNotSupportForCall    @"This device does not support to make the call."
//
//// Loading
//#define LoadingMessage      @"Loading..."
//
//// Alert
//#define kAlertOk            @"OK"
#define kAppName            @"Apex"
//#define kHeaderInternetConnection       @"Internet Connection"
//#define kMessageInternetConnection      @"Internet Connection"

//// PIN
//#define kPlaceholderText                @"Please enter your PIN"
//#define kPlaceholderConfirmationText    @"Please enter confirmation PIN"
//#define kUnregisterPin                  @"Your PIN is unregistered."
//#define kRegisterPin                    @"You will be prompted to register your PIN after your next login."
//
//// Login
//#define kUsernamePasswordRequired   @"Please enter the Username and Password for Login."
//#define kUsernameRequired           @"Please enter the Username for Login."
//#define kPasswordRequired           @"Please enter the Password for Login."
//
//// Mail
//#define kMailNotConfigured          @"Device is not configured the Mail account."
//#define kMailNotAnApexToAddress     @"info@apexcapitalcorp.com"
//#define kMailContactApexToAddress   @"kim.ramsey@apexcapitalcorp.com"

//Feedback
#define kFeedbackType               @"FeedbackType"
#define kFeedbackText               @"FeedbackText"
//#define kFeedbackSuccess            @"Feedback submitted"

//Dial Directory
#define kDailDirectoryVC        @"DailDirectory"
#define kContactApexVC          @"ContactApex"

//Reserve Request
#define kRequestBankId                  @"BankId"
#define kRequestAmount                  @"Amount"
#define kRequestSendNow                 @"SendNow"
#define kRequestInstruction             @"Instructions"
#define kLoginRequired @"loginRequired"
//#define kAlertSuccessHeader     @"Success!"
//#define kAlertSuccessMessage    @"We have received your request. If this is after business hours or after Apex cut-off times, your request will be processed on the next business day."

//Options

//#define kAlertRegistrationMessage   @"Registration"

#define kNavigationBarColor      [UIColor colorWithRed:65.0f/255 green:94.0f/255 blue:171.0f/255 alpha:1]
#define kColorWithRGB_74_74_74   [UIColor colorWithRed:74.0f/255 green:74.0f/255 blue:74.0f/255 alpha:1]

//----------------------------------  Webservice Method Constants  ---------------------------
#pragma mark - Webservice Method Constants

#define kLoginWebservice                    @"/mobileLogin.action"
#define kGetAgreementDocumentWebservice     @"/getDocument.action"
#define kGetAcknowledgeDocumentWebservice   @"/ackDocument.action"
#define kGetProfileListWebservice           @"/listProfiles.action"
#define kGetProfileDetailWebservice         @"/getProfileDetails.action"
#define kSendFeedbackWebservice             @"/sendFeedback.action"
#define kPermissionWebservice               @"/getRoles.action"
#define kGetFundingReportWebservice         @"/getFundingReport.action"
#define kGetRecentScheduleWebservice        @"/getRecentSchedules.action"
#define kSendRequestReserveWebservice       @"/reserveRequest.action"
#define kRecentCreditCheckWebservice        @"/recentCreditChecks.action"
#define kNewViewCreditCheckWebservice       @"/viewCreditCheck.action"
#define kSearchCompanyWebservice            @"/debtorSearch.action"
#define kDebtorDetailWebservice             @"/getDebtorDetails.action"
#define kGetAccountInfoWebservice           @"/getAccountInfo.action"
#define kSubmitCreditCheckWebservice        @"/creditCheckSubmit.action"
#define kSubmitDebtorWebservice             @"/submitNewDebtor.action"
#define kGetAdditionalCreditWebservice      @"/getAdditionalCredit.action"
#define kGetFuelFinderListWebservice        @"/getFuelLocations.action"
#define kGetCityAndStateListWebservice      @"/getCityState.action"
#define kGetFuelFinderListForSourceAndDestinationWebservice        @"/getFuelLocationsForRoute.action"
#define kRecentOnlineInvoiceDebtorsWebservice   @"/getRecentOIDebtors.action"

//Fuel Finder Added by Hemareddy Halli on 07th Jan 2015
#define kTaxExampleDocumentID               @"documentId=ExtaxInfo"
#define kFuelFinderTaxExampleWebService     @"/getDocument.action"
#define kHTMLFragment                       @"htmlFragment"
//ends by Hemareddy Halli on 07th Jan 2015

//Report Action Names by Hemareddy Halli on 05th Jan 2015
#define kGetAgingReportWebService           @"/getInvoiceAging.action"
#define kGetConcentrationReportWebService   @"/getConcentrationReport.action"
#define kGetRecentPaymentReportWebService   @"/getRecentPayments.action"

#define kInvoices                           @"invoices"
#define kInvoiceAging                       @"invoiceAging"
#define kConcentrationReport                @"concentrationReport"
#define kRecentPayments                     @"recentPayments"
#define kTimeFrame                          @"timeFrame"
#define kBalance                            @"balance"
#define kAge                                @"age"
#define kCheckNum                           @"checkNum"
#define kFactoredPayment                    @"factoredPayment"
#define kInvoiceNum                         @"invoiceNum"
#define kPaymentIssue                       @"paymentIssue"
#define KPostDate                           @"postDate"
#define kRefNum                             @"refNum"
#define kPromotionDate                      @"promotionDate"

//ends by Hemareddy Halli on 05th Jan 2015

//Notification related by Hemareddy Halli on 13th Jan 2015
#define kSavedNotifications                     @"SavedNotifications.plist"

typedef enum
{
    eCreditCheckNotificationType,
    eTruckStopPricePromosNotificationType,
    eGenericTruckStopPromosNotificationType,
    eGenericInformationalNotificationType
}RemoteNotificationType;

#define kAps                                    @"aps"
#define kPID                                    @"pId"
#define kPType                                  @"pType"
#define kAlert                                  @"alert"
#define kNotificationReceivedDate               @"notificationReceivedDate"
#define kRemoteNotificationRead                 @"RemoteNotificationRead"
#define kFuelStopId                             @"fuelStopId"
#define kPostFuelStationDetailWebService        @"/getFuelLocation.action"
#define kTruckStop                              @"truckStop"
#define kRegisterRemoteNotificationWebService   @"/addPushDevice.action"
#define kDeviceId                               @"deviceId"
#define kDeviceToken                            @"deviceToken"
#define kDeviceType                             @"deviceType"
#define kDeviceTypeValue                        @"ios"
#define kShowDiscounts                          @"showDiscounts"
#define kGenericNotificationIconName            @"generic_notification_ico_MP"
#define kGenericTruckStopNotificationIconName       @"generic_truckstop_ico_MP"
#define kCreditCheckResultNotiicationIconName       @"credit_approved_ico_MP"
#define kTruckStopPromoNotificationIconName         @"truck_stop_ico_MP"
#define kTruckStopPromosNotificationName        @"TruckStopPromos"
#define kCreditCheckResultNotificationName      @"CreditCheckResult"
#define kGenericTruckStopNotificationName       @"GenericTruckStop"
#define kGenericNotificationName                @"GenericInformation"
#define kTruckStopIDNotFound                    @"Truck Stop ID not Found"
#define kTruckStprPromosDetail                  @"TruckStopDetail"
//ends by Hemareddy Halli on 13th Jan 2015


//InVoice Action Names by Hemareddy Halli on 25th Dec 2014
#define kPostSaveInvoiceWebService                      @"/saveInvoice.action"
#define kGet10MostRecentCustomersWebService             @"/getRecentOIDebtors.action"
#define kGet20MostActiveCustomersWebService             @"/getLargestDebtors.action"
#define kGetUnassignedInvoicesWebService                @"/getUnassignedInvoices.action"
#define kGetAccessorialsTypesWebService                 @"/getAccessorialTypes.action"
#define kGetApexTimeWebService                          @"/getApexTime.action"
#define kGetNextInvoiceNumberWebService                 @"/getNextInvoiceNumber.action"
#define kGetScheduleNumberWebService                    @"/getNextScheduleNumber.action"
#define kPostSearchInvoicesWebService                   @"/searchInvoices.action"
#define kSubmitScheduleWebService                       @"/submitOnlineSchedule.action"
#define kPostAcceptOnlineSubmissionTermsWebService      @"/acceptOnlineSubmissionTerms.action"
#define kPostRemoveImageFromInvoiceWebService           @"/removeImageFromInvoice.action"
#define kGetScheduleFundingTypes                        @"/getScheduleFundingTypes.action"
#define kTruckStopPromosWebService                      @"/getPromotedFuelLocations.action"

#define kCCID                       @"ccId"
#define kInvoiceDate                @"invoiceDate"
#define kReferenceNumber            @"referenceNumber"
#define kLineHaulAmount             @"lineHaulAmount"
#define kLineItems                  @"lineItems"
//#define kOiLneTypeID                @"oiLineTypeId"
#define kInvoiceNumber              @"invoiceNumber"
#define kOiID                       @"oiId"

#define kAccessorials               @"accessorials"
#define kAccessorialCode            @"code"
#define kDescription                @"description"
#define kOiLineTypeId               @"oiLineTypeId"
#define kAccessorialOperator        @"operator"

#define kOnlineInvoices             @"onlineInvoices"
#define kOnlineInvoice             @"onlineInvoice"

#define kAmount                     @"amount"
#define kCustomer                   @"customer"
#define kInvoiceDate                @"invoiceDate"
#define kScheduleNumber             @"scheduleNumber"
#define kStatus                     @"status"
#define kOnlineInvoiceImages        @"onlineImages"

#define kClientID                   @"cliId"
#define kCreated                    @"created"
#define kImageURL                   @"imageUrl"
#define kOIImageID                  @"oiImgId"
#define kOIUserID                   @"olUsrId"
#define kPageNumber                 @"pageNum"
#define kThumbnailURL               @"thumbnailUrl"
#define kUserID                     @"usrId"

#define kFundingTypes               @"fundingTypes"
#define kDisplayOrder               @"displayOrder"
#define kOnlineInvoiceScheduleFundlingTypeID @"oiSchFundTypeId"
#define kOrderBy                    @"orderBy"
#define kLocation                   @"where"
#define kApexTime                   @"apexTime"
#define kSameDayCutoffTime          @"sameDayCutoffTime"
#define kNextDayCutoffTime          @"nextDayCutoffTime"

#define kCheckCutoffTime            @"checkCutoffTime"
#define kComCheckCutoffTime         @"comCheckCutoffTime"
#define kEFSCutoffTime              @"efsCutoffTime"
#define kNextBusinessDate           @"nextBusinessDay"
#define kNextBusinessDayNextDayCutoffTime                   @"nextBusinessDayNextDayCutoffTime"
#define kNExtBusinessDaySameDayCutoffTime                   @"nextBusinessDaySameDayCutoffTime"
#define kNextNextBusinessDate       @"nextNextBusinessDay"
#define kWireAchCutoffTime          @"wireAchCutoffTime"


#define kRecentDebtors              @"recentDebtors"
#define kLargestDebtors             @"largestDebtors"
#define kCreditCheckDate            @"creditCheckDate"
#define kCreditCheckStatus          @"creditCheckStatus"
#define kOverrideAmount             @"overrideAmount"
#define kOverrideDate               @"overrideDate"
#define kOverrideFlag               @"overrideFlag"
#define kOverrideMessage            @"overrideMessage"
#define kOverrideStatus             @"overrideStatus"
#define kCost                       @"cost"
#define kOiLineId                   @"oiLineId"
#define kOnlineInvLineItemType      @"onlineInvLineItemType"

//ends by Hemareddy Halli on 25th Dec 2014

// Fonts
#define kLatoRegularFontName        @"Lato-Regular"
#define kLatoBoldFontName           @"Lato-Bold"
#define kLatoItalicFontName         @"Lato-Italic"

//Color
#define kColorWithRGB_41_41_41  [UIColor colorWithRed:41.0f/255 green:41.0f/255 blue:41.0f/255 alpha:1]
#define kColorWithRGB_95_95_95  [UIColor colorWithRed:95.0f/255 green:95.0f/255 blue:95.0f/255 alpha:1]
#define kColorWithRGB_74_74_74   [UIColor colorWithRed:74.0f/255 green:74.0f/255 blue:74.0f/255 alpha:1]
#define kColorWithRGB_71_71_71  [UIColor colorWithRed:71.0f/255 green:71.0f/255 blue:71.0f/255 alpha:1]
#define kColorWithRGB_109_109_109   [UIColor colorWithRed:109.0f/255 green:109.0f/255 blue:109.0f/255 alpha:1]
#define kColorWithRGB_209_209_209   [UIColor colorWithRed:209.0f/255 green:209.0f/255 blue:209.0f/255 alpha:1]
#define kColorWithRGB_135_135_135   [UIColor colorWithRed:135.0f/255 green:135.0f/255 blue:135.0f/255 alpha:1]
#define kColorWithRGB_184_184_184   [UIColor colorWithRed:184.0f/255 green:184.0f/255 blue:184.0f/255 alpha:1]

#define kColorWithRGB_204_204_204   [UIColor colorWithRed:204.0f/255 green:204.0f/255 blue:204.0f/255 alpha:1]
#define kColorWithRGB_65_94_171   [UIColor colorWithRed:65.0f/255 green:94.0f/255 blue:171.0f/255 alpha:1]
#define kColorOfApprovedStatus      [UIColor colorWithRed:46.0f/255 green:204.0f/255 blue:113.0f/255 alpha:1]
#define kColorOfDeclinedStatus      [UIColor colorWithRed:237.0f/255 green:84.0f/255 blue:100.0f/255 alpha:1]
#define kColorOfPendingStatus      [UIColor colorWithRed:239.0f/255 green:180.0f/255 blue:37.0f/255 alpha:1]
#define kColorOfNegativeValue       [UIColor colorWithRed:170.0f/255 green:68.0f/255 blue:51.0f/255 alpha:1]
#define kColorOfBorderColor       [UIColor colorWithRed:162.0f/255 green:165.0f/255 blue:165.0f/255 alpha:1]


//----------------------------------  UserDefaults Constants  ---------------------------
#pragma mark - UserDefaults Constants

#define kUserDefaults                               ([NSUserDefaults standardUserDefaults])
#define kSessionID                                  @"SessionID"
#define kFriendlyName                               @"FriendlyName"
//#define kRequiredDocuments                          @"RequiredDocumnets"
#define kIsPinRegistered                            @"IsPinRegistered"
#define kIsScheduleLegalDocumentAccepted            @"IsScheduleLegalDocumentAccepted"
#define kIsComingFromInvoiceReview                  @"IsComingFromInvoiceReview"

#define kIsFirstLaunch                              @"IsFirstLaunch"
#define kActionError                                @"ActionErrors"
#define kIsPinConfirmed                             @"IsPinConfirmed"
#define kPin                                        @"Pin"
#define kProfileId                                  @"ProfileId"
#define kIsMultipleAccount                          @"isMultipleAccount"
#define kCompanyName                                @"CompanyName"
#define kMCNumber                                   @"MC"
#define kFFNumber                                   @"FF"
#define kState                                      @"state"
#define kPhoneNumber                                @"PhoneNumber"
#define kApproved                                   @"Approved"
#define kDeclined                                   @"Declined"
#define kPending                                    @"Pending Credit"
#define kIsFuelFirstTimeLaunch                      @"FuelFirstTimeLaunch"

#define kPermissionSchedules                        @"schedules"
#define kPermissionSchedulesView                    @"schedules.view"
#define kPermissionReports                          @"reports"
#define kPermissionBalances                         @"balances"
#define kPermissionReportsPayment                   @"reports.payments"
#define kPermissionReportsFunding                   @"reports.funding"
#define kPermissionReportsReserve                   @"reports.reserve"
#define kPermissionReportsAging                     @"reports.aging"
#define kPermissionReportConcentration              @"reports.concentration"
#define kPermissionReportsPurchase                  @"reports.purchase"
#define kPermissionReportsUnresolvedIssues          @"reports.unresolved.issues"
#define kPermissionOnlineInv                        @"onlineinv"
#define kPermissionOnlineInvCreateSchedule          @"onlineinv.create.schedule"
#define kPermissionOnlineInvImageUpload             @"onlineinv.image.upload"
#define kPermissionOnlineInvMailSubmit              @"onlineinv.submit.mail"
#define kPermissionOnlineInvOnlineSubmit            @"onlineinv.submit.online"
#define kPermissionCreditCheck                      @"credit.check"
#define kPermissionCreditCheckView                  @"credit.check.view"
#define kPermissionCreditCheckSubmit                @"credit.check.submit"
#define kPermissionCreditCheckAdditional            @"credit.check.additional"
#define kPermissionSelfFund                         @"self.fund"
#define kPermissionSelfFundWrite                    @"self.fund.wire"
#define kPermissionSelfFundAch                      @"self.fund.ach"
#define kPermissionSelfFundEfs                      @"self.fund.efs"
#define kPermissionSelfFundTChek                    @"self.fund.t-chek"
#define kPermissionSelfFundTch                      @"self.fund.tch"
#define kPermissionIntegratedService                @"integrated.services"
#define kPermissionIntegratedServiceBillable        @"integrated.services.billable"
#define kPermissionIntegratedServiceTrippack        @"integrated.services.trippak"
#define kPermissionIntegratedServiceFuelDiscount    @"integrated.services.fuel.discounts"
#define kPermissionSmartScan                        @"smart.scan"
#define kPermissionSmartScanOnlineInvoice           @"smart.scan.online.invoice"
#define kPermissionSmartScanInvoice                 @"smart.scan.invoice"

#define kProfileUsername                            @"ProfileUserName"
#define kProfileLocation                            @"ProfileLocation"
#define kInNetworkOnly                              @"NetworkOnly"
#define kRadius                                     @"Radius"
#define kSortBy                                     @"SortBy"
#define kAvoidToll                                  @"AvoidToll"
#define kAvoidHighway                               @"AvoidHighway"
#define kIsFilterApplied                            @"FilterApplied"
#define kIsClearFilterApplied                       @"ClearFilter"
#define kShowExTaxPrice                             @"ShowExTax"
//----------------------------------  Webservice Constants  ---------------------------
#pragma mark - Webservice Constants

#define kWebServiceSessionID                @"sessionId"
#define kWebServiceUsername                 @"username"
#define kWebServicePassword                 @"password"
#define kWebServiceFriendlyname             @"name"
#define kWebServiceRequiredDocuments        @"requiredDocs"
#define kWebServiceDocumentID               @"documentId"
#define kWebServiceDocumentData             @"htmlFragment"
#define kWebServiceDocumentAcceptanceStatus @"status"
#define kWebServiceCompanyName              @"companyName"
#define kWebServiceProfiles                 @"profiles"
#define kWebServiceCity                     @"city"
#define kWebServiceState                    @"state"
#define kWebServiceProfileID                @"profileId"
#define kWebServiceAccepted                 @"accepted"
#define kWebServiceActionErrors             @"actionErrors"
#define kWebServicePersonalInfo             @"aeInfo"
#define kWebServiceEmailId                  @"email"
#define kWebServiceExtension                @"ext"
#define kWebServiceGroupEmailId             @"groupEmail"
#define kWebServiceName                     @"name"
#define kWebServicePhoneNumber              @"phone"
#define kWebServiceCompanyId                @"companyId"
#define kWebServiceBalances                 @"balances"
#define kWebServiceBankNumbers              @"bankNumbers"
#define kWebServiceValue                    @"value"
#define kWebServiceAccountNumber            @"accountNumber"
#define kWebServiceType                     @"type"
#define kWebServiceBankId                   @"banId"
#define kWebServiceFundingReport            @"fundingReport"
#define kWebServiceAmount                   @"amount"
#define kWebServiceDate                     @"date"
#define kWebServiceMethod                   @"method"
#define kWebServiceNote                     @"note"
#define kWebServicePaymentNumber            @"paymentNumber"
#define kWebServiceRoles                    @"roles"
#define kWebServiceCode                     @"code"
#define kWebServiceHidden                   @"hidden"
#define kWebServiceRecentSchedules          @"recentSchedules"
#define kWebServiceAdvanceAmount            @"advanceAmount"
#define kWebServiceEntryDate                @"entryDate"
#define kWebServiceInvoiceCount             @"invoiceCount"
#define kWebServiceInvoiceTotal             @"invoiceTotal"
#define kWebServicePurchaseDate             @"purchaseDate"
#define kWebServiceSameDay                  @"sameDay"
#define kWebServiceScheduleNumber           @"scheduleNum"
#define kWebServiceStatus                   @"status"
#define kWebServiceProfile                  @"profile"
#define kWebserviceFeedbackType             @"feedbackType"
#define kWebserviceFeedbackText             @"feedbackText"
#define kWebserviceDeviceName               @"device[name]"
#define kWebserviceDevicePlatform           @"device[platform]"
#define kWebserviceDeviceModel              @"device[model]"
#define kWebserviceDeviceVersion            @"device[version]"
#define kWebserviceSendNow                  @"sendNow"
#define kWebserviceInstructions             @"instructions"
#define kWebserviceMaxResults               @"maxResults"
#define kWebserviceCreditChecks             @"creditChecks"
#define kWebserviceCreditApproved           @"creditApproved"
#define kWebserviceCreditCheckId            @"creditCheckId"
#define kWebserviceCreditLimit              @"creditLimit"
#define kWebserviceDebtorId                 @"debtorId"
#define kWebserviceDebtorName               @"debtorName"
#define kWebserviceCreditMessage            @"message"
#define kWebserviceCreditOverride           @"override"
#define kWebserviceRequestedBy              @"requestedBy"
#define kWebserviceCreditStatus             @"status"
#define kWebserviceTimeOfRequest            @"timeOfRequest"
#define kWebserviceAdditionalCreditRequest  @"additionalCreditRequest"
#define kWebserviceRecourse                 @"recourse"
#define kWebserviceCreditCheck              @"creditCheck"
#define kWebserviceDeclineReasons           @"declinedReasons"
#define kWebserviceCreditCheckNote          @"creditCheckNote"
#define kWebservicePaymentRecords           @"paymentInfoRecords"
#define kWebserviceCreditAlert              @"creditAlert"
#define kWebserviceRiskNote                 @"riskLevelNote"
#define kWebserviceDebId                    @"debId"
#define kWebserviceCountTotal               @"countTotal"
#define kWebserviceCount91Plus              @"count91Plus"
#define kWebserviceCount46to60              @"count46to60"
#define kWebserviceChargebackTotal          @"chargebackTotal"
#define kWebserviceCount00to30              @"count00to30"
#define kWebserviceCount61to90              @"count61to90"
#define kWebserviceCount31to45              @"count31to45"
#define kWebserviceYear                     @"year"
#define kWebserviceMCNumber                 @"mc"
#define kWebserviceFFNumber                 @"ff"
#define kWebserviceCustomerPhoneNumber      @"phoneNumber"
#define kWebserviceDebtors                  @"debtors"
#define kWebserviceAddress                  @"address"
#define kWebserviceDba                      @"dba"
#define kWebserviceBusinessType             @"businessType"
#define kWebserviceFax                      @"fax"
#define kWebserviceId                       @"id"
#define kWebserviceMailAddress              @"mailAddress"
#define kWebserviceMailCity                 @"mailCity"
#define kWebserviceMailState                @"mailState"
#define kWebserviceMailZip                  @"mailZip"
#define kWebserviceParentId                 @"parentId"
#define kWebserviceZip                      @"zip"
#define kWebserviceRelationship             @"relationship"
#define kWebserviceDebtor                   @"debtor"
#define kWebserviceAccountInfo              @"accountInfo"
#define kWebserviceCreationDate             @"creationDate"
#define kWebserviceOpenBalance              @"openBalance"
#define kWebserviceCreditRemaining          @"creditRemaining"
#define kWebserviceConcentrationPercent     @"concentrationPercent"
#define kWebserviceClosedInvoices           @"closedInvoices"
#define kWebserviceFirstInvoiceDate         @"firstInvoiceDate"
#define kWebserviceLastInvoiceDate          @"lastInvoiceDate"
#define kWebserviceRequestedAmount          @"requestAmount"
#define kCompanyRequestedAmount             @"requestedAmount"
#define kWebserviceCCId                     @"ccId"
#define kWebserviceTruckStops               @"truckstops"
#define kWebserviceTruckStopsWithCapitalS   @"truckStops"
#define kWebserviceApexPrice                @"apexPrice"
#define kWebserviceATM                      @"atm"
#define kWebserviceChain                    @"chain"
#define kWebserviceDistance                 @"distance"
#define kWebserviceEffectiveDate            @"effectiveDate"
#define kWebserviceFuelStationID            @"id"
#define kWebserviceinNetwork                @"inNetwork"
#define kWebserviceLatitude                 @"latitude"
#define kWebserviceLongitude               @"longitude"
#define kWebserviceLocation                 @"location"
#define kWebserviceMinorRepairs             @"minorRepairs"
#define kWebservicePosted                   @"posted"
#define kWebserviceRestaurants              @"restaurants"
#define kWebserviceRetailPrice              @"retailPrice"
#define kWebserviceScales                   @"scales"
#define kWebserviceShowers                  @"showers"
#define kWebserviceSignName                 @"signName"
#define kWebserviceStateFuelTax             @"stateFuelTax"
#define kWebserviceTireRepair               @"tireRepair"
#define kWebserviceRangeInMiles             @"rangeInMiles"
#define kWebserviceQueryString              @"q"
#define kWebserviceResults                  @"results"
#define kWebserviceSortBy                   @"sortBy"
#define kWebserviceNetworkOnly              @"inNetworkOnly"
#define kWebserviceNorthEastBounds          @"northEast"
#define kWebserviceSouthWestBounds          @"southWest"
#define kWebserviceEncodedPolylines         @"encodedPolyLines"
#define kWebserviceFuelStationLatitude      @"userLat"
#define kWebserviceFuelStationLongitude     @"userLong"
#define kWebserviceFuelStationStopId        @"Stop-Id"
#define kWebserviceFuelStationName          @"Name"
#define kWebserviceFuelStationState         @"State"
#define kWebserviceFuelStationCity          @"City"
#define kWebserviceOverrideAmount           @"overrideAmount"
#define kWebserviceOverrideDate             @"overrideDate"
#define kWebserviceOverrideFlag             @"overrideFlag"
#define kWebserviceOverrideMessage          @"overrideMessage"
#define kWebserviceOverrideStatus           @"overrideStatus"
#define kWebserviceCreditCheckDate          @"creditCheckDate"
#define kWebserviceSearchInvoiceStartDate   @"startDate"
#define kWebserviceSearchInvoiceEndDate     @"endDate"
#define kWebserviceSearchInvoiceScheduleNumber     @"scheduleNumber"
#define kWebserviceSearchInvoiceInvoiceNumber     @"invoiceNumber"
#define kWebserviceSearchInvoiceCustomerName     @"customerName"
#define kWebserviceSearchInvoiceReferencenumber     @"referenceNumber"
#define kWebserviceSearchInvoiceStatus     @"status"
#define kWebserviceSearchInvoiceScheduleName      @"scheduleName"
#define kWebserviceInvoiceSpecialInstructions   @"specialInstructions"
#define kWebserviceInvoiceFundId                @"fundTypeId"
#define kFundings                               @"fundings"


//----------------------------------  Analytics Screen and Event Names  ---------------------------
#pragma mark - Analytics Screen and Event Names
#define kLoginScreenName     @"screen.login"
#define kLoginEvent          @"login.Login"
#define kLoginQuickDialEvent @"login.QuickDial"
#define kLoginNotAnApexEvent @"login.NotAnApex"
#define kLoginPinLoginEvent  @"login.PinLogin"
#define kLoginBackEvent      @"login.Back"

#define kQuickDialDirectoryScreen @"screen.quickdial"
#define kQuickDialDirectoryBackEvent @"quickdial.Back"
#define kQuickDialDirectoryMainLineEvent @"quickdial.call.MainLine"
#define kQuickDialDirectoryCreditDepartEvent @"quickdial.call.CreditDepart"
#define kQuickDialDirectoryIntegratedServiceEvent @"quickdial.call.IntegratedService"
#define kQuickDialDirectorySalesDepartEvent @"quickdial.call.SalesDepart"

#define kPinLoginConfirmationScreen     @"screen.pinlogin.confirmation"
#define kPinLoginConfirmationNoEvent     @"pinlogin.confirmation.No"
#define kPinLoginConfirmationYesEvent     @"pinlogin.confirmation.Yes"

#define kPinLoginRegistrationScreen     @"screen.pinlogin.registration"
#define kPinLoginRegistrationBackEvent     @"pinlogin.registration.Back"
#define kPinLoginRegistrationLoginEvent     @"pinlogin.registration.Login"
#define kPinLoginRegistrationDeleteEvent     @"pinlogin.registration.DeleteKey"
#define kPinLoginRegistrationEnterEvent     @"pinlogin.registration.EnterKey"

#define kProfileScreen @"screen.profiles"
#define kProfileBackEvent @"profiles.Back"
#define kProfileSelectEvent @"profiles.Select"

#define kHomeScreen @"screen.home"
#define kHomeRequestReserve @"home.Request.Reserve"
#define kHomeFundingReport @"home.Funding.Report"
#define kHomeRecentSchedules @"home.Recent.Schedules"
#define kHomeDrawerMenu @"home.DrawerMenu"

#define kRequestReserveAccountListScreen @"screen.requestreserve.accountlist"
#define kRequestReserveAccountListSelectEvent @"requestreserve.accountlist.Select"
#define kRequestReserveAccountListBackEvent @"requestreserve.accountlist.Back"

#define kRequestReserveScreen @"screen.requestreserve"
#define kRequestReserveSendnowEvent @"requestreserve.Sendnow"
#define kRequestReserveAttachToNextScheduleEvent @"requestreserve.AttachtoNextSchedule"
#define kRequestReserveCancelEvent @"requestreserve.Cancel"
#define kRequestReserveSubmitEvent @"requestreserve.Submit"
#define kRequestReserveSuccessOkEvent @"requestreserve.SuccessOk"

#define kNotAnApexScreenName @"screen.notanapex"
#define kNotAnApexCallEvent @"notanapex.call.Apex"
#define kNotAnApexEmailEvent @"notanapex.email.Apex"
#define kNotAnApexBackEvent @"notanapex.Back"

#define kFundingReportScreen @"screen.funding.report"
#define kFundingReportBackEvent @"funding.report.back"

#define kRecentSchedulesScreen @"screen.recent.schedules"
#define kRecentSchedulesBackEvent @"recent.schedules.back"

#define kFeedbackScreen @"screen.feedback"
#define kFeedbackIdeaEvent @"feedback.idea"
#define kFeedbackHappyEvent @"feedback.Happy"
#define kFeedbackSadEvent @"feedback.Sad"
#define kFeedbackBugEvent @"feedback.Bug"
#define kFeedbackClearEvent @"feedback.Clear"
#define kFeedbackSendEvent @"feedback.Send"

#define kRecentCreditCheckListScreen @"Screen.recent.credit.checks.list"
#define kRecentCreditCheckListNewEvent @"recent.credit.checks.New"
#define kRecentCreditCheckListSelectEvent @"recent.credit.checks.list.Select"
#define kRecentCreditCheckListDrawerMenuEvent @"recent.credit.checks.DrawerMenu"

#define kRecentCreditCheckSearchCompanyScreen @"Screen.creditcheck.searchcompany"
#define kRecentCreditCheckSearchCompanyClearEvent @"creditcheck.searchcompany.Clear"
#define kRecentCreditCheckSearchCompanySearchEvent @"creditcheck.searchcompany.Search"
#define kRecentCreditCheckSearchCompanyBackEvent @"creditcheck.searchcompany.Back"

#define kRecentCreditCheckSearchCompanyNoResultScreen @"Screen.creditcheck.searchcompany.no.matches.found"
#define kRecentCreditCheckSearchCompanyNoResultNoEvent @"creditcheck.searchcompany.no.matches.found.No"
#define kRecentCreditCheckSearchCompanyNoResultYesEvent @"creditcheck.searchcompany.no.matches.found.Yes"

#define kRecentCreditCheckSubmitCompanyScreen @"Screen.creditcheck.submit.company"
#define kRecentCreditCheckSubmitCompanyClearEvent @"creditcheck.submit.company.Clear"
#define kRecentCreditCheckSubmitCompanySubmitEvent @"creditcheck.submit.company.Submit"
#define kRecentCreditCheckSubmitCompanyBackEvent @"creditcheck.submit.company.Back"
#define kRecentCreditCheckSubmitCompanySuccessOkEvent @"creditcheck.submit.company.success.Ok"

#define kRecentCreditCheckFoundCustomersScreen @"Screen.creditcheck.found.customers"
#define kRecentCreditCheckFoundCustomersSelectEvent @"creditcheck.found.customers.Select"
#define kRecentCreditCheckFoundCustomersBackEvent @"creditcheck.found.customers.Back"

#define kRecentCreditCheckCustomersSummaryScreen @"Screen.creditcheck.customer.summary"
#define kRecentCreditCheckCustomersSummaryCustomerDetailEvent @"creditcheck.customer.summary.CustomerDetail"
#define kRecentCreditCheckCustomersSummaryCallEvent @"creditcheck.customer.summary.Call"
#define kRecentCreditCheckCustomersSummarySubmitEvent @"creditcheck.customer.summary.SubmitCreditCheck"
#define kRecentCreditCheckCustomersSummaryRecentCCSelectEvent @"creditcheck.customer.summary.recentcreditcheck.Select"
#define kRecentCreditCheckCustomersSummaryBackEvent @"creditcheck.customer.summary.Back"

#define kCreditCheckResultScreen @"Screen.credit.check.result"
#define kCreditCheckResultCustomerDetailEvent @"credit.check.result.CustomerDetail"
#define kCreditCheckResultReqMoreCreditEvent @"credit.check.result.RequestMoreCredit"

#define kCreditRequestMoreCreditScreen @"Screen.request.more.credit"
#define kCreditRequestMoreCrediSendEvent @"request.more.credit.Send"
#define kCreditRequestMoreCreditCancelEvent @"request.more.credit.Cancel"

#define kDrawerMenuScreen @"Screen.drawer.menu"
#define kDrawerMenuCreditEvent @"drawer.menu.Credit"
#define kDrawerMenuFuelFinderEvent @"drawer.menu.FuelFinder"
#define kDrawerMenuMobileInvoiceEvent @"drawer.menu.MobileInvoicing"
#define kDrawerMenuContactApexEvent @"drawer.menu.ContactApex"
#define kDrawerMenuHomeEvent @"drawer.menu.Home"
#define kDrawerMenuSelectProfileEvent @"drawer.menu.SelectProfile"
#define kDrawerMenuNotificationsEvent @"drawer.menu.Notifications"
#define kDrawerMenuApexDocumentEvent @"drawer.menu.ApexDocuments"
#define kDrawerMenuAgingReportEvent @"drawer.menu.AgingReport"
#define kDrawerMenuRecentPaymentsEvent @"drawer.menu.RecentPayments"
#define kDrawerMenuConcentrationReportEvent @"drawer.menu.ConcentrationReport"
#define kDrawerMenuFeedbackEvent @"drawer.menu.Feedback"
#define kDrawerMenuSettingsEvent @"drawer.menu.Settings"
#define kDrawerMenuLogoutEvent @"drawer.menu.Logout"

#define kDocumentListScreen @"Screen.apex.documents.list"
#define kDocumentListSelectEvent @"apex.documents.list.Select"

#define kDocumentListPreviewScreen @"Screen.apex.document.preview"
#define kDocumentListPreviewBackEvent @"apex.document.preview.Back"

typedef void (^GooglePlacesAutocompleteResultBlock)(NSArray *places, NSError *error);


#endif
