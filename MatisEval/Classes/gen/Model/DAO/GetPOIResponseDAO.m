//
//  .m
//  ${projectName}
//  Version: ${version}
//
//  Created by Service Generator
//

#import "GetPOIResponseDTO.h"
#import "GetPOIDTO.h"
#import "GetPOIDAO.h"
#import "GetPOIResponseDAO.h"

@implementation GetPOIResponseDAO


// Get the shared instance and create it if necessary.
+ (GetPOIResponseDAO *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static GetPOIResponseDAO *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

-(NSDictionary *) writeToDictionary:(GetPOIResponseDTO *)instance
{
	NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];	
		
		
	

	NSMutableArray *arrayList=[[NSMutableArray alloc]init];
	for(GetPOIDTO *typeItem in instance.list)
	{
		NSDictionary *dictList=[[GetPOIDAO sharedInstance] writeToDictionary:typeItem];
		[arrayList addObject:dictList];
	}
	dict[@"list"] = arrayList;

	return dict;
}

-(GetPOIResponseDTO *) readFromDictionary:(NSDictionary *)dict
{
	GetPOIResponseDTO *instance=[[GetPOIResponseDTO alloc]init];
	if(![dict isKindOfClass:[NSDictionary class]])
	{
	    return instance;
	}
	if(![dict isKindOfClass:[NSNull class]])
	    {
    instance.list=[[NSMutableArray alloc]init];


  

	NSDictionary *listItem = nil;
	if(![dict[@"list"] isKindOfClass:[NSNull class]])
	{
		listItem=dict[@"list"];
	}
	
	if([listItem isKindOfClass:[NSArray class]])
	{
		NSArray *listArray=dict[@"list"];
		NSMutableArray *listMutableArray=[[NSMutableArray alloc]init];
		for(NSDictionary *data in listArray)
		{
			GetPOIDTO *item=[[GetPOIDAO sharedInstance] readFromDictionary:data];
			[listMutableArray addObject:item];
		}
		instance.list=listMutableArray;
	}
	else if (listItem)
	{
		NSMutableArray *listMutableArray=[[NSMutableArray alloc]init];
		GetPOIDTO *item=[[GetPOIDAO sharedInstance] readFromDictionary:listItem];
		[listMutableArray addObject:item];
		instance.list=listMutableArray;
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
 
