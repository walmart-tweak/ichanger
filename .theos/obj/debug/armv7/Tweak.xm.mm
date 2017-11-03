#line 1 "Tweak.xm"
#include <substrate.h>
#include <sys/utsname.h>
#include <sys/stdio.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <sys/sysctl.h>
#include <SystemConfiguration/SCNetworkReachability.h>
#include <SystemConfiguration/SCNetwork.h>
#import <SpringBoard/SBApplication.h>
#import <SpringBoard/SBApplicationController.h>
#import <SpringBoard/SpringBoard.h>
#include <SystemConfiguration/CaptiveNetwork.h>
#import <SpringBoard/SpringBoard.h>
#import "GetData.h"
#import <objc/runtime.h>

#define PREF_FILES @"var/mobile/Library/Preferences/data.json"
#define FRONT_APP @"var/mobile/Library/Preferences/frontApp.txt"

@interface PSMagnifyMode : NSObject
+ (id)magnifyModeWithSize:(CGSize)arg1 name:(id)arg2 localizedName:(id)arg3 isZoomed:(bool)arg4;

- (void)dealloc;
- (unsigned long long)hash;
- (bool)isEqual:(id)arg1;
- (bool)isZoomed;
- (id)localizedName;
- (id)name;
- (id)previewHTMLStrings;
- (id)previewStyleSheets;
- (void)setLocalizedName:(id)arg1;
- (void)setName:(id)arg1;
- (void)setPreviewHTMLStrings:(id)arg1;
- (void)setPreviewStyleSheets:(id)arg1;
- (void)setSize:(CGSize)arg1;
- (void)setZoomed:(bool)arg1;
- (CGSize)size;
@end

static NSDictionary *LoadDataFromUrl() {
	NSData *nsData = [NSData dataWithContentsOfFile:PREF_FILES];

	NSDictionary *nullDict = nil;
	NSError *error;
	if (nsData) 
	{
		NSDictionary *nsDict = [NSJSONSerialization JSONObjectWithData:nsData options:kNilOptions error: &error];
		NSDictionary *data = [nsDict objectForKey:@"Device"];
		return data;
	}	

	else {return nullDict;}
 
	
}


static NSDictionary *data = LoadDataFromUrl();



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIDevice; @class ASIdentifierManager; @class CTCarrier; @class UIScreen; @class NSProcessInfo; @class SpringBoard; 
static NSString * (*_logos_orig$_ungrouped$UIDevice$name)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$UIDevice$name(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSUUID * (*_logos_orig$_ungrouped$UIDevice$identifierForVendor)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSUUID * _logos_method$_ungrouped$UIDevice$identifierForVendor(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$UIDevice$systemVersion)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$UIDevice$systemVersion(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$isMultitaskingSupported)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$isMultitaskingSupported(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$isProximityMonitoringEnabled)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$isProximityMonitoringEnabled(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$isBatteryMonitoringEnabled)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$isBatteryMonitoringEnabled(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$isAccessibilityElement)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$isAccessibilityElement(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$isGeneratingDeviceOrientationNotifications)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$isGeneratingDeviceOrientationNotifications(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$CTCarrier$carrierName)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$CTCarrier$carrierName(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$CTCarrier$isoCountryCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$CTCarrier$isoCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$CTCarrier$mobileCountryCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$CTCarrier$mobileCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$CTCarrier$mobileNetworkCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$CTCarrier$mobileNetworkCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$CTCarrier$allowsVOIP)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$CTCarrier$allowsVOIP(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSUUID * (*_logos_orig$_ungrouped$ASIdentifierManager$advertisingIdentifier)(_LOGOS_SELF_TYPE_NORMAL ASIdentifierManager* _LOGOS_SELF_CONST, SEL); static NSUUID * _logos_method$_ungrouped$ASIdentifierManager$advertisingIdentifier(_LOGOS_SELF_TYPE_NORMAL ASIdentifierManager* _LOGOS_SELF_CONST, SEL); static NSOperatingSystemVersion (*_logos_orig$_ungrouped$NSProcessInfo$operatingSystemVersion)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static NSOperatingSystemVersion _logos_method$_ungrouped$NSProcessInfo$operatingSystemVersion(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$NSProcessInfo$operatingSystemVersionString)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$NSProcessInfo$operatingSystemVersionString(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_orig$_ungrouped$NSProcessInfo$physicalMemory)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$_ungrouped$NSProcessInfo$physicalMemory(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$NSProcessInfo$hostName)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$NSProcessInfo$hostName(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static double (*_logos_orig$_ungrouped$NSProcessInfo$systemUptime)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static double _logos_method$_ungrouped$NSProcessInfo$systemUptime(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$frontDisplayDidChange$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$frontDisplayDidChange$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static CGRect (*_logos_orig$_ungrouped$UIScreen$bounds)(_LOGOS_SELF_TYPE_NORMAL UIScreen* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$_ungrouped$UIScreen$bounds(_LOGOS_SELF_TYPE_NORMAL UIScreen* _LOGOS_SELF_CONST, SEL); static CGRect (*_logos_orig$_ungrouped$UIScreen$nativeBounds)(_LOGOS_SELF_TYPE_NORMAL UIScreen* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$_ungrouped$UIScreen$nativeBounds(_LOGOS_SELF_TYPE_NORMAL UIScreen* _LOGOS_SELF_CONST, SEL); 

#line 61 "Tweak.xm"



static NSString * _logos_method$_ungrouped$UIDevice$name(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	    NSString *uiDevice = [data objectForKey:@"DeviceName"];	
	    if (uiDevice)
		return uiDevice;
		else return _logos_orig$_ungrouped$UIDevice$name(self, _cmd);
	}
static NSUUID * _logos_method$_ungrouped$UIDevice$identifierForVendor(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		NSUUID *uiIFV = [[NSUUID UUID] initWithUUIDString:[data objectForKey:@"IdForVendor"]];
		if (uiIFV) 
			return uiIFV;
		else return _logos_orig$_ungrouped$UIDevice$identifierForVendor(self, _cmd);

}
static NSString * _logos_method$_ungrouped$UIDevice$systemVersion(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		NSString *uiVers = [NSString stringWithString:[data objectForKey:@"OSVersion"]];
		if (uiVers) {
			return uiVers;
		}
		else return _logos_orig$_ungrouped$UIDevice$systemVersion(self, _cmd);

}
static BOOL _logos_method$_ungrouped$UIDevice$isMultitaskingSupported(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
static BOOL _logos_method$_ungrouped$UIDevice$isProximityMonitoringEnabled(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
static BOOL _logos_method$_ungrouped$UIDevice$isBatteryMonitoringEnabled(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
static BOOL _logos_method$_ungrouped$UIDevice$isAccessibilityElement(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
static BOOL _logos_method$_ungrouped$UIDevice$isGeneratingDeviceOrientationNotifications(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}



 
static NSString * _logos_method$_ungrouped$CTCarrier$carrierName(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSString *cName = [data objectForKey:@"Network"];
	if (cName)
		{return cName;}
	else return _logos_orig$_ungrouped$CTCarrier$carrierName(self, _cmd);

	}
static NSString * _logos_method$_ungrouped$CTCarrier$isoCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSString *iCC = [data objectForKey:@"IOS"];
	if (iCC)
		{return iCC;}
	else return _logos_orig$_ungrouped$CTCarrier$isoCountryCode(self, _cmd);
}

static NSString * _logos_method$_ungrouped$CTCarrier$mobileCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSString *mCC = [data objectForKey:@"MCC"];
	if (mCC) 
		{return mCC;}
	else return _logos_orig$_ungrouped$CTCarrier$mobileCountryCode(self, _cmd);

}
static NSString * _logos_method$_ungrouped$CTCarrier$mobileNetworkCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSString *mnC = [data objectForKey:@"MNCC"];
	if (mnC) {
		return mnC;

	}
	else return _logos_orig$_ungrouped$CTCarrier$mobileNetworkCode(self, _cmd);
}
static BOOL _logos_method$_ungrouped$CTCarrier$allowsVOIP(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	
	return YES;
}






static NSUUID * _logos_method$_ungrouped$ASIdentifierManager$advertisingIdentifier(_LOGOS_SELF_TYPE_NORMAL ASIdentifierManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSUUID *asiI = [[NSUUID UUID] initWithUUIDString:[data objectForKey:@"AdvId"]];
	if (asiI) {
		return asiI;
	}
	else return _logos_orig$_ungrouped$ASIdentifierManager$advertisingIdentifier(self, _cmd);

}


int uname(struct utsname *);

_disused static int (*_logos_orig$_ungrouped$uname)(struct utsname *value); static int _logos_function$_ungrouped$uname(struct utsname *value) {
	int ret = _logos_orig$_ungrouped$uname(value);
	NSString *utsmachine = [data objectForKey:@"utsname_Machinenumber"];
	if (utsmachine) {	 
		const char *utsnameCh = utsmachine.UTF8String; 
		strcpy(value->machine, utsnameCh);

	}
	NSString *utsrelease = [data objectForKey:@"utsname_Releasenumber"];
	if (utsrelease) {	 	const char *utsreleaseCh = utsrelease.UTF8String;
   						    strcpy(value->release, utsreleaseCh);

	}
	NSString *utssystem = [data objectForKey:@"utsname_Systemversion"];
	if (utssystem ) { 		 const char *utsversionCh = utssystem.UTF8String;
							    strcpy(value->version, utsversionCh);} 
	NSString *utsnodename = [data objectForKey:@"DeviceName"];
	if (utsnodename){ 		const char *utsnodenameCh = utsnodename.UTF8String;
								strcpy(value->nodename, utsnodenameCh);
	}

    return ret;
}


CFDictionaryRef (*oldCNCopyCurrentNetworkInfo)(CFStringRef interfaceName);

CFDictionaryRef newCNCopyCurrentNetworkInfo(CFStringRef interfaceName) {
		CFDictionaryRef result = NULL;
		NSString *ssid = [data objectForKey:@"SSIDInfo"];
		NSString *bssid = [data objectForKey:@"BSIDInfo"];
		NSString *ssidData = [data objectForKey:@"SSIDData"];
		NSDictionary *dictionary = @{@"SSID":ssid,@"BSSID":bssid,@"SSIDDATA":ssidData};
		result = (CFDictionaryRef)CFRetain((__bridge CFDictionaryRef)(dictionary));

	if(!result) {
		result = oldCNCopyCurrentNetworkInfo(interfaceName);
	}

	return result;
}

CFDictionaryRef (*oldCFNetworkCopySystemProxySettings)();
CFDictionaryRef newCFNetworkCopySystemProxySettings() {
	CFDictionaryRef resul = NULL;
	NSDictionary *dictionary = @{
        (NSString *)kCFProxyHostNameKey   : [NSNull null],
        (NSString *)kCFProxyPortNumberKey : [NSNull null],
        (NSString *)kCFProxyTypeKey       : [NSNull null],
        (NSString *)kCFNetworkProxiesHTTPProxy: [NSNull null],
    };

	resul = (CFDictionaryRef)CFRetain((__bridge CFDictionaryRef)(dictionary));
	return resul;

}	


int (*orig_sysctlbyname) (const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
int replaced_sysctlbyname (const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen) {
	int ret = orig_sysctlbyname(name, oldp, oldlenp, newp, newlen);
    NSString *hwMachine = [data objectForKey:@"HWMachine"];
    NSString *hwModel = [data objectForKey:@"HW.Model"];
    
    NSString *kernelOsRelease = [data objectForKey:@"utsname_Releasenumber"];
    NSString *kernelOSVersion = [data objectForKey:@"utsname_Systemversion"];
    NSString *kernelHostName = [data objectForKey:@"DeviceName"];
    NSString *kernelOsModel = [data objectForKey:@"Kern_OsVersion"];
    if (hwMachine) {
    	    const char *hwMachineCh = (const char *)[hwMachine cStringUsingEncoding:NSUTF16StringEncoding];

    		if (strcmp(name, "hw.machine") == 0) {
    			if (oldp)
        		strcpy((char *)oldp, hwMachineCh);
          		*oldlenp = sizeof(hwMachineCh);
   			 }
	}
    if (hwModel) {
    	    const char *hwModelCh = (const char *)[hwModel cStringUsingEncoding:NSUTF16StringEncoding];

    		if (strcmp(name, "hw.model") == 0) {
    			if (oldp)
        		strcpy((char *)oldp, hwModelCh);
          		*oldlenp = sizeof(hwModelCh);
   			 }
	}
	
	if (kernelOsRelease) {
    	    const char *kernelOsReleaseCh = (const char *)[kernelOsRelease cStringUsingEncoding:NSUTF16StringEncoding];

    		if (strcmp(name, "kern.osrelease") == 0) {
    			if (oldp)
        		strcpy((char *)oldp, kernelOsReleaseCh);
          		*oldlenp = sizeof(kernelOsReleaseCh);
   			 }
	}

		if (kernelOSVersion) {
		
			const char *kernelOSVersionCh= (const char *)[kernelOSVersion cStringUsingEncoding:NSUTF16StringEncoding];

    		if (strcmp(name, "kern.version") == 0) {
    			if (oldp)
        		strcpy((char *)oldp, kernelOSVersionCh);
          		*oldlenp = sizeof(kernelOSVersionCh);
   			 }
		}

		if (kernelHostName) {
			const char *kernelHostNameCh = (const char *)[kernelHostName cStringUsingEncoding:NSUTF16StringEncoding];

    		if (strcmp(name, "kern.hostname") == 0) {
    			if (oldp)
        		strcpy((char *)oldp, kernelHostNameCh);
          		*oldlenp = sizeof(kernelHostNameCh);
   			 }

	}
	if (kernelOsModel) {
			const char *kernelOsModelCh = (const char *)[kernelOsModel cStringUsingEncoding:NSUTF16StringEncoding];

    		if (strcmp(name, "kern.osversion") == 0) {
    			if (oldp)
        		strcpy((char *)oldp, kernelOsModelCh);
          		*oldlenp = sizeof(kernelOsModelCh);
   			 }

	}



    return ret;
}


static __attribute__((constructor)) void _logosLocalCtor_5c40de68(int __unused argc, char __unused **argv, char __unused **envp) {
	{Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(name), (IMP)&_logos_method$_ungrouped$UIDevice$name, (IMP*)&_logos_orig$_ungrouped$UIDevice$name);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(identifierForVendor), (IMP)&_logos_method$_ungrouped$UIDevice$identifierForVendor, (IMP*)&_logos_orig$_ungrouped$UIDevice$identifierForVendor);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(systemVersion), (IMP)&_logos_method$_ungrouped$UIDevice$systemVersion, (IMP*)&_logos_orig$_ungrouped$UIDevice$systemVersion);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(isMultitaskingSupported), (IMP)&_logos_method$_ungrouped$UIDevice$isMultitaskingSupported, (IMP*)&_logos_orig$_ungrouped$UIDevice$isMultitaskingSupported);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(isProximityMonitoringEnabled), (IMP)&_logos_method$_ungrouped$UIDevice$isProximityMonitoringEnabled, (IMP*)&_logos_orig$_ungrouped$UIDevice$isProximityMonitoringEnabled);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(isBatteryMonitoringEnabled), (IMP)&_logos_method$_ungrouped$UIDevice$isBatteryMonitoringEnabled, (IMP*)&_logos_orig$_ungrouped$UIDevice$isBatteryMonitoringEnabled);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(isAccessibilityElement), (IMP)&_logos_method$_ungrouped$UIDevice$isAccessibilityElement, (IMP*)&_logos_orig$_ungrouped$UIDevice$isAccessibilityElement);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(isGeneratingDeviceOrientationNotifications), (IMP)&_logos_method$_ungrouped$UIDevice$isGeneratingDeviceOrientationNotifications, (IMP*)&_logos_orig$_ungrouped$UIDevice$isGeneratingDeviceOrientationNotifications);Class _logos_class$_ungrouped$CTCarrier = objc_getClass("CTCarrier"); MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(carrierName), (IMP)&_logos_method$_ungrouped$CTCarrier$carrierName, (IMP*)&_logos_orig$_ungrouped$CTCarrier$carrierName);MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(isoCountryCode), (IMP)&_logos_method$_ungrouped$CTCarrier$isoCountryCode, (IMP*)&_logos_orig$_ungrouped$CTCarrier$isoCountryCode);MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(mobileCountryCode), (IMP)&_logos_method$_ungrouped$CTCarrier$mobileCountryCode, (IMP*)&_logos_orig$_ungrouped$CTCarrier$mobileCountryCode);MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(mobileNetworkCode), (IMP)&_logos_method$_ungrouped$CTCarrier$mobileNetworkCode, (IMP*)&_logos_orig$_ungrouped$CTCarrier$mobileNetworkCode);MSHookMessageEx(_logos_class$_ungrouped$CTCarrier, @selector(allowsVOIP), (IMP)&_logos_method$_ungrouped$CTCarrier$allowsVOIP, (IMP*)&_logos_orig$_ungrouped$CTCarrier$allowsVOIP);Class _logos_class$_ungrouped$ASIdentifierManager = objc_getClass("ASIdentifierManager"); MSHookMessageEx(_logos_class$_ungrouped$ASIdentifierManager, @selector(advertisingIdentifier), (IMP)&_logos_method$_ungrouped$ASIdentifierManager$advertisingIdentifier, (IMP*)&_logos_orig$_ungrouped$ASIdentifierManager$advertisingIdentifier);Class _logos_class$_ungrouped$NSProcessInfo = objc_getClass("NSProcessInfo"); MSHookMessageEx(_logos_class$_ungrouped$NSProcessInfo, @selector(operatingSystemVersion), (IMP)&_logos_method$_ungrouped$NSProcessInfo$operatingSystemVersion, (IMP*)&_logos_orig$_ungrouped$NSProcessInfo$operatingSystemVersion);MSHookMessageEx(_logos_class$_ungrouped$NSProcessInfo, @selector(operatingSystemVersionString), (IMP)&_logos_method$_ungrouped$NSProcessInfo$operatingSystemVersionString, (IMP*)&_logos_orig$_ungrouped$NSProcessInfo$operatingSystemVersionString);MSHookMessageEx(_logos_class$_ungrouped$NSProcessInfo, @selector(physicalMemory), (IMP)&_logos_method$_ungrouped$NSProcessInfo$physicalMemory, (IMP*)&_logos_orig$_ungrouped$NSProcessInfo$physicalMemory);MSHookMessageEx(_logos_class$_ungrouped$NSProcessInfo, @selector(hostName), (IMP)&_logos_method$_ungrouped$NSProcessInfo$hostName, (IMP*)&_logos_orig$_ungrouped$NSProcessInfo$hostName);MSHookMessageEx(_logos_class$_ungrouped$NSProcessInfo, @selector(systemUptime), (IMP)&_logos_method$_ungrouped$NSProcessInfo$systemUptime, (IMP*)&_logos_orig$_ungrouped$NSProcessInfo$systemUptime);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(frontDisplayDidChange:), (IMP)&_logos_method$_ungrouped$SpringBoard$frontDisplayDidChange$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$frontDisplayDidChange$);Class _logos_class$_ungrouped$UIScreen = objc_getClass("UIScreen"); MSHookMessageEx(_logos_class$_ungrouped$UIScreen, @selector(bounds), (IMP)&_logos_method$_ungrouped$UIScreen$bounds, (IMP*)&_logos_orig$_ungrouped$UIScreen$bounds);MSHookMessageEx(_logos_class$_ungrouped$UIScreen, @selector(nativeBounds), (IMP)&_logos_method$_ungrouped$UIScreen$nativeBounds, (IMP*)&_logos_orig$_ungrouped$UIScreen$nativeBounds); MSHookFunction((void *)uname, (void *)&_logos_function$_ungrouped$uname, (void **)&_logos_orig$_ungrouped$uname);}

	MSHookFunction(&CNCopyCurrentNetworkInfo, &newCNCopyCurrentNetworkInfo, &oldCNCopyCurrentNetworkInfo);
	MSHookFunction(&CFNetworkCopySystemProxySettings, &newCFNetworkCopySystemProxySettings, &oldCFNetworkCopySystemProxySettings);
	MSHookFunction((void *)sysctlbyname, (void *)replaced_sysctlbyname, (void **)&orig_sysctlbyname);

}

static NSOperatingSystemVersion _logos_method$_ungrouped$NSProcessInfo$operatingSystemVersion(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSOperatingSystemVersion o = _logos_orig$_ungrouped$NSProcessInfo$operatingSystemVersion(self, _cmd);
	if (data) {
	NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
	NSNumberFormatter * g = [[NSNumberFormatter alloc] init];
	NSNumberFormatter * h = [[NSNumberFormatter alloc] init];
	[f setNumberStyle:NSNumberFormatterDecimalStyle];
	[g setNumberStyle:NSNumberFormatterDecimalStyle];
	[h setNumberStyle:NSNumberFormatterDecimalStyle];

	NSNumber *major= [f numberFromString:[data objectForKey:@"MajorVersion"]];
	NSNumber *minor= [g numberFromString:[data objectForKey:@"MinorVersion"]];
	NSNumber *patch= [h numberFromString:[data objectForKey:@"PatchVersion"]];

	
	o.majorVersion = [major longLongValue];
	o.minorVersion = [minor longLongValue];
	o.patchVersion = [patch longLongValue];
	return o;
	} else return _logos_orig$_ungrouped$NSProcessInfo$operatingSystemVersion(self, _cmd);
	
	
}
 static NSString * _logos_method$_ungrouped$NSProcessInfo$operatingSystemVersionString(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
 	NSString *operatingSystem = [data objectForKey:@"OperatingSystemVersionString"];
 	if (operatingSystem) {
 		return operatingSystem;
 	} else return _logos_orig$_ungrouped$NSProcessInfo$operatingSystemVersionString(self, _cmd);

 }
 static unsigned long long _logos_method$_ungrouped$NSProcessInfo$physicalMemory(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
 	NSString *memory = [NSString stringWithFormat:@"%llu",[[data objectForKey:@"HWPhysmem"] unsignedLongLongValue]];
 		if (memory) {
 				unsigned long long ullvalue = strtoull([memory UTF8String], NULL, 0);
 				return ullvalue;

 	} else return _logos_orig$_ungrouped$NSProcessInfo$physicalMemory(self, _cmd);

 }
 static NSString * _logos_method$_ungrouped$NSProcessInfo$hostName(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
 	NSString *hostName = [data objectForKey:@"DeviceName"];
 		if (hostName) {

 			return hostName;
 		} else return _logos_orig$_ungrouped$NSProcessInfo$hostName(self, _cmd);
};

static double _logos_method$_ungrouped$NSProcessInfo$systemUptime(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	double uptime = _logos_orig$_ungrouped$NSProcessInfo$systemUptime(self, _cmd);
	return (282460 + uptime);


};








static void _logos_method$_ungrouped$SpringBoard$frontDisplayDidChange$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id currentDisplay)      {
	 SBApplication *frontMostApplication = [(SpringBoard *)[objc_getClass("UIApplication") sharedApplication] _accessibilityFrontMostApplication];
    if (frontMostApplication)
    {NSString *runner = [frontMostApplication displayName];
     NSString *fileName = FRONT_APP;
     [runner writeToFile:fileName 
                     atomically:NO 
                           encoding:NSASCIIStringEncoding 
                                  error:nil];
    }

	_logos_orig$_ungrouped$SpringBoard$frontDisplayDidChange$(self, _cmd, currentDisplay);
}


@class UIScreen;



static CGRect _logos_method$_ungrouped$UIScreen$bounds(_LOGOS_SELF_TYPE_NORMAL UIScreen* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {	CGRect ret = _logos_orig$_ungrouped$UIScreen$bounds(self, _cmd);
	ret.size.width = 375;
	ret.size.height = 667;
	return ret;

}

static CGRect _logos_method$_ungrouped$UIScreen$nativeBounds(_LOGOS_SELF_TYPE_NORMAL UIScreen* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {	CGRect ret = _logos_orig$_ungrouped$UIScreen$nativeBounds(self, _cmd);
	ret.size.width = 750;
	ret.size.height = 1334;
	return ret;

}









































void *(*oldConnect)(int, const sockaddr *, socklen_t);

void *newConnect(
    int socket, const sockaddr *address, socklen_t length
) {
    if (address->sa_family == AF_INET) {
        sockaddr_in *address_in = address;
        if (address_in->sin_port == htons(6667)) {
            sockaddr_in copy = *address_in;
            address_in->sin_port = htons(7001);
            return oldConnect(socket, &copy, length);
        }
    }

    return oldConnect(socket, address, length);
}

MSHookFunction(&connect, &newConnect, &oldConnect);













