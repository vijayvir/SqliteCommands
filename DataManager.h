#import <Foundation/Foundation.h>
#import "Word.h"
#import "WordSimbolo.h"
#import "Static.h"
#import "AppDelegate.h"
@interface DataManager : NSObject

-(void)openDatabase;
+(void)insertData:(Word*)word;
+(NSMutableArray*)getAllData1;
+(NSMutableDictionary*)getAllData;
+(NSMutableArray*)getAllDataSimboli;
+(NSMutableArray*)getFevouriteAllData;
+(void)insertHistoryData:(Word*)word;
+(NSMutableArray*)getAllHistoryData;
+(void) deleteAllHistory;
+(void)updateFevoriteData:(Word *)word;
+(BOOL) IsFevouriteTableEmpty;
@end
