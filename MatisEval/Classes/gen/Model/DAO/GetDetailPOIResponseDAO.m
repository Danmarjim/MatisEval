//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetDetailPOIResponseDTO.h"
#import "GetDetailPOIResponseDAO.h"

@implementation GetDetailPOIResponseDAO


// Get the shared instance and create it if necessary.
+ (GetDetailPOIResponseDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetDetailPOIResponseDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetDetailPOIResponseDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
        if (instance.idPOI) {
			dict[@"id"] = instance.idPOI;
        }
        if (instance.title) {
			dict[@"title"] = instance.title;
        }
        if (instance.address) {
			dict[@"address"] = instance.address;
        }
        if (instance.transport) {
			dict[@"transport"] = instance.transport;
        }
        if (instance.email) {
			dict[@"email"] = instance.email;
        }
        if (instance.geocoordinates) {
			dict[@"geocoordinates"] = instance.geocoordinates;
        }
        if (instance.desc) {
			dict[@"description"] = instance.desc;
        }
        if (instance.phone) {
			dict[@"phone"] = instance.phone;
        }
		
	

	return dict;
}

-(GetDetailPOIResponseDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetDetailPOIResponseDTO *instance=[[GetDetailPOIResponseDTO alloc]init];
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
    if (dict[@"address"] && ![dict[@"address"] isKindOfClass:[NSNull class]]) {
	if([dict[@"address"] isKindOfClass:[NSString class]])
	{
		instance.address=dict[@"address"];
	}
	else
	{
		instance.address=[NSString stringWithFormat:@"%@",dict[@"address"]];
	}
        }
    if (dict[@"transport"] && ![dict[@"transport"] isKindOfClass:[NSNull class]]) {
	if([dict[@"transport"] isKindOfClass:[NSString class]])
	{
		instance.transport=dict[@"transport"];
	}
	else
	{
		instance.transport=[NSString stringWithFormat:@"%@",dict[@"transport"]];
	}
        }
    if (dict[@"email"] && ![dict[@"email"] isKindOfClass:[NSNull class]]) {
	if([dict[@"email"] isKindOfClass:[NSString class]])
	{
		instance.email=dict[@"email"];
	}
	else
	{
		instance.email=[NSString stringWithFormat:@"%@",dict[@"email"]];
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
    if (dict[@"description"] && ![dict[@"description"] isKindOfClass:[NSNull class]]) {
	if([dict[@"description"] isKindOfClass:[NSString class]])
	{
		instance.desc=dict[@"description"];
	}
	else
	{
		instance.desc=[NSString stringWithFormat:@"%@",dict[@"description"]];
	}
        }
    if (dict[@"phone"] && ![dict[@"phone"] isKindOfClass:[NSNull class]]) {
	if([dict[@"phone"] isKindOfClass:[NSString class]])
	{
		instance.phone=dict[@"phone"];
	}
	else
	{
		instance.phone=[NSString stringWithFormat:@"%@",dict[@"phone"]];
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
 
