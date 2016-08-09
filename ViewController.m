//
//  ViewController.m
//  QQListDemo
//
//  Created by mistong on 16/8/9.
//  Copyright © 2016年 赵伟争. All rights reserved.
//

#import "ViewController.h"

#define Screenwidth [UIScreen mainScreen].bounds.size.width
#define ScreennHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    BOOL close[30];
}
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //这个的目的是为了使得启动app时，单元格是收缩的
    for (int i = 0; i<30; i++){
        close[i] = YES;
    }
    [self creatTableView];
    //[self getData];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (close[section]) {
        return 0;
    }
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组 第%ld行",indexPath.section,indexPath.row];
    
    return cell;
}
//UIControl是UIView的子类，当然也是UIResponder的子类。UIControl是诸如UIButton、UISwitch、UITextField等控件的父类，它本身也包含了一些属性和方法，但是不能直接使用UIControl类，它只是定义了子类都需要使用的方法。
//创建组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIControl *view = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, Screenwidth, 50)];
    view.tag = 1000 + section;
    view.backgroundColor = [UIColor grayColor];;
    [view addTarget:self action:@selector(sectionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, 70, 30)];
    label.textColor = [UIColor colorWithRed:1.000 green:0.985 blue:0.996 alpha:1.000];
    label.font = [UIFont systemFontOfSize:14];
    label.text = [NSString stringWithFormat:@"第%ld组",section];
    [view addSubview:label];
    
    
    return view;
    
}

-(void)sectionClick:(UIControl *)view{
    
    //获取点击的组
    NSInteger i = view.tag - 1000;
    //取反
    close[i] = !close[i];
    //刷新列表
    NSIndexSet * index = [NSIndexSet indexSetWithIndex:i];
    [_tableView reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
