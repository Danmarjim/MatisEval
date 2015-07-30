//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetPOIRequestDTO.h"
#import "GetPOIRequestDAO.h"

@implementation GetPOIRequestDAO


// Get the shared instance and create it if necessary.
+ (GetPOIRequestDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetPOIRequestDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetPOIRequestDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	

	return dict;
}

-(GetPOIRequestDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetPOIRequestDTO *instance=[[GetPOIRequestDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {


  

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
 
