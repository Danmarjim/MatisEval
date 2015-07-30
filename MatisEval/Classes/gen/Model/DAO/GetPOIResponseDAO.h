//
//  GetPOIResponseDAO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetPOIDTO.h"
#import "GetPOIResponseDTO.h"

@interface GetPOIResponseDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetPOIResponseDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetPOIResponseDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetPOIResponseDTO *)instance;

@end