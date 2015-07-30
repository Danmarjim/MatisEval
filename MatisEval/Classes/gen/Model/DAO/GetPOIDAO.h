//
//  GetPOIDAO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetPOIDTO.h"

@interface GetPOIDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetPOIDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetPOIDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetPOIDTO *)instance;

@end