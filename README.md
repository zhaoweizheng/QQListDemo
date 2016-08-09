#QQ列表二级栏
>啥话也不说, 上图
>![](https://github.com/zhaoweizheng/QQListDemo/qqList.gif )
>其实主要是做区头, 给区头做点击事件, 通过bool值判断是否展开, 也就是刷新
>
>
>创建组头视图
   
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
	
>具体看代码吧
