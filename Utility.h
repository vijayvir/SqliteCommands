//
//  Utility.h
//  TAPAMENI
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Static.h"
#import "CheckConnection.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface Utility : NSObject

+ (NSString *) getDBPath;
+ (void) copyDatabaseIfNeeded;

+(BOOL)checkOriantationIsIPhone;
+(BOOL)checkOriantationIsIPad;

+(void)showAlertWithMessage :(NSString*)message;
+(void)showAlertWithTitleAndMessage :(NSString*)title message:(NSString*)message;
+ (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max;
+ (UIColor *) getColor: (NSString *) hexColor;
+(BOOL) isValidEmaidId:(NSString *)str;
+(BOOL) isNumber:(NSString *)str;

+(NSMutableArray *)generateRandomUniqueNumberInRange :(int)rangeLow rangeHigh:(int)rangeHigh Capacity :(int)capacity;
+(void)createAndLoadBanner:(GADBannerView*)bannerView;
@end
