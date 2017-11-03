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
//INIT DATA
#define PREF_FILES @"var/mobile/Library/Preferences/data.json"
#define FRONT_APP @"var/mobile/Library/Preferences/frontApp.txt"

@interface PSMagnifyMode : NSObject
+ (id)magnifyModeWithSize:(CGSize)arg1 name:(id)arg2 localizedName:(id)arg3 isZoomed:(bool)arg4;
// - (id)copyWithZone:(struct _NSZone { }*)arg1;
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


%hook UIDevice


- (NSString *)name {

	    NSString *uiDevice = [data objectForKey:@"DeviceName"];	
	    if (uiDevice)
		return uiDevice;
		else return %orig;
	}
- (NSUUID *)identifierForVendor {
		NSUUID *uiIFV = [[NSUUID UUID] initWithUUIDString:[data objectForKey:@"IdForVendor"]];
		if (uiIFV) 
			return uiIFV;
		else return %orig;

}
- (NSString *)systemVersion {
		NSString *uiVers = [NSString stringWithString:[data objectForKey:@"OSVersion"]];
		if (uiVers) {
			return uiVers;
		}
		else return %orig;

}
- (BOOL)isMultitaskingSupported {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
- (BOOL)isProximityMonitoringEnabled {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
- (BOOL)isBatteryMonitoringEnabled {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
- (BOOL)isAccessibilityElement {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}
- (BOOL)isGeneratingDeviceOrientationNotifications {
u_int32_t randomNumber = (arc4random() % ((unsigned)RAND_MAX + 1));
if(randomNumber % 5 ==0)
    return YES;
return NO;

}

%end

%hook CTCarrier 
- (NSString *)carrierName {
	NSString *cName = [data objectForKey:@"Network"];
	if (cName)
		{return cName;}
	else return %orig;

	}
- (NSString *)isoCountryCode {
	NSString *iCC = [data objectForKey:@"IOS"];
	if (iCC)
		{return iCC;}
	else return %orig;
}

- (NSString *)mobileCountryCode {
	NSString *mCC = [data objectForKey:@"MCC"];
	if (mCC) 
		{return mCC;}
	else return %orig;

}
- (NSString *) mobileNetworkCode {
	NSString *mnC = [data objectForKey:@"MNCC"];
	if (mnC) {
		return mnC;

	}
	else return %orig;
}
- (BOOL) allowsVOIP {
	
	return YES;
}


%end


%hook ASIdentifierManager
- (NSUUID *) advertisingIdentifier {
	NSUUID *asiI = [[NSUUID UUID] initWithUUIDString:[data objectForKey:@"AdvId"]];
	if (asiI) {
		return asiI;
	}
	else return %orig;

}
%end

int uname(struct utsname *);

%hookf(int, uname, struct utsname *value) {
	int ret = %orig;
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

// Wifi
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
// Proxy
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

// sysctlbyname
int (*orig_sysctlbyname) (const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
int replaced_sysctlbyname (const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen) {
	int ret = orig_sysctlbyname(name, oldp, oldlenp, newp, newlen);
    NSString *hwMachine = [data objectForKey:@"HWMachine"];
    NSString *hwModel = [data objectForKey:@"HW.Model"];
    // NSString *hwMemsize = [data objectForKey:@"HWPhysmem"];
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


%ctor {
	%init;

	MSHookFunction(&CNCopyCurrentNetworkInfo, &newCNCopyCurrentNetworkInfo, &oldCNCopyCurrentNetworkInfo);
	MSHookFunction(&CFNetworkCopySystemProxySettings, &newCFNetworkCopySystemProxySettings, &oldCFNetworkCopySystemProxySettings);
	MSHookFunction((void *)sysctlbyname, (void *)replaced_sysctlbyname, (void **)&orig_sysctlbyname);

}
%hook NSProcessInfo
- (NSOperatingSystemVersion)operatingSystemVersion {
	NSOperatingSystemVersion o = %orig;
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
	} else return %orig;
	
	
}
 -(NSString *)operatingSystemVersionString {
 	NSString *operatingSystem = [data objectForKey:@"OperatingSystemVersionString"];
 	if (operatingSystem) {
 		return operatingSystem;
 	} else return %orig;

 }
 - (unsigned long long) physicalMemory {
 	NSString *memory = [NSString stringWithFormat:@"%llu",[[data objectForKey:@"HWPhysmem"] unsignedLongLongValue]];
 		if (memory) {
 				unsigned long long ullvalue = strtoull([memory UTF8String], NULL, 0);
 				return ullvalue;

 	} else return %orig;

 }
 - (NSString *)hostName {
 	NSString *hostName = [data objectForKey:@"DeviceName"];
 		if (hostName) {

 			return hostName;
 		} else return %orig;
};

- (double)systemUptime {
	double uptime = %orig;
	return (282460 + uptime);


};

%end


%hook SpringBoard

- (void)frontDisplayDidChange:(id)currentDisplay    

{
	 SBApplication *frontMostApplication = [(SpringBoard *)[objc_getClass("UIApplication") sharedApplication] _accessibilityFrontMostApplication];
    if (frontMostApplication)
    {NSString *runner = [frontMostApplication displayName];
     NSString *fileName = FRONT_APP;
     [runner writeToFile:fileName 
                     atomically:NO 
                           encoding:NSASCIIStringEncoding 
                                  error:nil];
    }

	%orig;
}
%end

@class UIScreen;
%hook UIScreen

- (CGRect) bounds
{	CGRect ret = %orig;
	ret.size.width = 375;
	ret.size.height = 667;
	return ret;

}
- (CGRect) nativeBounds
{	CGRect ret = %orig;
	ret.size.width = 750;
	ret.size.height = 1334;
	return ret;

}

%end


//Jailbreak EXTENSION
// %hook NSFileManager
// - (BOOL)fileExistsAtPath:(NSString *)path
// {	
//     // %log;

//     if ([path isEqualToString:@"/Applications/Cydia.app"] ||
//     	[path isEqualToString:@"/Applications/Filza.app"] ||
//     	[path isEqualToString:@"/Applications/iFile.app"] ||
//     	[path isEqualToString:@"/Applications/LocationChanger.app"] ||
//     	[path isEqualToString:@"/Applications/AutoTouch.app"] ||
//         [path isEqualToString:@"/Applications/blackra1n.app"] ||
//         [path isEqualToString:@"/Applications/FakeCarrier.app"] ||
//         [path isEqualToString:@"/Applications/Iny.app"] ||
//         [path isEqualToString:@"/Applications/IntelliScreen.app"] ||
//         [path isEqualToString:@"/Applications/MxTube.app"] ||
//         [path isEqualToString:@"/Applications/RockApp.app"] ||
//         [path isEqualToString:@"/Applications/SBSettings.app"] ||
//         [path isEqualToString:@"/Applications/WinterBoard.app"] ||
//         [path isEqualToString:@"/private/var/tmp/cydia.log"] ||
//         [path isEqualToString:@"/usr/binsshd"] ||
//         [path isEqualToString:@"/usr/sbinsshd"] ||
//         [path isEqualToString:@"/usr/libexec/sftp-server"] ||
//         [path isEqualToString:@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"] ||
//         [path isEqualToString:@"/Library/MobileSubstrateMobileSubstrate.dylib"] ||
//         [path isEqualToString:@"/var/log/syslog"] ||
//         [path isEqualToString:@"/bin/bash"] ||
//         [path isEqualToString:@"/bin/sh"] ||
//         [path isEqualToString:@"/etc/ssh/sshd_config"] ||
//         [path isEqualToString:@"/usr/libexec/ssh-keysign"]) {
//         return NO;
//     }
//     //Lacking of slashes? Yes, that's what they 'detect' in the app. lol
//     return %orig;
// }
// %end

// void *(*oldConnect)(int, const sockaddr *, socklen_t);

// void *newConnect(
//     int socket, const sockaddr *address, socklen_t length
// ) {
//     if (address->sa_family == AF_INET) {
//         sockaddr_in *address_in = address;
//         if (address_in->sin_port == htons(6667)) {
//             sockaddr_in copy = *address_in;
//             address_in->sin_port = htons(7001);
//             return oldConnect(socket, &copy, length);
//         }
//     }

//     return oldConnect(socket, address, length);
// }

// MSHookFunction(&connect, &newConnect, &oldConnect);

%hook CDStructures
	

%end











