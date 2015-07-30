//
//  GetDetailPOIResponseDAO.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GetDetailPOIResponseDTO.h"

@interface GetDetailPOIResponseDAO : NSObject

// Get the shared instance and create it if necessary.
+ (GetDetailPOIResponseDAO *)sharedInstance;

// Set DTOs values from Dictionary
-(GetDetailPOIResponseDTO *) readFromDictionary:(NSDictionary *)dict;

// Creates a DTO array from Dictionary array
-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray;

// Creates a json dictionary from DTO instance
-(NSDictionary *) writeToDictionary:(GetDetailPOIResponseDTO *)instance;

@end