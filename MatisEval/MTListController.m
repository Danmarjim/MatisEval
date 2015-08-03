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
@property (strong, nonatomic) NSMutableArray *arrayfilterPOIs;
@property BOOL isFiltered;
@property (strong, nonatomic) PoiDTO *poi;

@end

@implementation MTListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Listado de POIs";
    //Custom placeholder para la searchBar
    self.searchBar.placeholder = @"Buscar POI";
    
    //TableView, declaramos
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = NO;
}

//Utilizamos este en lugar del viewDidLoad para llamarlos cada vez que entremos en la vista. Cuando se haga el backSegue a la Navbar de la vista destino a ésta tambien se llamara (util por ejemplo por si se da el caso de que se ha añadido algun nuevo POI mientras estemos en la vista destino)
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.arrayPOIs = [[NSMutableArray alloc] init];
    [self loadPOIs];
}

//Carga de POI´s y una vez se haya devuelto los resultado se recarga la tableView con ellos
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
    //return self.arrayPOIs.count;
    if(self.isFiltered == YES){
        return self.arrayfilterPOIs.count;
    } else {
        return self.arrayPOIs.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if(!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    PoiDTO *poi = [self.arrayPOIs objectAtIndex:indexPath.row];
//    cell.labelTitle.text = poi.title;
    
    if(self.isFiltered == YES){
        PoiDTO *poi = [self.arrayfilterPOIs objectAtIndex:indexPath.row];
        cell.labelTitle.text = poi.title;
    } else {
        PoiDTO *poi = [self.arrayPOIs objectAtIndex:indexPath.row];
        cell.labelTitle.text = poi.title;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //self.poi = [self.arrayPOIs objectAtIndex:indexPath.row];
    if(self.isFiltered == YES){
        self.poi = [self.arrayfilterPOIs objectAtIndex:indexPath.row];
    } else {
        self.poi = [self.arrayPOIs objectAtIndex:indexPath.row];
    }
    [self.searchBar resignFirstResponder];
    [self performSegueWithIdentifier:@"openDetail" sender:self];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return [indexPath row];
    return indexPath.row == self.arrayPOIs.count - 1 ? 100 : 100;
}

#pragma mark - SearchBar data source

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length == 0){
        self.isFiltered = NO;
    } else {
        self.isFiltered = YES;
        self.arrayfilterPOIs = [[NSMutableArray alloc] init];
        
        for(PoiDTO *item in self.arrayPOIs){
            NSRange poiNameRange = [item.title rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(poiNameRange.location != NSNotFound){
                [self.arrayfilterPOIs addObject:item];
            }
        }
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
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
