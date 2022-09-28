# Triple-Linear-Regression-Model-V1.0-Matlab-Toolbox
A Triple linear regression model Matlab toolbox for quantifying the impacts of the Three Gorges Dam on the spatial-temporal water level dynamics in the Yangtze River estuary
Huayang Cai

Institute of Estuarine and Coastal Research, School of Ocean Engineering and Technology, Sun Yat-sen University, Guangzhou, 510275, China
Correspondence: Huayang Cai (caihy7@mail.sysu.edu.cn)

2022/09/28


A Triple linear regression model Matlab toolbox for quantifying the impacts of the Three Gorges Dam on the spatial-temporal water level dynamics in the Yangtze River estuary.
Version 1.0 - September 2022

Provided by Huayang Cai

Institute of Estuarine and Coastal Research, School of Ocean Engineering and Technology, Sun Yat-sen University

Email contacts: caihy7@mail.sysu.edu.cn

How to cite:

- Huayang Cai, Hao Yang, Pascal Matte, Haidong Pan, Zhan Hu, Tongtiegang Zhao, and Guangliang Liu (2022), Quantifying the impacts of the Three Gorges Dam on the spatial-temporal water level dynamics in the upper Yangtze River estuary, OS, submitted


How to use Triple Linear Regression Model 

1.	Download and install Triple Linear Regression Model Matlab toolbox

Users can download the latest Triple Linear Regression Model Matlab toolbox from Github:

https://github.com/Huayangcai/ Triple-Linear-Model-V1.0-Matlab-Toolbox.git

2.	Triple Linear Regression Model Demo

2.1.	Quantify the influence of boundary conditions on alteration in water levels

First of all, you need to load the data provided by triple linear regression model Matlab Toolbox (such as `Data_Yangtze_river.mat`). The demo can be executed using the main program labelled by `Example_Yangtze.m`.

The data file ‘Data_Yangtze_river.mat’ contains 3 variables, including `stname`, `Pre_TGD` and `Post_TGD`. 

`stname` denotes the name of tidal gauging stations, including 5 columns (e.g., WH, MAS, NJ, ZJ, JY, respectively). 

For instance:

`WH`

`MAS`

`NJ`

`ZJ`

`JY`

`Pre_TGD` and `Post_TGD` denotes daily data observed in Pre_TGD and Post_TGD period, respectively. The data between the 1st and the 3rd column denote the time series. The data between the 4th and the 8th column denote the water level series observed in the tidal stations mentioned above. For instance, there are 5 columns of water levels in this variable, the data in the 4th column represents the water levels in WH and the data in the 8th column represent the water levels in JY. The data in the 9th column denotes daily water level data in TSG, representing the seaward boundary conditions. The data between the 10th and the 11th column denotes daily river discharge and water level data in DT, respectively, representing the upstream boundary conditions

For instance:

1978	1	1	1.9975	1.6770	1.3629	0.9694	0.3711	0.1739	11600	3.1080

1978	1	2	1.9975	1.6770	1.3629	0.9694	0.3711	0.1739	11600	3.1080

1978	1	3	1.8342	1.4983	1.1884	0.8496	0.3259	0.1557	11900	3.0680

1978	1	4	1.8342	1.4789	1.1509	0.8376	0.2772	0.0816	12000	3.0780

1978	1	5	1.7475	1.3723	1.0551	0.7001	0.2131	-0.0016	12100	3.0580

……

And

2003	1	1	3.7550	3.2714	2.7003	2.0885	1.1158	0.9174	21900	5.7430

2003	1	2	3.7611	3.2836	2.7211	2.1383	1.1508	0.9222	21800	5.6830

2003	1	3	3.6613	3.1440	2.5489	1.9085	0.8639	0.6361	21500	5.5730

2003	1	4	3.5303	3.0561	2.5030	1.9421	0.9835	0.7860	21200	5.4030

2003	1	5	3.4166	2.9452	2.3915	1.8161	0.8440	0.6544	20800	5.2630

……

The syntax of the main subroutine is illustrated below:


[alpha,beta,gamma,Z_0]=MLR(Z,[Q/std(Q),Z_down/std(Z_down),Z_up/std(Z_up)]);

Descriptions of the inputs:

`Z`: daily water level data used for triple linear regression analysis

`Q`: daily river discharge data used for triple linear regression analysis

`Z_down`: daily water level data at seaward station used for triple linear regression analysis

`Z_up`: daily water level data at upstream station used for triple linear regression analysis

Descriptions of the outputs:

`alpha`: linear regression coefficient for river discharge term

`beta`: linear regression coefficient for water level at seaward station

`gamma`: linear regression coefficient for water level at upstream station

`Z_0`: linear regression coefficient for constant term
