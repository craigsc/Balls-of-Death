//
//  Balls_of_DeathViewController.h
//  Balls of Death
//
//  Created by Craig Campbell on 5/6/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Balls_of_DeathViewController : UIViewController <UIAccelerometerDelegate>{
	NSMutableArray *arr;
	UIImage *ball;
	int numBalls;
	int count;
	IBOutlet UILabel *ballsDodged;
	IBOutlet UILabel *tapToBegin;
	int gameState;
	IBOutlet UIImageView *player;
}
@property(nonatomic, retain) UIImage *ball;
@property(nonatomic, retain) NSMutableArray *arr;
@property(nonatomic) int numBalls;
@property(nonatomic) int count;
@property(nonatomic, retain) IBOutlet UILabel *ballsDodged;
@property(nonatomic) int gameState;
@property(nonatomic, retain) IBOutlet UILabel *tapToBegin;
@property(nonatomic, retain) IBOutlet UIImageView *player;

@end

