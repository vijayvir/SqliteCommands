#import "DataManager.h"
#import <sqlite3.h>
#import "Utility.h"
@implementation DataManager

static sqlite3 *database;

-(void)openDatabase
{
    [Utility copyDatabaseIfNeeded];
    sqlite3_open([[Utility getDBPath] UTF8String], &database);
}
#pragma mark get all data encrypted data
+(NSMutableArray*)getAllData1
{
    NSString *strSql = [NSString stringWithFormat:@"select id,lemma,categoria,importanza,service,html,is_favourite,ntable from tblDictionary ORDER BY lemma"];
   const char *sql = [strSql UTF8String];
    
    sqlite3_stmt *selectstmt;
    NSMutableArray *lemmiperlaricerca;

    if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
        lemmiperlaricerca = [[NSMutableArray alloc] init];
        while(sqlite3_step(selectstmt) == SQLITE_ROW) {
            Word *objWord = [[Word alloc] init];
            objWord.ID = sqlite3_column_int(selectstmt, 0);
            objWord.lemma =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)?(char *)sqlite3_column_text(selectstmt, 1):""];
            objWord.categoria =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)?(char *)sqlite3_column_text(selectstmt, 2):""];
            objWord.importanza =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)?(char *)sqlite3_column_text(selectstmt, 3):""];
            objWord.service =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 4)?(char *)sqlite3_column_text(selectstmt, 4):""];
            objWord.html = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 5)?(char *)sqlite3_column_text(selectstmt, 5):""];
            objWord.is_favourite = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 6)?(char *)sqlite3_column_text(selectstmt, 6):""];
            objWord.ntable = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 7)?(char *)sqlite3_column_text(selectstmt, 7):""];
            
            [lemmiperlaricerca addObject:objWord];
           
        }
        
    }
    return lemmiperlaricerca;

}
+(NSMutableDictionary*)getAllData
{
    NSString *strSql = [NSString stringWithFormat:@"select id,lemma,categoria,importanza,service,html,is_favourite,ntable from tblDictionary ORDER BY lemma"];
    const char *sql = [strSql UTF8String];
    sqlite3_stmt *selectstmt;
    //    NSMutableArray *lemmiperlaricerca;
    AppDelegate *appDelegate=[AppDelegate initAppDelegate];
    
    // Customization
    NSMutableDictionary *dict = [@{@"A" : [@[] mutableCopy],
                                   @"B" : [@[] mutableCopy],
                                   @"C" : [@[] mutableCopy],
                                   @"D" : [@[] mutableCopy],
                                   @"E" : [@[] mutableCopy],
                                   @"F" : [@[] mutableCopy],
                                   @"G" : [@[] mutableCopy],
                                   @"H" : [@[] mutableCopy],
                                   @"I" : [@[] mutableCopy],
                                   @"J" : [@[] mutableCopy],
                                   @"K" : [@[] mutableCopy],
                                   @"L" : [@[] mutableCopy],
                                   @"M" : [@[] mutableCopy],
                                   @"N" : [@[] mutableCopy],
                                   @"O" : [@[] mutableCopy],
                                   @"P" : [@[] mutableCopy],
                                   @"Q" : [@[] mutableCopy],
                                   @"R" : [@[] mutableCopy],
                                   @"S" : [@[] mutableCopy],
                                   @"T" : [@[] mutableCopy],
                                   @"U" : [@[] mutableCopy],
                                   @"V" : [@[] mutableCopy],
                                   @"W" : [@[] mutableCopy],
                                   @"X" : [@[] mutableCopy],
                                   @"Y" : [@[] mutableCopy],
                                   @"Z" : [@[] mutableCopy],
                                   } mutableCopy];
    NSMutableArray *arrHs = [@[] mutableCopy];
    NSArray *arrAlpha = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
        //        lemmiperlaricerca = [[NSMutableArray alloc] init];
        while(sqlite3_step(selectstmt) == SQLITE_ROW) {
            Word *objWord = [[Word alloc] init];
            objWord.ID = sqlite3_column_int(selectstmt, 0);
            objWord.lemma =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)?(char *)sqlite3_column_text(selectstmt, 1):""];
            objWord.categoria =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)?(char *)sqlite3_column_text(selectstmt, 2):""];
            objWord.importanza =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)?(char *)sqlite3_column_text(selectstmt, 3):""];
            objWord.service =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 4)?(char *)sqlite3_column_text(selectstmt, 4):""];
            objWord.html = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 5)?(char *)sqlite3_column_text(selectstmt, 5):""];
            objWord.is_favourite = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 6)?(char *)sqlite3_column_text(selectstmt, 6):""];
            objWord.ntable = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 7)?(char *)sqlite3_column_text(selectstmt, 7):""];
            NSString *key = [[objWord.lemma substringToIndex:1] uppercaseString];
            if ([arrAlpha containsObject:key])
            {
                [[dict valueForKey: key] addObject:objWord];
            }
            else
            {
                [arrHs addObject:objWord];
            }
            //            [lemmiperlaricerca addObject:objWord];
        }
    }
    
   appDelegate.allKeys = [[[dict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] mutableCopy];
 
   // appDelegate.allKeys = [[dict allKeys] sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"lemma" ascending:YES]]];
    
    
    // [self.lemmiperlaricerca sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"lemma" ascending:YES]]];
    
    //    Customization
    
    [dict setObject:arrHs forKey:@"#"];
    if ([appDelegate.allKeys containsObject:@"#"])
    {
        [appDelegate.allKeys removeObject:@"#"];
    }
    [appDelegate.allKeys insertObject:@"#" atIndex:appDelegate.allKeys.count];
    
    return dict;
}
//SEGUENTE FUNZIONE: BLOCCO AGGIUNTO PER GESTIRE DB SEZIONE SIMBOLI

+(NSMutableArray*)getAllDataSimboli
{
    NSString *strSqlSimboli = [NSString stringWithFormat:@"select id, lettura,img_simbolo,importanza_s,categoria_s,numero,ntable_s from tblSimboli"];
    const char *sqlSimboli = [strSqlSimboli UTF8String];
    sqlite3_stmt *selectstmtS;
    NSMutableArray *lemmiperlaricerca_s;
    if(sqlite3_prepare_v2(database, sqlSimboli, -1, &selectstmtS, NULL) == SQLITE_OK) {
        lemmiperlaricerca_s = [[NSMutableArray alloc] init];
        while(sqlite3_step(selectstmtS) == SQLITE_ROW) {
            WordSimbolo *objWordSimbolo = [[WordSimbolo alloc] init];
            objWordSimbolo.ID = sqlite3_column_int(selectstmtS, 0);
            objWordSimbolo.lettura =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmtS, 1)?(char *)sqlite3_column_text(selectstmtS, 1):""];
            objWordSimbolo.img =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmtS, 2)?(char *)sqlite3_column_text(selectstmtS, 2):""];
            objWordSimbolo.importanza =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmtS, 3)?(char *)sqlite3_column_text(selectstmtS, 3):""];
            objWordSimbolo.categoria =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmtS, 4)?(char *)sqlite3_column_text(selectstmtS, 4):""];
            objWordSimbolo.numero = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmtS, 5)?(char *)sqlite3_column_text(selectstmtS, 5):""];
            objWordSimbolo.ntable = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmtS, 6)?(char *)sqlite3_column_text(selectstmtS, 6):""];
            
            [lemmiperlaricerca_s addObject:objWordSimbolo];
        }
    }
    return lemmiperlaricerca_s;
}




#pragma mark get all fevourite data
+(NSMutableArray*)getFevouriteAllData
{
    NSString *strSql = [NSString stringWithFormat:@"select id, lemma,categoria,importanza,service,html,is_favourite,ntable from tblDictionary where is_favourite='y'"];
    const char *sql = [strSql UTF8String];
    sqlite3_stmt *selectstmt;
    NSMutableArray *lemmiperlaricerca;
    if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
        lemmiperlaricerca = [[NSMutableArray alloc] init];
        while(sqlite3_step(selectstmt) == SQLITE_ROW) {
            Word *objWord = [[Word alloc] init];
            objWord.ID = sqlite3_column_int(selectstmt, 0);
            objWord.lemma =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)?(char *)sqlite3_column_text(selectstmt, 1):""];
            objWord.categoria =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)?(char *)sqlite3_column_text(selectstmt, 2):""];
            objWord.importanza =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)?(char *)sqlite3_column_text(selectstmt, 3):""];
            objWord.service =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 4)?(char *)sqlite3_column_text(selectstmt, 4):""];
            objWord.html = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 5)?(char *)sqlite3_column_text(selectstmt, 5):""];
            objWord.is_favourite = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 6)?(char *)sqlite3_column_text(selectstmt, 6):""];
            objWord.ntable = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 7)?(char *)sqlite3_column_text(selectstmt, 7):""];
            
             [lemmiperlaricerca addObject:objWord];
            
        }
    }
    return lemmiperlaricerca;
}

#pragma mark History
+(void)insertHistoryData:(Word*)word
{
    NSString *strSql = [NSString stringWithFormat:@"DELETE FROM tblHistory where lemma = '%@'",word.lemma];
    const char *sql1 = [strSql UTF8String];
    sqlite3_stmt *selectstmt;
    if(sqlite3_prepare_v2(database, sql1, -1, &selectstmt, NULL) == SQLITE_OK) {
        if(sqlite3_step(selectstmt) != SQLITE_DONE) {
            NSLog(@"%s",sqlite3_errmsg(database));
        }
    }

    
    const char *sql = "INSERT OR REPLACE INTO tblHistory (lemma,categoria,importanza,service,html,is_favourite,ntable) VALUES( ?, ?, ?, ?, ?, ?, ?)";
    sqlite3_stmt *insertStmt;
    if (sqlite3_prepare_v2(database, sql, -1, &insertStmt, NULL)==SQLITE_OK) {
        sqlite3_bind_text(insertStmt, 1, [word.lemma UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 2, [word.categoria UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 3, [word.importanza UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 4, [word.service UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 5, [word.html UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 6, [word.is_favourite UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 7, [word.ntable UTF8String], -1, SQLITE_TRANSIENT);
        
    }
    if (sqlite3_step(insertStmt)!=SQLITE_DONE) {
        NSLog(@"%s",sqlite3_errmsg(database));
    }
}
+(NSMutableArray*)getAllHistoryData
{
    NSString *strSql = [NSString stringWithFormat:@"select id, lemma,categoria,importanza,service,html,is_favourite,ntable from tblHistory ORDER BY ID DESC"];
    const char *sql = [strSql UTF8String];
    sqlite3_stmt *selectstmt;
    NSMutableArray *lemmiperlaricerca;
    if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
        lemmiperlaricerca = [[NSMutableArray alloc] init];
        while(sqlite3_step(selectstmt) == SQLITE_ROW) {
            Word *objWord = [[Word alloc] init];
            objWord.ID = sqlite3_column_int(selectstmt, 0);
            objWord.lemma =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)?(char *)sqlite3_column_text(selectstmt, 1):""];
            objWord.categoria =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)?(char *)sqlite3_column_text(selectstmt, 2):""];
            objWord.importanza = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)?(char *)sqlite3_column_text(selectstmt, 3):""];
            objWord.service =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 4)?(char *)sqlite3_column_text(selectstmt, 4):""];
            objWord.html =[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 5)?(char *)sqlite3_column_text(selectstmt, 5):""];
            objWord.is_favourite = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 6)?(char *)sqlite3_column_text(selectstmt, 6):""];
            objWord.ntable = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 7)?(char *)sqlite3_column_text(selectstmt, 7):""];
            [lemmiperlaricerca addObject:objWord];
        }
    }
    return lemmiperlaricerca;
}
+(void) deleteAllHistory
{
    NSString *strSql = [NSString stringWithFormat:@"DELETE FROM tblHistory"];
    const char *sql = [strSql UTF8String];
    sqlite3_stmt *selectstmt;
    if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
        if(sqlite3_step(selectstmt) != SQLITE_DONE) {
            NSLog(@"%s",sqlite3_errmsg(database));
        }
    }
}
+(void)insertData:(Word*)word
{
    const char *sql = "INSERT OR REPLACE INTO tblDictionary (lemma,categoria,importanza,service,html,is_favourite,ntable) VALUES( ?, ?, ?, ?, ?, ?, ?)";
    sqlite3_stmt *insertStmt;
    if (sqlite3_prepare_v2(database, sql, -1, &insertStmt, NULL)==SQLITE_OK) {
        sqlite3_bind_text(insertStmt, 1, [word.lemma UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 2, [word.categoria UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 3, [word.importanza UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 4, [word.service UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 5, [word.html UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 6, [word.is_favourite UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(insertStmt, 7, [word.ntable UTF8String], -1, SQLITE_TRANSIENT);
    }
    if (sqlite3_step(insertStmt)!=SQLITE_DONE) {
        NSLog(@"%s",sqlite3_errmsg(database));
    }
}
+(void)updateFevoriteData:(Word *)word{
    const char *sql="update tblDictionary set is_favourite = ? where id = ?";
    sqlite3_stmt *insertStmt;
    if(sqlite3_prepare_v2(database, sql, -1, &insertStmt, NULL)==SQLITE_OK){
        sqlite3_bind_int(insertStmt, 2, word.ID);
        sqlite3_bind_text(insertStmt, 1,[word.is_favourite UTF8String] , -1, SQLITE_TRANSIENT);
    }
    if(sqlite3_step(insertStmt)!=SQLITE_DONE){
        NSLog(@"%s",sqlite3_errmsg(database));
    }
}
+(BOOL) IsFevouriteTableEmpty
{
    NSString *strSql = [NSString stringWithFormat:@"select *  from tblDictionary"];
    const char *sql = [strSql UTF8String];
    sqlite3_stmt *selectstmt;
    if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
        while(sqlite3_step(selectstmt) == SQLITE_ROW) {
            return FALSE;
        }
    }
    return TRUE;
}

@end
