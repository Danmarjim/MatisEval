//
//  MatisEvalHelper.m
//  MatisEval
//  Version: 10.0
//
//  Created by Service Generator
//

#import "MatisEvalHelper.h"
#import <QuartzCore/QuartzCore.h>

@implementation MatisEvalHelper


// Get the shared instance and create it if necessary.
+ (MatisEvalHelper *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static MatisEvalHelper *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

- (NSString *)preInjectURLParameters:(NSString *)url withObject:(NSObject *)object onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod {
	return url;
}

- (NSString *)postInjectURLParameters:(NSString *)url withObject:(NSObject *)object onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod {
	return url;
}

- (NSString *)escapeUrl:(NSString *)url  onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod{
	return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSMutableURLRequest *)manageRequest:(NSMutableURLRequest *)request  onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod{
	return request;
}

- (NSString *)preprocessResponse:(NSString *)responseString  onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod{
    NSString *fixedString=responseString;
    if(responseString.length==0)
    {
        fixedString=@"{}";
    }
    if(responseString.length!=0 && [responseString characterAtIndex:0]=='[')
    {
        fixedString=[NSString stringWithFormat:@"{\"items\":%@}",fixedString];
    }
    return fixedString;
}

- (NSDictionary *) preprocessResponseAsDictionary:(NSDictionary *)responseDict  onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod{
	return responseDict;
}

- (id)preprocessCacheHitForRequest:(id)request withCachedResponse:(id)cachedResponse onService:(NSString *)serviceName onMethod:(NSString *)methodName {
    return cachedResponse;
}

- (AFSecurityPolicy *)preprocessSecurityPolicy:(AFSecurityPolicy *)securityPolicy  onService:(NSString *)serviceName onMethod:(NSString *)serviceMethod{
	return securityPolicy;
}

- (UIView *) loadingViewForTasks {
	CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIView *loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [loadingView setBackgroundColor:[UIColor clearColor]];
    
    CGSize centerViewSize = CGSizeMake(100, 100);
    
    UIView *centerView = [[UIView alloc] initWithFrame:
                          CGRectMake(screenWidth/2 - centerViewSize.width/2, 
                                     screenHeight/2 - centerViewSize.height/2, 
                                     centerViewSize.width, 
                                     centerViewSize.height)];
    
    [centerView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [centerView.layer setCornerRadius:5];
    [centerView.layer setMasksToBounds:YES];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicator setFrame:CGRectMake(screenWidth/2 - activityIndicator.frame.size.width/2,       // X
                                           screenHeight/2 - activityIndicator.frame.size.height/2,     // Y
                                           activityIndicator.frame.size.width, activityIndicator.frame.size.height)];
    centerView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [loadingView addSubview:centerView];
    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [loadingView addSubview:activityIndicator];    
    [activityIndicator startAnimating];
    
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    return loadingView;
}

@end