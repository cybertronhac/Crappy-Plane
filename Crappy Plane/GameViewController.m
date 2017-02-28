//
//  GameViewController.m
//  Crappy Plane
//
//  Created by Roshit Gopinath on 11/30/14.
//  Copyright (c) 2014 Roshit Gopinath. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

-(IBAction)start:(id)sender
{
    barTop.hidden = NO;
    barBottom.hidden = NO;
    startGame.hidden = YES;
    flightTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveFlight) userInfo: nil repeats:YES ];
    [self PlaceBars];
    
    barTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BarMoving) userInfo:nil repeats:YES];
}


-(void)GameOver
{
    [flightTimer invalidate];
    [barTimer invalidate];
    barTop.hidden = YES;
    barBottom.hidden = YES;
    plane.hidden = YES;
    exit.hidden = NO;
}

-(void)Score
{
    ScoreNumber++;
    scoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    if (HighScore < ScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
}

-(void)BarMoving
{
    barTop.center = CGPointMake(barTop.center.x - 1, barTop.center.y);
    barBottom.center = CGPointMake(barBottom.center.x - 1, barBottom.center.y);
    
    if (barTop.center.x < -28)
    {
        [self PlaceBars];
    }
    
    if (barBottom.center.x == 9)
    {
        [self Score];
    }
    
    if (CGRectIntersectsRect(plane.frame, barTop.frame))
    {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(plane.frame, barBottom.frame))
    {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(plane.frame, bottom.frame))
    {
        [self GameOver];
    }
}

-(void)PlaceBars
{
    RandomTopBarPosition = arc4random() % 350;
    RandomTopBarPosition = RandomTopBarPosition - 228;
    //RandomBottomBarPosition = RandomTopBarPosition + 655;
    RandomBottomBarPosition = RandomTopBarPosition + 685;
    
    barTop.center = CGPointMake(340, RandomTopBarPosition);
    barBottom.center = CGPointMake(340, RandomBottomBarPosition);
}

-(void)moveFlight
{
    plane.center = CGPointMake(plane.center.x, plane.center.y - flightVal);
    flightVal = flightVal - 5;
    if (flightVal < -15)
    {
        flightVal = -15;
    }
    
    if (flightVal > 0)
    {
        plane.image = [UIImage imageNamed:@"up.png"];
    }
    if (flightVal < 0)
    {
        plane.image = [UIImage imageNamed:@"down.png"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    flightVal = 25;
}

- (void)viewDidLoad {
    
    exit.hidden = YES;
    barTop.hidden = YES;
    barBottom.hidden = YES;
    
    ScoreNumber = 0;
    
    HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
