//
//  Balls_of_DeathViewController.m
//  Balls of Death
//
//  Created by Craig Campbell on 5/6/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import "Balls_of_DeathViewController.h"
#import "Ball.h"

@implementation Balls_of_DeathViewController
@synthesize ball, arr, numBalls, count, ballsDodged, gameState, tapToBegin, player;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		arr = [[NSMutableArray alloc] init];
    }
    return self;
}*/


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



- (void)viewDidLoad {
    [super viewDidLoad];
	arr = [[NSMutableArray alloc] init];
	ball = [[UIImage imageNamed:@"sphere.png"] retain];
	player.center = CGPointMake(240, player.center.y+20);
	Ball *b;
	for(int i=0; i<5; i++){
		b = [[Ball alloc] initWithImage:ball];
		[self.view addSubview:b];
		b.hidden = YES;
		[arr addObject:b];
	}
	numBalls = 1;
	UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
	accel.delegate = self;
	accel.updateInterval = 1.0f/60.0f;
	[NSTimer scheduledTimerWithTimeInterval: 0.015 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	int newx = player.center.x-(acceleration.y*10);
	if(gameState == 1){
		if(newx-player.frame.size.width/2 >= 0 && newx+player.frame.size.width/2 <= self.view.bounds.size.width)
			player.center = CGPointMake(newx, player.center.y);
	}
}

-(void)gameLoop{
	if(gameState == 1){
		count++;
		if(count%1500==0){
			if(numBalls<=4){
				numBalls++;
			}
		}
		Ball *b;
		for(int i=0; i< numBalls; i++){
			b = [arr objectAtIndex:i];
			if(i==0 || b.hidden == NO || [[arr objectAtIndex:i-1] center].x == 480/numBalls){
				[b update];
				if(CGRectIntersectsRect(b.frame, player.frame)){
					gameState = 2;
					[tapToBegin setText:@"Game Over, tap to play again"];
					tapToBegin.hidden = NO;
			}
		}
		}
		NSString *score = [NSString stringWithFormat:@"%d", [Ball score]];
		[ballsDodged setText:score];
	}
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

-(void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event{
	if(gameState == 0){
		tapToBegin.hidden = YES;
		gameState = 1;
	}
	else if(gameState == 1){
		[tapToBegin setText:@"Tap to Resume"];
		tapToBegin.hidden = NO;
		gameState = 0;
	}
	else{
		tapToBegin.hidden = YES;
		numBalls = 1;
		count = 0;
		[Ball setScore:0];
		[ballsDodged setText:@"0"];
		player.center = CGPointMake(240, player.center.y);
		for(int i=0; i<5; i++){
			[[arr objectAtIndex:i] setHidden:YES];
		}
		gameState = 1;
	}
		
}
- (void)dealloc {
    [super dealloc];
}

@end
