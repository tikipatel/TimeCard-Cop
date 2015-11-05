//
//  ViewController.h
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) NSMutableArray *projectArray;
@property (strong,nonatomic) NSMutableArray *taskArray;
@property (strong,nonatomic) NSMutableArray *favoriteArray;
@property (strong,nonatomic) NSMutableArray *hourArray;

@property (strong,nonatomic) NSArray *savedProjectArray;
@property (strong,nonatomic) NSArray *savedTaskArray;
@property (strong,nonatomic) NSArray *savedFavoriteArray;
@property (strong,nonatomic) NSArray *savedHourArray;

@property (weak, nonatomic) IBOutlet UILabel *project1;
@property (weak, nonatomic) IBOutlet UILabel *task1;
@property (weak, nonatomic) IBOutlet UILabel *hours1;

@property (weak, nonatomic) IBOutlet UILabel *project2;
@property (weak, nonatomic) IBOutlet UILabel *task2;
@property (weak, nonatomic) IBOutlet UILabel *hours2;

@property (weak, nonatomic) IBOutlet UILabel *project3;
@property (weak, nonatomic) IBOutlet UILabel *task3;
@property (weak, nonatomic) IBOutlet UILabel *hours3;

@property (weak, nonatomic) IBOutlet UILabel *project4;
@property (weak, nonatomic) IBOutlet UILabel *task4;
@property (weak, nonatomic) IBOutlet UILabel *hours4;

@property (weak, nonatomic) IBOutlet UILabel *project5;
@property (weak, nonatomic) IBOutlet UILabel *task5;
@property (weak, nonatomic) IBOutlet UILabel *hours5;

@property (weak, nonatomic) IBOutlet UILabel *project6;
@property (weak, nonatomic) IBOutlet UILabel *task6;
@property (weak, nonatomic) IBOutlet UILabel *hours6;

@property (weak, nonatomic) IBOutlet UILabel *project7;
@property (weak, nonatomic) IBOutlet UILabel *task7;
@property (weak, nonatomic) IBOutlet UILabel *hours7;

@property (weak, nonatomic) IBOutlet UILabel *project8;
@property (weak, nonatomic) IBOutlet UILabel *task8;
@property (weak, nonatomic) IBOutlet UILabel *hours8;

@property (weak, nonatomic) IBOutlet UILabel *project9;
@property (weak, nonatomic) IBOutlet UILabel *task9;
@property (weak, nonatomic) IBOutlet UILabel *hours9;

@property (weak, nonatomic) IBOutlet UILabel *project10;
@property (weak, nonatomic) IBOutlet UILabel *task10;
@property (weak, nonatomic) IBOutlet UILabel *hours10;

@property (weak, nonatomic) IBOutlet UILabel *project11;
@property (weak, nonatomic) IBOutlet UILabel *task11;
@property (weak, nonatomic) IBOutlet UILabel *hours11;

@property (weak, nonatomic) IBOutlet UILabel *project12;
@property (weak, nonatomic) IBOutlet UILabel *task12;
@property (weak, nonatomic) IBOutlet UILabel *hours12;

@property (weak, nonatomic) IBOutlet UILabel *project13;
@property (weak, nonatomic) IBOutlet UILabel *task13;
@property (weak, nonatomic) IBOutlet UILabel *hours13;

@end

