//
//  GetPOI.m
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import "BaseGetPOILogic.h"

#import "AFHTTPRequestOperation.h"
#import "GenDefines.h"
#import "MatisEvalHelper.h"
#import "UnlimitedDiskCache.h"
#import "UnlimitedMemoryCache.h"
#import "GetPOIRequestDTO.h"
#import "GetPOIResponseDTO.h"
#import "GetPOIRequestDAO.h"
#import "GetPOIResponseDAO.h"
#import "BaseLogic.h"

@interface BaseGetPOILogic ()

@property (nonatomic, strong) UnlimitedDiskCache *diskCacheGetPOIAction;
@property (nonatomic, strong) UnlimitedMemoryCache *memoryCacheGetPOIAction;

@end


@implementation BaseGetPOILogic

- (id)init {

    self = [super init];

    if(self) {
        [self addFilter:[MatisEvalHelper sharedInstance]];
    }

    return self;
}



/**
* Method getPOIAction: Points Of Interest
* @param getPOIRequestDTO Service request
* @returns GetPOIResponseDTO Service response
*/
- (void)getPOIAction:(GetPOIRequestDTO *)getPOIRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetPOIResponseDTO *response))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

    [self getPOIAction:getPOIRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        
        if (onSuccess) {
            onSuccess(responseCode, response);
        }
        
    } onProgress: onProgress
    onError:onError];
}

- (void)getPOIAction:(GetPOIRequestDTO *)getPOIRequestDTO onSuccess:(void(^)(NSInteger responseCode, GetPOIResponseDTO *response))onSuccess onError:(void(^)(NSError *error))onError {

	[self getPOIAction:getPOIRequestDTO defaultCacheOptions:ServiceGeneratorCacheOptionNoCache onSuccess:^(NSInteger responseCode, GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType) {

		if (onSuccess) {
			onSuccess(responseCode, response);
		}

	} onProgress: nil
	onError:onError];
}

- (void)getPOIAction:(GetPOIRequestDTO *)getPOIRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onError:(void(^)(NSError *error))onError {
	[self getPOIAction:getPOIRequestDTO defaultCacheOptions:cacheOptions onSuccess:onSuccess onProgress:nil onError:onError];
}

- (void)getPOIAction:(GetPOIRequestDTO *)getPOIRequestDTO defaultCacheOptions:(ServiceGeneratorCacheOption)cacheOptions onSuccess:(void(^)(NSInteger responseCode, GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {

	id<Cache> cache = nil;

	if (cacheOptions & ServiceGeneratorCacheOptionMemoryOnly) {

		if (!self.memoryCacheGetPOIAction) {
			self.memoryCacheGetPOIAction = [UnlimitedMemoryCache new];
		}

		cache = self.memoryCacheGetPOIAction;
	}

	if (!(cacheOptions & ServiceGeneratorCacheOptionNoCache)) {

		if (!self.diskCacheGetPOIAction) {

			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesPath = [paths  objectAtIndex:0];
            cachesPath = [cachesPath stringByAppendingPathComponent:@"GetPOI/GetPOIAction"];
                        
            self.diskCacheGetPOIAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    	}

    	cache = self.diskCacheGetPOIAction;
	}

	[self getPOIAction:getPOIRequestDTO cache:cache refreshCache:cacheOptions & ServiceGeneratorCacheOptionRefresh onSuccess:onSuccess onProgress:onProgress onError:onError];
}

- (void)getPOIAction:(GetPOIRequestDTO *)getPOIRequestDTO cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache onSuccess:(void(^)(NSInteger responseCode, GetPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))onSuccess onProgress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) onProgress onError:(void(^)(NSError *error))onError {
    
	NSString *url=@"http://t21services.herokuapp.com/points";

	url = [self preInjectURLParameters:url  withObject:getPOIRequestDTO onService:@"GetPOI" onMethod:@"getPOIAction"];




	url = [self postInjectURLParameters:url  withObject:getPOIRequestDTO onService:@"GetPOI" onMethod:@"getPOIAction"];

	_ModelGenLog(@"URL: %@", url);


	url = [self escapeUrl:url  onService:@"GetPOI" onMethod:@"getPOIAction"];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];



    request = [self manageRequest:request onService:@"GetPOI" onMethod:@"getPOIAction"];

    if (cache) {

    	GetPOIResponseDTO *cachedResponse = [cache objectForKey:getPOIRequestDTO];

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
		securityPolicy = [self preprocessSecurityPolicy:securityPolicy  onService:@"GetPOI" onMethod:@"getPOIAction"];
		operation.securityPolicy = securityPolicy;
	}

  	[self processOperation:operation];
    if (onProgress) {
    	[operation setUploadProgressBlock: onProgress];
    }
  	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		NSError *error;
		GetPOIResponseDTO *dto=[self getPOIActionDTOFromOperation:operation withError:&error];

    	if (!error) {

    		if (cache) {
            	[cache setObject:dto forKey:getPOIRequestDTO];
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

	    GetPOIResponseDTO *dto=[self getPOIActionDTOFromOperation:operation withError:nil];

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

- (GetPOIResponseDTO *)getPOIActionDTOFromOperation:(AFHTTPRequestOperation *)operation withError:(NSError **)error {

	NSData *data = operation.responseData;

	NSString *stringData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    stringData =[self preprocessResponse:stringData  onService:@"GetPOI" onMethod:@"getPOIAction"];
		
	// Create empty json object if server returned empty string		
	if(!stringData){
		stringData=@"{}";
	}

	data = [stringData dataUsingEncoding:NSUTF8StringEncoding];

	NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

	json=[self preprocessResponseAsDictionary:json  onService:@"GetPOI" onMethod:@"getPOIAction"];

    GetPOIResponseDTO *dto=nil;

    if(json) {

    	_ModelGenLog(@"JSON: %@", json);
        dto = [[GetPOIResponseDAO sharedInstance] readFromDictionary:json];
    }

    return dto;
}

- (void)cleanDefaultGetPOIActionCache {
	
	if (self.memoryCacheGetPOIAction) {
    	[self.memoryCacheGetPOIAction removeAllObjects];
    }

    if (!self.diskCacheGetPOIAction) {

		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesPath = [paths  objectAtIndex:0];
        cachesPath = [cachesPath stringByAppendingPathComponent:@"GetPOI/GetPOIAction"];
                        
        self.diskCacheGetPOIAction = [UnlimitedDiskCache cacheWithDirectory:cachesPath];
    }
    	
    [self.diskCacheGetPOIAction removeAllObjects];
}


- (void)sayonaraCache {
	
	[self cleanDefaultGetPOIActionCache];

}

@end

