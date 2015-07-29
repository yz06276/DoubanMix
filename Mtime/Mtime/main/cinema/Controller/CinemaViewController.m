//
//  CinemaViewController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaModel.h"
#import "DistrictList.h"
#import "TableViewCell.h"

@interface CinemaViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatTableView];
    _cinemaJsonDict = [self loadJson:@"cinema_list.json"];
    _districtJsonDict = [self loadJson:@"district_list.json"];
    _cinemaModelArray = [self _creatCinemaModel];
    _districtModelArray = [self _creatDistrictModel];
    
    [self reloadTwoModels];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)_creatTableView{
    
    UITableView* cinemaTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    cinemaTableView.dataSource = self;
    cinemaTableView.delegate = self;
    
    UINib* nib = [UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]];
    [cinemaTableView registerNib:nib forCellReuseIdentifier:@"cinemaCell"];
    cinemaTableView.backgroundColor = [UIColor clearColor];
        _tableView = cinemaTableView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view  addSubview:cinemaTableView];
    
    
    
}

#pragma mark - json解析

-(NSDictionary*)loadJson:(NSString*)JsonName{
    NSString* filePath = [[NSBundle mainBundle]pathForResource:JsonName ofType:nil];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return dict;
    
    
}



-(NSMutableArray*)_creatCinemaModel{
    
    NSMutableArray* array = [NSMutableArray array];
    NSArray* cinemaListArray = _cinemaJsonDict[@"cinemaList"];
    
    for (NSDictionary* cinemaDict in cinemaListArray) {
        
        CinemaModel* model = [[CinemaModel alloc]init];
        [model setValuesForKeysWithDictionary:cinemaDict];
        [array addObject:model];
        
    }
    return array;
}

-(NSMutableArray*)_creatDistrictModel{
    
//    _districtModelArray = [NSMutableArray array];
    NSArray* districtListArray = _districtJsonDict[@"districtList"];
    NSMutableArray* array = [NSMutableArray array];
    for (NSDictionary* districtDict in districtListArray) {
        
        DistrictList* districtList = [[DistrictList alloc]init];
        [districtList setValuesForKeysWithDictionary:districtDict];
        [array addObject:districtList];
        
    }
    return array;
}

-(void)reloadTwoModels{
    
    
    for (DistrictList* district in _districtModelArray) {
        district.cinemaModelArray = [NSMutableArray array];
        for (CinemaModel* cinema  in _cinemaModelArray) {
            
            if ([district.id isEqualToString:cinema.districtId]) {
                [district.cinemaModelArray addObject:cinema];
            }
            
        }
    }
    
}


#pragma mark - TableView Delegat & Datasource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _districtModelArray.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (((DistrictList*)_districtModelArray[section]).isHide == YES) {
        return ((DistrictList*)_districtModelArray[section]).cinemaModelArray.count;
    }else return 0;
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cinemaCell"];
    NSMutableArray* array = ((DistrictList*)_districtModelArray[indexPath.section]).cinemaModelArray;
    CinemaModel* model = (CinemaModel*)array[indexPath.row];

    cell.cinemaModel = model;
    
    return cell;
    
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    DistrictList* district = _districtModelArray[section];
    
    UIView* viewForHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Swidth, 40)];
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:viewForHeader.frame];
    UIImage* img = [UIImage imageNamed:@"ypf_on"];
    img = [img stretchableImageWithLeftCapWidth:0.5*img.size.width topCapHeight:0.5*img.size.height ];
    imageView.image = img;
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Swidth, viewForHeader.bounds.size.height)];
    label.text = district.name;
    UIButton* btn = [[UIButton alloc]initWithFrame:viewForHeader.bounds];
    [viewForHeader addSubview:btn];
    btn.tag = section;
    [btn addTarget: self action:@selector(showOrHideCinema:) forControlEvents:UIControlEventTouchUpInside];
    [viewForHeader addSubview:imageView];
    [viewForHeader addSubview:label];
    return viewForHeader;
    
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    
    return 40;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

#pragma mark - Action

-(void)showOrHideCinema:(UIButton*)btn{
    
    ((DistrictList*)_districtModelArray[btn.tag]).isHide = !((DistrictList*)_districtModelArray[btn.tag]).isHide;
    
    NSIndexSet* indexset = [NSIndexSet indexSetWithIndex:btn.tag];
        [_tableView reloadSections:indexset withRowAnimation:UITableViewRowAnimationAutomatic];

    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle{  //这个函数返回的就是
//      return   [self.topViewController preferredStatusBarStyle];
    
    return UIStatusBarStyleLightContent;
    
    //如果父类重写了这个玩意，那么子类即使再重写这个函数也不会生效,其他的我现阶段搞不清楚 http://my.oschina.net/shede333/blog/304560
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
