% Example_Yangtze - demonstration of capabilities used in Yangtze River Estuary,

% The parameters input:
% Z ---- daily water level data used for triple linear regression analysis
% Q ---- daily river discharge data used for triple linear regression analysis
% Z_down ---- daily water level data at seaward station used for triple linear regression analysis
% Z_up ---- daily water level data at upstream station used for triple linear regression analysis

% The parameters output:
% alpha ---- linear regression coefficient for river discharge term
% beta ---- linear regression coefficient for water level at seaward station
% gamma ---- linear regression coefficient for water level at upstream station
% Z_0 ---- linear regression coefficient for constant term

% Reference: Huayang Cai, Hao Yang, Pascal Matte, Haidong Pan, Zhan Hu, Tongtiegang Zhao, and Guangliang Liu (2022), Quantifying the impacts of the Three Gorges Dam on the spatial-temporal water level dynamics in the upper Yangtze River estuary, OS, submitted
% Contract: Huayang Cai (E-mail: caihy7@mail.sysu.edu.cn); 

%%
clc,clear
clear all
close all
load Data_Yangtze_river.mat   % Load the example.

%******************inputs***************** Pre-TGD (1978-1984)
Q=Pre_TGD(:,10); % River discharges observed at the Datong (DT) hydrological station
Z_up=Pre_TGD(:,11);% Water levels observed at the upstream boundary of the estuary (DT)
Z_down=Pre_TGD(:,9);% Water levels observed at the seaward boundary of the estuary (TSG)

Z_01=[];alpha1=[];beta1=[];gamma1=[];
%% calibration_Pre_TGD
for i=1:size(stname,1)
    Z=Pre_TGD(:,i+3);% Water levels observed at the gauging station
    [alpha,beta,gamma,Z_0]=MLR(Z,[Q/std(Q),Z_down/std(Z_down),Z_up/std(Z_up)]); %Linear regression coefficients that are determined from the observed data according to a least-squares fit technique.
    z(i,:)=Z; % inverse matrix of water levels observed in Pre_TGD
  for j=1:length(Q)
    wl(i,j)=Z_0+alpha*Q(j)/std(Q)+beta*Z_down(j)/std(Z_down)+gamma*Z_up(j)/std(Z_up); % A simple triple linear regression model
  end
  RMSE_pre_station(i)=sqrt(nanmean((Z-wl(i,:)').^2));% Root mean square error
  Z_01=[Z_01,Z_0];alpha1=[alpha1,alpha];beta1=[beta1,beta];gamma1=[gamma1,gamma]; % save the parameters
end
std_z_pre=std(z');

figure1=figure;
subplot(321)
Calibration(wl(5,:),z(5,:),1)
ylabel('Pre. \itZ\rm  (m)')
text(-0.1,2.5,'(a) JY')
subplot(322)
Calibration(wl(4,:),z(4,:),1)
text(0.5,5,'(b) ZJ')
subplot(323)
Calibration(wl(3,:),z(3,:),1)
ylabel('Pre. \itZ\rm  (m)')
text(0.8,7,'(c) NJ')
subplot(324)
Calibration(wl(2,:),z(2,:),1)
xlabel('Obs. \itZ\rm  (m)')
text(1,8,'(d) MAS')
subplot(325)
Calibration(wl(1,:),z(1,:),1)
ylabel('Pre. \itZ\rm  (m)')
xlabel('Obs. \itZ\rm  (m)')
text(1.2,9.6,'(e) WH')

%%
Q=[];Z_down=[];Z_up=[];Z=[];z=[];wl=[];
%******************inputs*****************  Post-TGD (2003-2014)
Q=Post_TGD(:,10); % River discharges observed at the Datong (DT) hydrological station
Z_up=Post_TGD(:,11);% Water levels observed at the upstream boundary of the estuary
Z_down=Post_TGD(:,9);% Water levels observed at the seaward boundary of the estuary
Z_02=[];alpha2=[];beta2=[];gamma2=[];

%% calibration_Post_TGD
for i=1:size(stname,1)
    Z=Post_TGD(:,i+3);% Water levels observed at the gauging station
    [alpha,beta,gamma,Z_0]=MLR(Z,[Q/std(Q),Z_down/std(Z_down),Z_up/std(Z_up)]); %Linear regression coefficients that are determined from the observed data according to a least-squares fit technique.
    z(i,:)=Z; % inverse matrix of water levels observed in Post_TGD period
  for j=1:length(Q)
    wl(i,j)=Z_0+alpha*Q(j)/std(Q)+beta*Z_down(j)/std(Z_down)+gamma*Z_up(j)/std(Z_up); % A simple triple linear regression model
  end
  RMSE_post_station(i)=sqrt(nanmean((Z-wl(i,:)').^2));% Root mean square error
  Z_02=[Z_02,Z_0];alpha2=[alpha2,alpha];beta2=[beta2,beta];gamma2=[gamma2,gamma]; % save the parameters
end
std_z_post=std(z');

subplot(321)
Calibration(wl(5,:),z(5,:),2)
subplot(322)
Calibration(wl(4,:),z(4,:),2)
subplot(323)
Calibration(wl(3,:),z(3,:),2)
subplot(324)
Calibration(wl(2,:),z(2,:),2)
subplot(325)
Calibration(wl(1,:),z(1,:),2)
legend1=legend('Obs. pre-TGD','Obs. post-TGD','Best fit line','location','N');
set(legend1,'Position',[0.586987640997272 0.16798049734121 0.198235840297122 0.0734683281412253],'LineWidth',1,'FontSize',10);