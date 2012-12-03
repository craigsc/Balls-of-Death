//
//  Ball.m
//  Balls of Death
//
//  Created by Craig Campbell on 5/6/09.
//  Copyright 2009 Georgia Institute of Technology. All rights reserved.
//

#import "Ball.h"

static int score;
@implementation Ball
@synthesize xloc;

+(int)score{
	return score;
}
+(void)setScore:(int)num{
	score = num;
}
-(void)setUp{
	if(self.hidden == YES)
		self.hidden = NO;
	xloc = random()%320;
	self.center = CGPointMake(480+self.frame.size.width/2, 320-fabs(cos(xloc))*200-self.frame.size.height/2);
}
-(void)update{
	if(xloc == 0 || self.hidden == YES){
		[self setUp];
	}
	if((self.center.x+self.frame.size.width/2)<=0){
		score++;
		[self setUp];
	}
	else{
		xloc+=.03;
		self.center = CGPointMake(self.center.x-4, 320-fabs(cos(xloc))*200-self.frame.size.height/2);
	}
}
@end
