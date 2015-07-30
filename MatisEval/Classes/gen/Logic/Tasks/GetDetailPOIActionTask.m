//
//  GetDetailPOIActionTask.m
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import "GetDetailPOIActionTask.h"
#import "MatisEvalHelper.h"
#import "GetDetailPOILogic.h"

@implementation GetDetailPOIActionTask

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetDetailPOIResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getDetailPOIActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType) {
        if (completedBlock) {
            completedBlock(statusCode, response);
        }        
    } progress:nil
    error:errorBlock];
}

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetDetailPOIResponseDTO *response))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[self getDetailPOIActionTaskForRequest:request defaultCacheOptions:ServiceGeneratorCacheOptionNoCache showLoadingView:showLoadingView completed:^(NSInteger statusCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType) {
		if (completedBlock) {
			completedBlock(statusCode, response);
		}
	} progress: progressBlock
	error:errorBlock];
}

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getDetailPOIActionTaskForRequest:request showLoadingView:YES completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getDetailPOIActionTaskForRequest:request defaultCacheOptions:defaultCacheOptions showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request defaultCacheOptions:(ServiceGeneratorCacheOption)defaultCacheOptions showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[MatisEvalHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[MatisEvalHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[GetDetailPOILogic sharedInstance] getDetailPOIAction:request defaultCacheOptions:defaultCacheOptions onSuccess:^(NSInteger statusCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(completedBlock){
			completedBlock(statusCode, response, cacheType);
		}

	} onProgress: progressBlock
	onError:^(NSError *error){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(errorBlock) {
			errorBlock(error);
		}
	}];

}

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock error:(void(^)(NSError *error))errorBlock {

	[self getDetailPOIActionTaskForRequest:request cache:cache refreshCache:refreshCache showLoadingView:showLoadingView completed:completedBlock progress:nil error:errorBlock];
}

+ (void)getDetailPOIActionTaskForRequest:(GetDetailPOIRequestDTO *)request cache:(id<Cache>)cache refreshCache:(BOOL)refreshCache showLoadingView:(BOOL)showLoadingView completed:(void(^)(NSInteger statusCode,GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType))completedBlock progress:(void(^) (NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)) progressBlock error:(void(^)(NSError *error))errorBlock {

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	UIView *loadingView;
	if ([[MatisEvalHelper sharedInstance] respondsToSelector:@selector(loadingViewForTasks)]  && showLoadingView) {
		loadingView = [[MatisEvalHelper sharedInstance] loadingViewForTasks];
	}
				
	if (loadingView) {
		UIWindow* window = [UIApplication sharedApplication].keyWindow;
		[window addSubview:loadingView];
	}

	[[GetDetailPOILogic sharedInstance] getDetailPOIAction:request cache:cache refreshCache:refreshCache onSuccess:^(NSInteger statusCode, GetDetailPOIResponseDTO *response, ServiceGeneratorCacheType cacheType){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(completedBlock){
			completedBlock(statusCode, response, cacheType);
		}

	} onProgress: progressBlock
	onError:^(NSError *error){

		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		if (loadingView) {
			[loadingView removeFromSuperview];
		}
		if(errorBlock) {
			errorBlock(error);
		}
	}];

}

@end