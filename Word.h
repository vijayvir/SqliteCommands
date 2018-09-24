//
//  Word.h
//  TAPAMENI
//


#import <Foundation/Foundation.h>

@interface Word : NSObject
@property(nonatomic, assign)int ID;
@property(nonatomic,retain)NSString *lemma;
@property(nonatomic,retain)NSString *categoria;
@property(nonatomic,retain)NSString *importanza;
@property(nonatomic,retain)NSString *service;
@property(nonatomic,retain)NSString *html;
@property(nonatomic,retain)NSString *is_favourite;
@property(nonatomic,retain)NSString *ntable;
@end
