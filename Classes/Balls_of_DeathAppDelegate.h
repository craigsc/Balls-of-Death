//
//  Balls_of_DeathAppDelegate.h
//  Balls of Death
//
//  Created by Craig Campbell on 5/6/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Balls_of_DeathViewController;

@interface Balls_of_DeathAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Balls_of_DeathViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Balls_of_DeathViewController *viewController;

@end

