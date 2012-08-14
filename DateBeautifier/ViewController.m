//
//  ViewController.m
//  DateBeautifier
//
//  Created by thomas on 13.08.12.
//  Copyright (c) 2012 Ingenieurbüro Edelmann. All rights reserved.
//

#import "ViewController.h"
#import "DateTimeBeautifier.h"

@implementation ViewController

@synthesize tbl1;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    tableData = [NSArray arrayWithObjects:
                 [NSDate date],
                 [[NSDate date] dateByAddingTimeInterval:-1.0],
                 [[NSDate date] dateByAddingTimeInterval:-2.0],
                [[NSDate date] dateByAddingTimeInterval:-60.0],
                [[NSDate date] dateByAddingTimeInterval:-120.0],
                [[NSDate date] dateByAddingTimeInterval:-3600.0],
                [[NSDate date] dateByAddingTimeInterval:-7200.0],
                [[NSDate date] dateByAddingTimeInterval:-86400.0],
                 [[NSDate date] dateByAddingTimeInterval:-172800.0],
                 [[NSDate date] dateByAddingTimeInterval:-2678400.0],
                 [[NSDate date] dateByAddingTimeInterval:-5356800.0],
                 [[NSDate date] dateByAddingTimeInterval:-31622400],
                 [[NSDate date] dateByAddingTimeInterval:-63244800.0],
                 nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.navigationItem.title = @"DateBeautifier Demo";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"dd.MM.yyyy HH:mm:ss"];

    NSString *helpString = [NSString stringWithFormat:@"%@\n%@",
                            [dateFormatter stringFromDate:[tableData objectAtIndex:indexPath.row]],
                            [[DateTimeBeautifier alloc] getDateTimeBeautifiedFromDate:
                             [tableData objectAtIndex:indexPath.row] ]];

    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 2;  // 0 means no max.
    
    cell.textLabel.text = helpString;

    return cell;
}

@end
