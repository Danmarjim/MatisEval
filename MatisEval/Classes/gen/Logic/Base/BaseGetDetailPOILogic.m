//
//  GetDetailPOI.m
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetDetailPOILogic.h"

#import "AFHTTPRequestOperation.h"
#import "GenDefines.h"
#import "MatisEvalHelper.h"
#import "UnlimitedDiskCache.h"
#import "UnlimitedMemoryCache.h"
#import "GetDetailPOIRequestDTO.h"
#import "GetDetailPOIResponseDTO.h"
#import "GetDetailPOIRequestDAO.h"
#import "GetDetailPOIResponseDAO.h"
#import "BaseLogic.h"

@interface BaseGetDetailPOILogic ()

@property (nonatomic, strong) UnlimitedDiskCache *diskCacheGetDetailPOIAction;
@property (nonatomic, strong) UnlimitedMemoryCache *memoryCacheGetDetailPOIAction;

@end


@implementation BaseGetDetailPOILogic

- (id)init {

    self = [super init];

    if(self) {
        [self addFilter:[MatisEvalHelper sharedInstance]];
    }

    return self;
}



/**
* Method getDetailPOIAction: Details from Point Of Interest
* @param getDetailPOIRequestDTO Service request
* @returns GetDetailPOIResponseDTO Service response
*/
- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

    [self getDetailPOIAction:getDetailPOIRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        
        if (onSuccess) {
            onSuccess(responseCode, response);
        }
        
    } onProgress: onProgress
    onError:onError];
}

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response))onSuccess onError:(void(^)(NSError *error))onError {

	[self getDetailPOIAction:getDetailPOIRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType) {

		if (onSuccess) {
			onSuccess(responseCode, response);
		}

	} onProgress: nil
	onError:onError];
}

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onError:(void(^)(NSError *error))onError {
	[self getDetailPOIAction:getDetailPOIRequestDTO defaultCacheOptions:cacheOptions onSuccess:onSuccess onProgress:nil onError:onError];
}

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

	id<Cache> cache = nil;

	if (cacheOptions & ServiceGeneratorCacheOptionMemoryOnly) {

		if (!self.memoryCacheGetDetailPOIAction) {
			self.memoryCacheGetDetailPOIAction = [UnlimitedMemoryCache new];
		}

		cache = self.memoryCacheGetDetailPOIAction;
	}

	if (!(cacheOptions & ServiceGeneratorCacheOptionNoCache)) {

		if (!self.diskCacheGetDetailPOIAction) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesPath = [paths  objectAtIndex:0];
            cachesPath = [cachesPath stringByAppendingPathComponent:@"GetDetailPOI/GetDetailPOIAction"];
                        
            self.diskCacheGetDetailPOIAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    	}

    	cache = self.diskCacheGetDetailPOIAction;
	}

	[self getDetailPOIAction:getDetailPOIRequestDTO cache:cache refreshCache:cacheOptions & ServiceGeneratorCacheOptionRefresh onSuccess:onSuccess onProgress:onProgress onError:onError];
}

- (void)getDetailPOIAction:(GetDetailPOIRequestDTO *)getDetailPOIRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {
    
	NSString *url=@"http://t21services.herokuapp.com/points/${id}";

	url = [self preInjectURLParameters:url  withObject:getDetailPOIRequestDTO onService:@"GetDetailPOI" onMethod:@"getDetailPOIAction"];

		NSString *stringIdPOI=[NSString stringWithFormat:@"%@",getDetailPOIRequestDTO.idPOI];

   	if(getDetailPOIRequestDTO.idPOI==nil){
        url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"id"] withString:@""];
	} else {

		if([url rangeOfString:[NSString stringWithFormat:@"${%@}",@"id"]].location != NSNotFound) {

		    url = [url stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"${%@}",@"id"] withString:stringIdPOI];

		}
	}
	url = [self postInjectURLParameters:url  withObject:getDetailPOIRequestDTO onService:@"GetDetailPOI" onMethod:@"getDetailPOIAction"];

	_ModelGenLog(@"URL: %@", url);


	url = [self escapeUrl:url  onService:@"GetDetailPOI" onMethod:@"getDetailPOIAction"];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];



    request = [self manageRequest:request onService:@"GetDetailPOI" onMethod:@"getDetailPOIAction"];

    if (cache) {

    	GetDetailPOIResponseDTO *cachedResponse = [cache objectForKey:getDetailPOIRequestDTO];

    	if (cachedResponse) {
    		
    		onSuccess(200, cachedResponse, ServiceGeneratorCacheTypeUnknown);

    		if (!refreshCache) {
    			return;
    		}
    	}
    	
    }

	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];

	if ([operation respondsToSelector:@selector(setSecurityPolicy:)]) {

		AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
		securityPolicy.allowInvalidCertificates = YES;
		securityPolicy = [self preprocessSecurityPolicy:securityPolicy  onService:@"GetDetailPOI" onMethod:@"getDetailPOIAction"];
		operation.securityPolicy = securityPolicy;
	}

  	[self processOperation:operation];
    if (onProgress) {
    	[operation setUploadProgressBlock: onProgress];
    }
  	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		NSError *error;
		GetDetailPOIResponseDTO *dto=[self getDetailPOIActionDTOFromOperation:operation withError:&error];

    	if (!error) {

    		if (cache) {
            	[cache setObject:dto forKey:getDetailPOIRequestDTO];
			}

	        if (onSuccess) {	        	
	            onSuccess(operation.response.statusCode, dto, ServiceGeneratorCacheTypeNone);
	        }

	  	} else {

			if (onError) {
				onError(error);
			}
		}

	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {

	    GetDetailPOIResponseDTO *dto=[self getDetailPOIActionDTOFromOperation:operation withError:nil];

		if (dto) {

	        if (onSuccess) {
	            onSuccess(operation.response.statusCode, dto, ServiceGeneratorCacheTypeNone);
	        }

		} else if (onError) {
			onError(error);
		}
	}];

	[operation start];
}

- (GetDetailPOIResponseDTO *)getDetailPOIActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error {

	NSData *data = operation.responseData;

	NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    stringData =[self preprocessResponse:stringData  onService:@"GetDetailPOI" onMethod:@"getDetailPOIAction"];
		
	// Create empty json object if server returned empty string		
	if(!stringData){
		stringData=@"{}";
	}

	data = [stringData dataUsingEncoding:NSUTF8StringEncoding];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

	json=[self preprocessResponseAsDictionary:json  onService:@"GetDetailPOI" onMethod:@"getDetailPOIAction"];

    GetDetailPOIResponseDTO *dto=nil;

    if(json) {

    	_ModelGenLog(@"JSON: %@", json);
        dto = [[GetDetailPOIResponseDAO sharedInstance] readFromDictionary:json];
    }

    return dto;
}

- (void)cleanDefaultGetDetailPOIActionCache {
	
	if (self.memoryCacheGetDetailPOIAction) {
    	[self.memoryCacheGetDetailPOIAction removeAllObjects];
    }

    if (!self.diskCacheGetDetailPOIAction) {

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths  objectAtIndex:0];
        cachesPath = [cachesPath stringByAppendingPathComponent:@"GetDetailPOI/GetDetailPOIAction"];
                        
        self.diskCacheGetDetailPOIAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    }
    	
    [self.diskCacheGetDetailPOIAction removeAllObjects];
}


- (void)sayonaraCache {
	
	[self cleanDefaultGetDetailPOIActionCache];

}

@end

