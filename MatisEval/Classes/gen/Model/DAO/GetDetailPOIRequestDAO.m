//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetDetailPOIRequestDTO.h"
#import "GetDetailPOIRequestDAO.h"

@implementation GetDetailPOIRequestDAO


// Get the shared instance and create it if necessary.
+ (GetDetailPOIRequestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetDetailPOIRequestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetDetailPOIRequestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.idPOI) {
			dict[@"id"] = instance.idPOI;
        }
		
	

	return dict;
}

-(GetDetailPOIRequestDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetDetailPOIRequestDTO *instance=[[GetDetailPOIRequestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {

    if (dict[@"id"] && ![dict[@"id"] isKindOfClass:[NSNull class]]) {
		instance.idPOI = dict[@"id"];
        }

  

	}
	return instance;
}


-(NSArray *) readFromDictionaryArray:(NSArray *)dictArray
{
	NSMutableArray *mutableArray=[[NSMutableArray alloc]init];
	for(NSDictionary *dict in dictArray)
	{
		[mutableArray addObject:[self readFromDictionary:dict]];
	}
	return mutableArray;
}
@end
 
