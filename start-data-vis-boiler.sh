#!/bin/bash
PROJECT_NAME=new-project

# create project
mkdir $PROJECT_NAME

# create folders data,static(css,js,libraries)
mkdir -p $PROJECT_NAME/data
mkdir -p $PROJECT_NAME/static/libraries
mkdir -p $PROJECT_NAME/static/js
mkdir -p $PROJECT_NAME/static/css

# create files: index, favicon, readme, static/css/style.css, static/js/graphs.js
touch $PROJECT_NAME/static/css/style.css
touch $PROJECT_NAME/static/js/graphs.js

# copy libraries from local library folder
D3=d3-5.9.2
DC=dc.js-3.0.12
CROSSFILTER=crossfilter-1.3.12
BOOTSTRAP=bootstrap-4.3.1-dist
POPPER=popper.js-1.15.0
JQUERY=jquery-3.4.1-dist

mkdir $PROJECT_NAME/static/libraries/$D3
mkdir $PROJECT_NAME/static/libraries/$DC
mkdir $PROJECT_NAME/static/libraries/$CROSSFILTER
mkdir $PROJECT_NAME/static/libraries/$BOOTSTRAP
mkdir $PROJECT_NAME/static/libraries/$POPPER
mkdir $PROJECT_NAME/static/libraries/$JQUERY

cp -r ~/Documents/Library/$D3/d3.min.js $PROJECT_NAME/static/libraries/$D3/
cp -r ~/Documents/Library/$DC/dc.min.js $PROJECT_NAME/static/libraries/$DC/
cp -r ~/Documents/Library/$DC/dc.min.css $PROJECT_NAME/static/libraries/$DC/
cp -r ~/Documents/Library/$CROSSFILTER/crossfilter.min.js $PROJECT_NAME/static/libraries/$CROSSFILTER/
cp -r ~/Documents/Library/$BOOTSTRAP/css/bootstrap.min.css $PROJECT_NAME/static/libraries/$BOOTSTRAP/
cp -r ~/Documents/Library/$BOOTSTRAP/js/bootstrap.min.js $PROJECT_NAME/static/libraries/$BOOTSTRAP/

cp -r ~/Documents/Library/$POPPER/popper.min.js $PROJECT_NAME/static/libraries/$POPPER/
cp -r ~/Documents/Library/$JQUERY/jquery.slim.min.js $PROJECT_NAME/static/libraries/$JQUERY/



# create boilerplate html
cat <<EOT >> $PROJECT_NAME/index.html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Data Vis</title>

  <link rel="stylesheet" href="static/libraries/$BOOTSTRAP/bootstrap.min.css"/>
  <link rel="stylesheet" href="static/libraries/$DC/dc.min.css">
  <link rel="stylesheet" href="static/css/style.css"/>

</head>
<body>
    <nav class="bg-dark fixed-top navbar navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Fixed top Nav Bar</a>
        </div>
    </nav>
    <main class="main">
        
        <h2 class="container">Bar Charts</h2>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4 text-center">
                        <p class="section-paragraph">Chart 01 Title</p>
                        <div id="bar_rank " class="custom-chart"></div>
                    </div>
                    <div class="col-xs-12 col-sm-4 text-center">
                        <p class="section-paragraph">Chart 02 Title</p>
                        <div id="bar_02" class="custom-chart"></div>
                    </div>
                    <div class="col-xs-12 col-sm-4 text-center">
                        <p class="section-paragraph">Chart 03 Title</p>
                        <div id="bar_03" class="custom-chart"></div>
                    </div>
                    
                </div>
            </div>
        </section>
    </main>

    <!-- Bootstrap: jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="static/libraries/$JQUERY/jquery.slim.min.js"></script>
    <script src="static/libraries/$POPPER/popper.min.js"></script>
    <script src="static/libraries/$BOOTSTRAP/bootstrap.min.js"></script>

    <!-- Charting: D3 first, then crossfilter.js, then dc JS -->
    <script src="static/libraries/$D3/d3.min.js"></script>
    <script src="static/libraries/$CROSSFILTER/crossfilter.min.js"></script>
    <script src="static/libraries/$DC/dc.min.js"></script>

    <script src="static/js/graphs.js"></script>
</body>

</html>
EOT

# create boilerplate README
cat <<EOT >> $PROJECT_NAME/README.md
<h1 align="center"> Project Title - Readme.md HTML Template </h1>
<p align="center"> Intro - Boilerplate for Readme.md on Github </p>
<hr/>
<p> Describe you project -> I hate to always "reinvent" README.md on GitHub that is why I decided to make this Starter README.md template. Also I prefer HTML syntax because I use HTML every day and it has some extra features like center the elements. </p>

<h3> List of features </h3>
<ul>
  <li>Beautiful Starter Template for README.md</li>
  <li>Key feature num. 2</li>
  <li>Key feature num. 3</li>
  <li>Key feature num. 4</li>
</ul>

<h3> Demo -> Show me what you got </h3>
<a href="#"> Link to your awesome Demo </a>
<a href="#"> Another Link to your awesome Demo </a>

<h3> Code Demo </h3>

```html
We will use markdown for the Syntax Highlighting

<ul>
  <li>Beautiful Starter Template for README.md</li>
  <li>Key feature num. 2</li>
  <li>Key feature num. 3</li>
  <li>Key feature num. 4</li>
</ul>
```

<h3> Download & Installation </h3>

```shell
$ npm i boilerplate-readme-template
```
<h3>Contributing</h3>
Keep it simple. Keep it minimal. Don't put every single feature just because you can.

<h3>Authors or Acknowledgments</h3>
<ul>
  <li>Vladimir Carrer</li>
</ul>

<h3>License</h3>

This project is licensed under the MIT License
EOT

# create boilerplate CSS
cat <<EOT >> $PROJECT_NAME/static/css/style.css
html {
    height: 100%;
}
body {
    height: 100%;
}
.navbar {
    height: 4rem;
}
.main {
    background: #f1f3f5;
    height: 100%;
    margin-top: 4rem;
}

h2.container {
    margin-bottom: 2rem;
    padding-top: 3rem;
}
EOT

# create boilerplate JAVASCRIPT
cat <<EOT >> $PROJECT_NAME/static/js/graphs.js
// == create charts == /
/* Some examples
dc.pieChart('#anchor_name')
dc.barChart('#anchor_name')
dc.rowChart('#anchor_name')
dc.lineChart('#anchor_name')
dc.bubbleChart('#anchor_name')
dc.dataCount('#anchor_name')
dc.dataTable('#anchor_name')
*/
let bar_rank  = dc.barChart("#bar_rank ");

// == load the data == /
d3.csv('../data/dummyData.csv')
  .then(function (data) {

    // == remove property with xx
    //let filteredData = data.filter(function (value, index, arr) {
    //  return !(value.propertyType == "site" || value.priceType == "on-application")
    //})

    // == Modify the dataset
    //filteredData.forEach(function (d) {
    //  d.price = +d.price;
    //});

    // == choose color scheme for the charts
    dc.config.defaultColors(d3.schemeDark2);

    // == crossfilter the data
    ndx = crossfilter(data);
    let all = ndx.groupAll();

    // == dimensions
    let rankDim = ndx.dimension(dc.pluck("rank"));

    // == groups
    let rankGroup = rankDim.group();

    // == create the charts
    bar_rank 
        .dimension(rankDim)
        .group(rankGroup)
        .width(bar_rank.selectAll()._parents[0].parentElement.clientWidth)
        .height(300)
        .margins({top: 10, right: 50, bottom: 30, left: 50})
        .x(d3.scaleBand())
        .xUnits(dc.units.ordinal)
        ;


    dc.renderAll();
  })
EOT

# create boilerplate JAVASCRIPT
cat <<EOT >> $PROJECT_NAME/data/dummyData.csv
"","rank","discipline","yrs.since.phd","yrs.service","sex","salary"
"1","Prof","B",19,18,"Male",139750
"2","Prof","B",20,16,"Male",173200
"3","AsstProf","B",4,3,"Male",79750
"4","Prof","B",45,39,"Male",115000
"5","Prof","B",40,41,"Male",141500
"6","AssocProf","B",6,6,"Male",97000
"7","Prof","B",30,23,"Male",175000
"8","Prof","B",45,45,"Male",147765
"9","Prof","B",21,20,"Male",119250
"10","Prof","B",18,18,"Female",129000
"11","AssocProf","B",12,8,"Male",119800
"12","AsstProf","B",7,2,"Male",79800
"13","AsstProf","B",1,1,"Male",77700
"14","AsstProf","B",2,0,"Male",78000
"15","Prof","B",20,18,"Male",104800
"16","Prof","B",12,3,"Male",117150
"17","Prof","B",19,20,"Male",101000
"18","Prof","A",38,34,"Male",103450
"19","Prof","A",37,23,"Male",124750
"20","Prof","A",39,36,"Female",137000
"21","Prof","A",31,26,"Male",89565
"22","Prof","A",36,31,"Male",102580
"23","Prof","A",34,30,"Male",93904
"24","Prof","A",24,19,"Male",113068
"25","AssocProf","A",13,8,"Female",74830
"26","Prof","A",21,8,"Male",106294
"27","Prof","A",35,23,"Male",134885
"28","AsstProf","B",5,3,"Male",82379
"29","AsstProf","B",11,0,"Male",77000
"30","Prof","B",12,8,"Male",118223
"31","Prof","B",20,4,"Male",132261
"32","AsstProf","B",7,2,"Male",79916
"33","Prof","B",13,9,"Male",117256
"34","AsstProf","B",4,2,"Male",80225
"35","AsstProf","B",4,2,"Female",80225
"36","AsstProf","B",5,0,"Female",77000
"37","Prof","B",22,21,"Male",155750
"38","AsstProf","B",7,4,"Male",86373
"39","Prof","B",41,31,"Male",125196
"40","AssocProf","B",9,9,"Male",100938
"41","Prof","B",23,2,"Male",146500
"42","AssocProf","B",23,23,"Male",93418
"43","Prof","B",40,27,"Male",101299
"44","Prof","B",38,38,"Male",231545
"45","Prof","B",19,19,"Male",94384
"46","Prof","B",25,15,"Male",114778
"47","Prof","B",40,28,"Male",98193
"48","Prof","B",23,19,"Female",151768
"49","Prof","B",25,25,"Female",140096
"50","AsstProf","B",1,1,"Male",70768
"51","Prof","B",28,28,"Male",126621
"52","Prof","B",12,11,"Male",108875
"53","AsstProf","B",11,3,"Female",74692
"54","Prof","B",16,9,"Male",106639
"55","AssocProf","B",12,11,"Male",103760
"56","AssocProf","B",14,5,"Male",83900
"57","Prof","B",23,21,"Male",117704
"58","AssocProf","B",9,8,"Male",90215
"59","AssocProf","B",10,9,"Male",100135
"60","AsstProf","B",8,3,"Male",75044
"61","AssocProf","B",9,8,"Male",90304
"62","AsstProf","B",3,2,"Male",75243
"63","Prof","B",33,31,"Male",109785
"64","AssocProf","B",11,11,"Female",103613
"65","AsstProf","B",4,3,"Male",68404
"66","AssocProf","B",9,8,"Male",100522
"67","Prof","B",22,12,"Male",101000
"68","Prof","B",35,31,"Male",99418
"69","Prof","B",17,17,"Female",111512
"70","Prof","B",28,36,"Male",91412
"71","Prof","B",17,2,"Male",126320
"72","Prof","B",45,45,"Male",146856
"73","Prof","B",29,19,"Male",100131
"74","Prof","B",35,34,"Male",92391
"75","Prof","B",28,23,"Male",113398
"76","AsstProf","B",8,3,"Male",73266
"77","Prof","B",17,3,"Male",150480
"78","Prof","B",26,19,"Male",193000
"79","AsstProf","B",3,1,"Male",86100
"80","AsstProf","B",6,2,"Male",84240
"81","Prof","B",43,28,"Male",150743
"82","Prof","B",17,16,"Male",135585
"83","Prof","B",22,20,"Male",144640
"84","AsstProf","B",6,2,"Male",88825
"85","Prof","B",17,18,"Female",122960
"86","Prof","B",15,14,"Male",132825
"87","Prof","B",37,37,"Male",152708
"88","AsstProf","B",2,2,"Male",88400
"89","Prof","B",25,25,"Male",172272
"90","AssocProf","B",9,7,"Male",107008
"91","AsstProf","B",10,5,"Female",97032
"92","AssocProf","B",10,7,"Male",105128
"93","AssocProf","B",10,7,"Male",105631
"94","Prof","B",38,38,"Male",166024
"95","Prof","B",21,20,"Male",123683
"96","AsstProf","B",4,0,"Male",84000
"97","AssocProf","B",17,12,"Male",95611
"98","Prof","B",13,7,"Male",129676
"99","Prof","B",30,14,"Male",102235
"100","Prof","B",41,26,"Male",106689
"101","Prof","B",42,25,"Male",133217
"102","Prof","B",28,23,"Male",126933
"103","Prof","B",16,5,"Male",153303
"104","Prof","B",20,14,"Female",127512
"105","AssocProf","A",18,10,"Male",83850
"106","Prof","A",31,28,"Male",113543
"107","AssocProf","A",11,8,"Male",82099
"108","AssocProf","A",10,8,"Male",82600
"109","AssocProf","A",15,8,"Male",81500
"110","Prof","A",40,31,"Male",131205
"111","Prof","A",20,16,"Male",112429
"112","AssocProf","A",19,16,"Male",82100
"113","AsstProf","A",3,1,"Male",72500
"114","Prof","A",37,37,"Male",104279
"115","Prof","A",12,0,"Female",105000
"116","Prof","A",21,9,"Male",120806
"117","Prof","A",30,29,"Male",148500
"118","Prof","A",39,36,"Male",117515
"119","AsstProf","A",4,1,"Male",72500
"120","AsstProf","A",5,3,"Female",73500
"121","Prof","A",14,14,"Male",115313
"122","Prof","A",32,32,"Male",124309
"123","Prof","A",24,22,"Male",97262
"124","AssocProf","A",25,22,"Female",62884
"125","Prof","A",24,22,"Male",96614
"126","Prof","A",54,49,"Male",78162
"127","Prof","A",28,26,"Male",155500
"128","AsstProf","A",2,0,"Female",72500
"129","Prof","A",32,30,"Male",113278
"130","AsstProf","A",4,2,"Male",73000
"131","AssocProf","A",11,9,"Male",83001
"132","Prof","A",56,57,"Male",76840
"133","AssocProf","A",10,8,"Female",77500
"134","AsstProf","A",3,1,"Female",72500
"135","Prof","A",35,25,"Male",168635
"136","Prof","A",20,18,"Male",136000
"137","Prof","A",16,14,"Male",108262
"138","Prof","A",17,14,"Male",105668
"139","AssocProf","A",10,7,"Male",73877
"140","Prof","A",21,18,"Male",152664
"141","AssocProf","A",14,8,"Male",100102
"142","AssocProf","A",15,10,"Male",81500
"143","Prof","A",19,11,"Male",106608
"144","AsstProf","B",3,3,"Male",89942
"145","Prof","B",27,27,"Male",112696
"146","Prof","B",28,28,"Male",119015
"147","AsstProf","B",4,4,"Male",92000
"148","Prof","B",27,27,"Male",156938
"149","Prof","B",36,26,"Female",144651
"150","AsstProf","B",4,3,"Male",95079
"151","Prof","B",14,12,"Male",128148
"152","AsstProf","B",4,4,"Male",92000
"153","Prof","B",21,9,"Male",111168
"154","AssocProf","B",12,10,"Female",103994
"155","AsstProf","B",4,0,"Male",92000
"156","Prof","B",21,21,"Male",118971
"157","AssocProf","B",12,18,"Male",113341
"158","AsstProf","B",1,0,"Male",88000
"159","AssocProf","B",6,6,"Male",95408
"160","Prof","B",15,16,"Male",137167
"161","AsstProf","B",2,2,"Male",89516
"162","Prof","B",26,19,"Male",176500
"163","AssocProf","B",22,7,"Male",98510
"164","AsstProf","B",3,3,"Male",89942
"165","AsstProf","B",1,0,"Male",88795
"166","Prof","B",21,8,"Male",105890
"167","Prof","B",16,16,"Male",167284
"168","Prof","B",18,19,"Male",130664
"169","AssocProf","B",8,6,"Male",101210
"170","Prof","B",25,18,"Male",181257
"171","AsstProf","B",5,5,"Male",91227
"172","Prof","B",19,19,"Male",151575
"173","Prof","B",37,24,"Male",93164
"174","Prof","B",20,20,"Male",134185
"175","AssocProf","B",17,6,"Male",105000
"176","Prof","B",28,25,"Male",111751
"177","AssocProf","B",10,7,"Male",95436
"178","AssocProf","B",13,9,"Male",100944
"179","Prof","B",27,14,"Male",147349
"180","AsstProf","B",3,3,"Female",92000
"181","Prof","B",11,11,"Male",142467
"182","Prof","B",18,5,"Male",141136
"183","AssocProf","B",8,8,"Male",100000
"184","Prof","B",26,22,"Male",150000
"185","Prof","B",23,23,"Male",101000
"186","Prof","B",33,30,"Male",134000
"187","AssocProf","B",13,10,"Female",103750
"188","Prof","B",18,10,"Male",107500
"189","AssocProf","B",28,28,"Male",106300
"190","Prof","B",25,19,"Male",153750
"191","Prof","B",22,9,"Male",180000
"192","Prof","B",43,22,"Male",133700
"193","Prof","B",19,18,"Male",122100
"194","AssocProf","B",19,19,"Male",86250
"195","AssocProf","B",48,53,"Male",90000
"196","AssocProf","B",9,7,"Male",113600
"197","AsstProf","B",4,4,"Male",92700
"198","AsstProf","B",4,4,"Male",92000
"199","Prof","B",34,33,"Male",189409
"200","Prof","B",38,22,"Male",114500
"201","AsstProf","B",4,4,"Male",92700
"202","Prof","B",40,40,"Male",119700
"203","Prof","B",28,17,"Male",160400
"204","Prof","B",17,17,"Male",152500
"205","Prof","B",19,5,"Male",165000
"206","Prof","B",21,2,"Male",96545
"207","Prof","B",35,33,"Male",162200
"208","Prof","B",18,18,"Male",120000
"209","AsstProf","B",7,2,"Male",91300
"210","Prof","B",20,20,"Male",163200
"211","AsstProf","B",4,3,"Male",91000
"212","Prof","B",39,39,"Male",111350
"213","Prof","B",15,7,"Male",128400
"214","Prof","B",26,19,"Male",126200
"215","AssocProf","B",11,1,"Male",118700
"216","Prof","B",16,11,"Male",145350
"217","Prof","B",15,11,"Male",146000
"218","AssocProf","B",29,22,"Male",105350
"219","AssocProf","B",14,7,"Female",109650
"220","Prof","B",13,11,"Male",119500
"221","Prof","B",21,21,"Male",170000
"222","Prof","B",23,10,"Male",145200
"223","AssocProf","B",13,6,"Male",107150
"224","Prof","B",34,20,"Male",129600
"225","Prof","A",38,35,"Male",87800
"226","Prof","A",20,20,"Male",122400
"227","AsstProf","A",3,1,"Male",63900
"228","AssocProf","A",9,7,"Male",70000
"229","Prof","A",16,11,"Male",88175
"230","Prof","A",39,38,"Male",133900
"231","Prof","A",29,27,"Female",91000
"232","AssocProf","A",26,24,"Female",73300
"233","Prof","A",38,19,"Male",148750
"234","Prof","A",36,19,"Female",117555
"235","AsstProf","A",8,3,"Male",69700
"236","Prof","A",28,17,"Male",81700
"237","Prof","A",25,25,"Male",114000
"238","AsstProf","A",7,6,"Female",63100
"239","Prof","A",46,40,"Male",77202
"240","Prof","A",19,6,"Male",96200
"241","AsstProf","A",5,3,"Male",69200
"242","Prof","A",31,30,"Male",122875
"243","Prof","A",38,37,"Male",102600
"244","Prof","A",23,23,"Male",108200
"245","Prof","A",19,23,"Male",84273
"246","Prof","A",17,11,"Female",90450
"247","Prof","A",30,23,"Male",91100
"248","Prof","A",21,18,"Male",101100
"249","Prof","A",28,23,"Male",128800
"250","Prof","A",29,7,"Male",204000
"251","Prof","A",39,39,"Male",109000
"252","Prof","A",20,8,"Male",102000
"253","Prof","A",31,12,"Male",132000
"254","AsstProf","A",4,2,"Female",77500
"255","Prof","A",28,7,"Female",116450
"256","AssocProf","A",12,8,"Male",83000
"257","Prof","A",22,22,"Male",140300
"258","AssocProf","A",30,23,"Male",74000
"259","AsstProf","A",9,3,"Male",73800
"260","Prof","A",32,30,"Male",92550
"261","AssocProf","A",41,33,"Male",88600
"262","Prof","A",45,45,"Male",107550
"263","Prof","A",31,26,"Male",121200
"264","Prof","A",31,31,"Male",126000
"265","Prof","A",37,35,"Male",99000
"266","Prof","A",36,30,"Male",134800
"267","Prof","A",43,43,"Male",143940
"268","Prof","A",14,10,"Male",104350
"269","Prof","A",47,44,"Male",89650
"270","Prof","A",13,7,"Male",103700
"271","Prof","A",42,40,"Male",143250
"272","Prof","A",42,18,"Male",194800
"273","AsstProf","A",4,1,"Male",73000
"274","AsstProf","A",8,4,"Male",74000
"275","AsstProf","A",8,3,"Female",78500
"276","Prof","A",12,6,"Male",93000
"277","Prof","A",52,48,"Male",107200
"278","Prof","A",31,27,"Male",163200
"279","Prof","A",24,18,"Male",107100
"280","Prof","A",46,46,"Male",100600
"281","Prof","A",39,38,"Male",136500
"282","Prof","A",37,27,"Male",103600
"283","Prof","A",51,51,"Male",57800
"284","Prof","A",45,43,"Male",155865
"285","AssocProf","A",8,6,"Male",88650
"286","AssocProf","A",49,49,"Male",81800
"287","Prof","A",28,27,"Male",115800
"288","AsstProf","A",2,0,"Male",85000
"289","Prof","A",29,27,"Male",150500
"290","AsstProf","A",8,5,"Male",74000
"291","Prof","A",33,7,"Male",174500
"292","Prof","A",32,28,"Male",168500
"293","Prof","A",39,9,"Male",183800
"294","AssocProf","A",11,1,"Male",104800
"295","Prof","A",19,7,"Male",107300
"296","Prof","A",40,36,"Male",97150
"297","Prof","A",18,18,"Male",126300
"298","Prof","A",17,11,"Male",148800
"299","Prof","A",49,43,"Male",72300
"300","AssocProf","A",45,39,"Male",70700
"301","Prof","A",39,36,"Male",88600
"302","Prof","A",27,16,"Male",127100
"303","Prof","A",28,13,"Male",170500
"304","Prof","A",14,4,"Male",105260
"305","Prof","A",46,44,"Male",144050
"306","Prof","A",33,31,"Male",111350
"307","AsstProf","A",7,4,"Male",74500
"308","Prof","A",31,28,"Male",122500
"309","AsstProf","A",5,0,"Male",74000
"310","Prof","A",22,15,"Male",166800
"311","Prof","A",20,7,"Male",92050
"312","Prof","A",14,9,"Male",108100
"313","Prof","A",29,19,"Male",94350
"314","Prof","A",35,35,"Male",100351
"315","Prof","A",22,6,"Male",146800
"316","AsstProf","B",6,3,"Male",84716
"317","AssocProf","B",12,9,"Female",71065
"318","Prof","B",46,45,"Male",67559
"319","Prof","B",16,16,"Male",134550
"320","Prof","B",16,15,"Male",135027
"321","Prof","B",24,23,"Male",104428
"322","AssocProf","B",9,9,"Male",95642
"323","AssocProf","B",13,11,"Male",126431
"324","Prof","B",24,15,"Female",161101
"325","Prof","B",30,31,"Male",162221
"326","AsstProf","B",8,4,"Male",84500
"327","Prof","B",23,15,"Male",124714
"328","Prof","B",37,37,"Male",151650
"329","AssocProf","B",10,10,"Male",99247
"330","Prof","B",23,23,"Male",134778
"331","Prof","B",49,60,"Male",192253
"332","Prof","B",20,9,"Male",116518
"333","Prof","B",18,10,"Female",105450
"334","Prof","B",33,19,"Male",145098
"335","AssocProf","B",19,6,"Female",104542
"336","Prof","B",36,38,"Male",151445
"337","Prof","B",35,23,"Male",98053
"338","Prof","B",13,12,"Male",145000
"339","Prof","B",32,25,"Male",128464
"340","Prof","B",37,15,"Male",137317
"341","Prof","B",13,11,"Male",106231
"342","Prof","B",17,17,"Female",124312
"343","Prof","B",38,38,"Male",114596
"344","Prof","B",31,31,"Male",162150
"345","Prof","B",32,35,"Male",150376
"346","Prof","B",15,10,"Male",107986
"347","Prof","B",41,27,"Male",142023
"348","Prof","B",39,33,"Male",128250
"349","AsstProf","B",4,3,"Male",80139
"350","Prof","B",27,28,"Male",144309
"351","Prof","B",56,49,"Male",186960
"352","Prof","B",38,38,"Male",93519
"353","Prof","B",26,27,"Male",142500
"354","Prof","B",22,20,"Male",138000
"355","AsstProf","B",8,1,"Male",83600
"356","Prof","B",25,21,"Male",145028
"357","Prof","A",49,40,"Male",88709
"358","Prof","A",39,35,"Male",107309
"359","Prof","A",28,14,"Female",109954
"360","AsstProf","A",11,4,"Male",78785
"361","Prof","A",14,11,"Male",121946
"362","Prof","A",23,15,"Female",109646
"363","Prof","A",30,30,"Male",138771
"364","AssocProf","A",20,17,"Male",81285
"365","Prof","A",43,43,"Male",205500
"366","Prof","A",43,40,"Male",101036
"367","Prof","A",15,10,"Male",115435
"368","AssocProf","A",10,1,"Male",108413
"369","Prof","A",35,30,"Male",131950
"370","Prof","A",33,31,"Male",134690
"371","AssocProf","A",13,8,"Male",78182
"372","Prof","A",23,20,"Male",110515
"373","Prof","A",12,7,"Male",109707
"374","Prof","A",30,26,"Male",136660
"375","Prof","A",27,19,"Male",103275
"376","Prof","A",28,26,"Male",103649
"377","AsstProf","A",4,1,"Male",74856
"378","AsstProf","A",6,3,"Male",77081
"379","Prof","A",38,38,"Male",150680
"380","AssocProf","A",11,8,"Male",104121
"381","AsstProf","A",8,3,"Male",75996
"382","Prof","A",27,23,"Male",172505
"383","AssocProf","A",8,5,"Male",86895
"384","Prof","A",44,44,"Male",105000
"385","Prof","A",27,21,"Male",125192
"386","Prof","A",15,9,"Male",114330
"387","Prof","A",29,27,"Male",139219
"388","Prof","A",29,15,"Male",109305
"389","Prof","A",38,36,"Male",119450
"390","Prof","A",33,18,"Male",186023
"391","Prof","A",40,19,"Male",166605
"392","Prof","A",30,19,"Male",151292
"393","Prof","A",33,30,"Male",103106
"394","Prof","A",31,19,"Male",150564
"395","Prof","A",42,25,"Male",101738
"396","Prof","A",25,15,"Male",95329
"397","AsstProf","A",8,4,"Male",81035
EOT


echo "npx serve"