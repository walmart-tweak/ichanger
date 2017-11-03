#import <Foundation/Foundation.h>
#import "GetData.h"
#import <AppList/AppList.h>
#import <SpringBoard/SpringBoard.h>
#import <SpringBoard/SBApplication.h>
#import <SpringBoard/SBApplicationController.h>
#import <objc/runtime.h>
#import <MobileGestalt/MobileGestalt.h>
#import <dlfcn.h>



@implementation GetData:NSObject

@synthesize uiDevice = _uiDevice;

+ (GetData *)sharedInstance {
    static dispatch_once_t onceToken;
    static GetData *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[GetData alloc] init];
    });
    return instance;
}

- (id) init {
    self = [super init];
    if (self) {
    		NSLog(@"%@",[self getDBPath]);
     		_uiDevice = @"01288504056";


    }
    return self;
}

-(NSString *) getDBPath {
    return [[[ALApplicationList sharedApplicationList] valueForKey:@"sandboxPath" forDisplayIdentifier:@"com.mins.iPhoneChanger"] stringByAppendingString:@"/Documents/data.json"];
}

@end
