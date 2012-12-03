//
//  Ball.h
//  Balls of Death
//
//  Created by Craig Campbell on 5/6/09.
//  Copyright 2009 Georgia Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ball : UIImageView {
	float xloc;
}
-(void)update;
+(int)score;
+(void)setScore:(int)num;
@property(nonatomic) float xloc;

@end
