//
//  GetPOIRequestDAO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetPOIRequestDTO.h"

@interface GetPOIRequestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetPOIRequestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetPOIRequestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetPOIRequestDTO *)instance;

@end