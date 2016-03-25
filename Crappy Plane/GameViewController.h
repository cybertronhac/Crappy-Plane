//
//  GameViewController.h
//  Crappy Plane
//
//  Created by Roshit Gopinath on 11/30/14.
//  Copyright (c) 2014 Roshit Gopinath. All rights reserved.
//

#import <UIKit/UIKit.h>

int flightVal;
int RandomTopBarPosition;
int RandomBottomBarPosition;
int ScoreNumber;
NSInteger HighScore;

@interface GameViewController : UIViewController
{
    IBOutlet UIImageView *plane;
    IBOutlet UIButton *startGame;
    IBOutlet UIImageView *barTop;
    IBOutlet UIImageView *barBottom;
    IBOutlet UIImageView *bottom;
    IBOutlet UIButton *exit;
    IBOutlet UILabel *scoreLabel;
    
    NSTimer *flightTimer;
    NSTimer *barTimer;
}

-(IBAction)start:(id)sender;
-(void)moveFlight;
-(void)BarMoving;
-(void)PlaceBars;
-(void)Score;
-(void)GameOver;

@end
