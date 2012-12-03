//
//  Balls_of_DeathAppDelegate.m
//  Balls of Death
//
//  Created by Craig Campbell on 5/6/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import "Balls_of_DeathAppDelegate.h"
#import "Balls_of_DeathViewController.h"

@implementation Balls_of_DeathAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
