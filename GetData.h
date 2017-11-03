#import <Foundation/Foundation.h>

@interface GetData: NSObject
{ NSString *_uiDevice;




}


+ (GetData *)sharedInstance;

@property (strong,nonatomic,readwrite) NSString *uiDevice;



-(NSString *) getDBPath ;

- (id) init;

@end