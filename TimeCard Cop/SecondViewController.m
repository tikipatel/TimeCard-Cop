//
//  SecondViewController.m
//  TimeCard Cop
//
//  Created by Ryan S Truran on 11/1/15.
//  Copyright © 2015 Trü App Dev. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIPickerViewDelegate,UIPickerViewDataSource>

@end


@implementation SecondViewController
@synthesize projectArray = _projectArray;
@synthesize taskArray = _taskArray;
@synthesize favoriteArray = _favoriteArray;
@synthesize hourArray = _hourArray;
@synthesize hourLabel=_hourLabel;
@synthesize projectCode=_projectCode;
@synthesize taskCode = _taskCode;
@synthesize favoriteCode = _favoriteCode;



//Getter

//Dismisses the keyboard after editiing the EndProjectCode
- (IBAction)EndProjectCode:(id)sender {
    [sender resignFirstResponder];
}
//--------------------------------------------------------------------
//Dismisses the keyboard after editiing the EndTaskCode
- (IBAction)EndTaskCode:(id)sender {
    [sender resignFirstResponder];
}
//--------------------------------------------------------------------
//Dismisses the keyboard after editiing the EndFavoriteCode
- (IBAction)EndFavoriteCode:(id)sender {
    [sender resignFirstResponder];
}
//--------------------------------------------------------------------
//Round the slider value to the nearest 1/2
- (IBAction)hourSlider:(UISlider *)sender {
    float value = round(2.0f*self.hourSlider.value)/2.0f;
    _hourLabel.text = [NSString stringWithFormat:@"%0.1f",(float) value];
}
//---------------------------------------------------------------------
//Add Charge Code Button
- (IBAction)addChargeCode:(UIBarButtonItem *)sender {
    //Alert to ensure the text fields have the required data.
    if (([_projectCode.text isEqual:@""]) || ([_taskCode.text isEqual:@""])){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Insufficent Information" message:@"Project Data and Task Data are required." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
    //add data from the project, task, and description text fields and the hour slider /label value.
    [_projectArray addObject:_projectCode.text];
    [_taskArray addObject:_taskCode.text];
    [_favoriteArray addObject: _favoriteCode.text];
    [_hourArray addObject: _hourLabel.text];
    
    /*copy the mutable project,task,favorites, and hour arrays to savedArrays and tempMemoryArrays. saved Project Arrays are the arrays that are saved for use on ViewController.m as label data. tempMemoryArrays are used to store temporarily for use in the pickerView. */
    NSArray *savedProjectArray = [[NSArray alloc] initWithArray:_projectArray];
    NSArray *savedTaskArray = [[NSArray alloc] initWithArray:_taskArray];
    NSArray *savedFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
    NSArray *savedHourArray = [[NSArray alloc] initWithArray:_hourArray];
    NSArray *tempMemoryProjectArray = [[NSArray alloc] initWithArray:_projectArray];
    NSArray *tempMemoryTaskArray = [[NSArray alloc] initWithArray:_taskArray];
    NSArray *tempMemoryFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
    NSArray *tempMemoryHourArray = [[NSArray alloc] initWithArray:_hourArray];   
    
    //Save Data In User Defaults Database
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:savedProjectArray forKey:@"projectArray"];
    [userDefaults setObject:savedTaskArray forKey:@"taskArray"];
    [userDefaults setObject:savedFavoriteArray forKey:@"favoriteArray"];
    [userDefaults setObject:savedHourArray forKey:@"hourArray"];
    [userDefaults setObject:tempMemoryProjectArray forKey:@"tempMemoryProjectArray"];
    [userDefaults setObject:tempMemoryTaskArray forKey:@"tempMemoryTaskArray"];
    [userDefaults setObject:tempMemoryFavoriteArray forKey:@"tempMemoryFavoriteArray"];
    [userDefaults setObject:tempMemoryHourArray forKey:@"tempMemoryHourArray"];
    [userDefaults synchronize];
    
    //Alert that notifies the user that the charge code has posted.
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Charge Code Added" message:@"Add more charge codes or press the back button" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
    
         }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 //Load savedArray's and tempMemoryArrays after loading the view
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *savedProjectArray = [userDefaults objectForKey:@"projectArray"];
    NSArray *savedTaskArray = [userDefaults objectForKey:@"taskArray"];
    NSArray *savedFavoriteArray = [userDefaults objectForKey:@"favoriteArray"];
    NSArray *savedHourArray = [userDefaults objectForKey:@"hourArray"];
    NSArray *tempMemoryProjectArray = [userDefaults objectForKey:@"tempMemoryProjectArray"];
    NSArray *tempMemoryTaskArray = [userDefaults objectForKey:@"tempMemoryTaskArray"];
    NSArray *tempMemoryFavoriteArray = [userDefaults objectForKey:@"tempMemoryFavoriteArray"];
    NSArray *tempMemoryHourArray = [userDefaults objectForKey:@"tempMemoryHourArray"];
    //Fill project Array with the data of the savedArray
    if(_projectArray ==nil){
        _projectArray = [[NSMutableArray alloc] initWithArray:savedProjectArray];
    }
    //Fill task Array with the data of the savedArray
    if(_taskArray ==nil){
        _taskArray = [[NSMutableArray alloc] initWithArray:savedTaskArray];
    }
    //Fill favorite Array with the data of the savedArray
    if(_favoriteArray ==nil){
        _favoriteArray = [[NSMutableArray alloc] initWithArray:savedFavoriteArray];
    }
    //Fill hour Array with the data of the savedArray
    if(_hourArray ==nil){
        _hourArray = [[NSMutableArray alloc] initWithArray:savedHourArray];
    }
/* I'm not sure why i put these here. they can probably be erased as the 
tempMemoryProjectArray and tempMemoryTaskArray are loaded at the start of this function
  */
    if(_tempMemoryProjectArray==nil){
        _tempMemoryProjectArray = [[NSArray alloc] initWithArray:tempMemoryProjectArray];
    }
    if(_tempMemoryTaskArray==nil){
        _tempMemoryTaskArray = [[NSArray alloc] initWithArray:tempMemoryTaskArray];
    }
    //added for debugging
    NSLog(@"%@",tempMemoryProjectArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(NSInteger)numberOfComponetsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [tempMemoryProjectArray count];

}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
 
 return [tempMemoryProjectArray objectAtIndex:row];
 
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}

- (IBAction)clearTempMemory:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Clear All Charge Codes" message:@"Are you sure you want to clear all charge codes from this screen?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        //prepare for erasing tempMemoryProjectArray
        [_projectArray removeAllObjects];
        [_taskArray removeAllObjects];
        [_favoriteArray removeAllObjects];
        [_hourArray removeAllObjects];
        
        //redefine tempMemoryArray's as empty Arrays
        NSArray *tempMemoryProjectArray = [[NSArray alloc] initWithArray:_projectArray];
        NSArray *tempMemoryTaskArray = [[NSArray alloc] initWithArray:_taskArray];
        NSArray *tempMemoryFavoriteArray = [[NSArray alloc] initWithArray:_favoriteArray];
        NSArray *tempMemoryHourArray = [[NSArray alloc] initWithArray:_hourArray];
        
        // Save empty tempMemoryArray to userDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:tempMemoryProjectArray forKey:@"tempMemoryProjectArray"];
        [userDefaults setObject:tempMemoryTaskArray forKey:@"tempMemoryTaskArray"];
        [userDefaults setObject:tempMemoryFavoriteArray forKey:@"tempMemoryFavoriteArray"];
        [userDefaults setObject:tempMemoryHourArray forKey:@"tempMemoryHourArray"];
        [userDefaults synchronize];
    }];

    UIAlertAction* no = [UIAlertAction actionWithTitle:@"No" style: UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:no];
    [alertController addAction:yes];
    [self presentViewController:alertController animated:YES completion:nil];
    

}
@end
