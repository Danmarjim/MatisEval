//
//  MTListController.m
//  MatisEval
//
//  Created by Daniel Martin Jimenez on 30/7/15.
//  Copyright (c) 2015 Daniel Martin Jimenez. All rights reserved.
//

#import "MTListController.h"

#import "CustomCell.h"
#import "GetPOIActionTask.h"
#import "GetPOIRequestDTO.h"
#import "PoiDTO.h"
#import "MTDetailController.h"

@interface MTListController ()

@property (strong, nonatomic) NSMutableArray *arrayPOIs;
@property (strong, nonatomic) PoiDTO *poi;

@end

@implementation MTListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Listado de POIs";
    
    //TableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.arrayPOIs = [[NSMutableArray alloc] init];
    [self loadPOIs];
}

- (void)loadPOIs
{
    [GetPOIActionTask getPOIActionTaskForRequest:nil showLoadingView:YES completed:^(NSInteger statusCode, GetPOIResponseDTO *response) {
        NSLog(@"La salida es: %@", response.list);
        for(PoiDTO *item in response.list){
            [self.arrayPOIs addObject:item];
        }
        [self.tableView reloadData];
    } error:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.arrayPOIs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    PoiDTO *poi = [self.arrayPOIs objectAtIndex:indexPath.row];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.labelTitle.text = poi.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.poi = [self.arrayPOIs objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"openDetail" sender:self];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [indexPath row];
    return indexPath.row == self.arrayPOIs.count - 1 ? 100 : 100;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"openDetail"])
    {
        MTDetailController *destinationController = [segue destinationViewController];
        destinationController.idPOI = self.poi.idPOI;
    }
    
}

@end
