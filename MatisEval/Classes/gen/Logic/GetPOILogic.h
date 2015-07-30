//
//  GetPOILogic.h
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import <Foundation/Foundation.h>
#import "GenDefines.h"
#import "BaseGetPOILogic.h"
#import "GetPOIRequestDTO.h"
#import "GetPOIResponseDTO.h"

@interface GetPOILogic : BaseGetPOILogic
  // Get the shared instance and create it if necessary.
+ (GetPOILogic *)sharedInstance;


@end