//
//  GetDetailPOIRequestDAO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetDetailPOIRequestDTO.h"

@interface GetDetailPOIRequestDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetDetailPOIRequestDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetDetailPOIRequestDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetDetailPOIRequestDTO *)instance;

@end