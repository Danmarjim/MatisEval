//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetPOIDTO.h"
#import "GetPOIDAO.h"

@implementation GetPOIDAO


// Get the shared instance and create it if necessary.
+ (GetPOIDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetPOIDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetPOIDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.idPOI) {
			dict[@"id"] = instance.idPOI;
        }
        if (instance.title) {
			dict[@"title"] = instance.title;
        }
        if (instance.geocoordinates) {
			dict[@"geocoordinates"] = instance.geocoordinates;
        }
		
	

	return dict;
}

-(GetPOIDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetPOIDTO *instance=[[GetPOIDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {

    if (dict[@"id"] && ![dict[@"id"] isKindOfClass:[NSNull class]]) {
	if([dict[@"id"] isKindOfClass:[NSString class]])
	{
		instance.idPOI=dict[@"id"];
	}
	else
	{
		instance.idPOI=[NSString stringWithFormat:@"%@",dict[@"id"]];
	}
        }
    if (dict[@"title"] && ![dict[@"title"] isKindOfClass:[NSNull class]]) {
	if([dict[@"title"] isKindOfClass:[NSString class]])
	{
		instance.title=dict[@"title"];
	}
	else
	{
		instance.title=[NSString stringWithFormat:@"%@",dict[@"title"]];
	}
        }
    if (dict[@"geocoordinates"] && ![dict[@"geocoordinates"] isKindOfClass:[NSNull class]]) {
	if([dict[@"geocoordinates"] isKindOfClass:[NSString class]])
	{
		instance.geocoordinates=dict[@"geocoordinates"];
	}
	else
	{
		instance.geocoordinates=[NSString stringWithFormat:@"%@",dict[@"geocoordinates"]];
	}
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
 
