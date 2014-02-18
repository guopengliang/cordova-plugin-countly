//
//  CDVCountly.m
//  Trailerpop
//
//  Created by Guopeng Liang on 07/17/13.
//
//

#import "Countly.h"
#import "CDVCountly.h"

@interface CDVCountly()

@end

@implementation CDVCountly

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}


//- (void)recordEvent:(NSString *)key count:(int)count
//- (void)recordEvent:(NSString *)key count:(int)count sum:(double)sum
//- (void)recordEvent:(NSString *)key segmentation:(NSDictionary *)segmentation count:(int)count;
//- (void)recordEvent:(NSString *)key segmentation:(NSDictionary *)segmentation count:(int)count sum:(double)sum;

- (void) recordEvent:(CDVInvokedUrlCommand*)command
{
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Countly Event: %@ x %@", [command.arguments objectAtIndex:0], [command.arguments objectAtIndex:1]);
    
    @try {
        NSString* key = [command.arguments objectAtIndex:0];
        int count = [[command.arguments objectAtIndex:1]integerValue];
        
        [[Countly sharedInstance] recordEvent:key count:count];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
    
}

- (void) recordEventWithSum:(CDVInvokedUrlCommand*)command
{
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Countly Event: %@ x %@ (sum = %@)", [command.arguments objectAtIndex:0], [command.arguments objectAtIndex:1], [command.arguments objectAtIndex:2]);
    
    @try {
        NSString* key = [command.arguments objectAtIndex:0];
        int count = [[command.arguments objectAtIndex:1]integerValue];
        double sum = [[command.arguments objectAtIndex:2]doubleValue];
        
        [[Countly sharedInstance] recordEvent:key count:count sum:sum];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
    
}

- (void) recordEventWithSegmentation:(CDVInvokedUrlCommand*)command
{
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Countly Event: %@ x %@", [command.arguments objectAtIndex:0], [command.arguments objectAtIndex:2]);
    NSLog(@"Segmentation: %@", [command.arguments objectAtIndex:1]);
    
    @try {
        NSString* key = [command.arguments objectAtIndex:0];
        NSError *e = nil;
        NSData * data = [[command.arguments objectAtIndex:1] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* segmentation = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        int count = [[command.arguments objectAtIndex:2]integerValue];
        
        [[Countly sharedInstance] recordEvent:key segmentation:segmentation count:count];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
    
}

- (void) recordEventWithSegmentationAndSum:(CDVInvokedUrlCommand*)command
{
    
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"Logging Countly Event: %@ x %@ (sum = %@)", [command.arguments objectAtIndex:0], [command.arguments objectAtIndex:2], [command.arguments objectAtIndex:3]);
    NSLog(@"Segmentation: %@", [command.arguments objectAtIndex:1]);
    
    @try {
        NSString* key = [command.arguments objectAtIndex:0];
        NSError *e = nil;
        NSData * data = [[command.arguments objectAtIndex:1] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* segmentation = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        int count = [[command.arguments objectAtIndex:2]integerValue];
        double sum = [[command.arguments objectAtIndex:3]doubleValue];
        
        [[Countly sharedInstance] recordEvent:key segmentation:segmentation count:count sum:sum];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    }
    @catch (NSException *exception) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION
                                         messageAsString:[exception reason]];
        javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    }
    
    [self writeJavascript:javaScript];
    
}
@end
