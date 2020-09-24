proc import datafile = "C:\Users\Stephen De Lisle\Desktop\isch.csv"
out = isch
dbms = csv
replace;
getnames = yes;
run;
data isch;
set isch;
if Sex = . then delete;
if pop = "FlyA1" then pop2 = "fly";
if pop = "FlyA3" then pop2 = "fly";
if pop = "FlyingeA1" then pop2 = "fly";
if pop = "FlyingeA3" then pop2 = "fly";
if pop = "genarp" then pop2 = "Genarp";
if pop =  "Hoje14" then pop2 = "Hoje";
if pop = "Hoje6" then pop2 = "Hoje";
if pop = "Hoje7" then pop2 = "Hoje";
else pop2 = pop;
data isch2;
set isch;
if Sex = 1 then sex2 = "M";
if Sex = 0 then sex2 = "F";
if Age = "teneral" then delete;
proc sort data = isch2;
by sex2 Season pop2;
proc SQL noprint;
create table tabl1 as
select ID, Morph, Season, pop2, sex2, Copula, eggs, day, Wing, Thorax, Length, Abdomen, mean(Copula) as mcop, mean(eggs) as megg
from isch2
group by sex2, pop2;
quit;
data ischw;
set tabl1;
w_cop = Copula/mcop;
w_egg = eggs/megg;

data ischw;
set ischw;
if sex2 = "F" then delete;
if Season = 2000 then temp =	4.766666667;
if Season = 2001 then temp =	2.678888889;
if Season = 2002 then temp =	4.656944444;
if Season = 2003 then temp =	2.259722222;
if Season = 2004 then temp =	3.068055556;
if Season = 2005 then temp =	3.206388889;
if Season = 2006 then temp =	0.74556962;
if Season = 2007 then temp =	5.018333438;
if Season = 2008 then temp =	4.506104167;
if Season = 2009 then temp =	3.257791667;
if Season = 2010 then temp =	0.626375125;
if Season = 2011 then temp =	2.017580346;
if Season = 2012 then temp =	2.56552017;
if Season = 2013 then temp =	1.950899707;
if Season = 2014 then temp =	4.315723838;
if Season = 2015 then temp =	5.115165563;
if Season = 2016 then delete;
if Season = 2017 then delete;
proc standard data = ischw out = stds mean = 0 ;
var day temp;



proc glimmix data = stds method = quad;
class Season ;
model Copula = day day*day day*temp/s covb ;
random day day*day /sub = Season type = un;
output out = preds predicted(ilink noblup) = p;
ods output ParameterEstimates = params CovB = covs;
proc sort data = preds;
by Season day;


ods _all_ close; 
    ods listing gpath='C:\Users\Stephen De Lisle\Desktop\PhenologyMacro';

    ods graphics /  reset=all outputfmt=PDF  imagename='IschdataFig' border = off; 



proc sgplot data = preds noautoloegend;
Series x = day y = p/lineattrs =(thickness = 2 pattern = 1) group = Season;
xaxis label = "Phenology" labelattrs =(size = 14 weight = bold);
yaxis label = "Fitness" labelattrs =(size = 14 weight = bold);
data covs;
set covs;
drop Row;
data params;
set params;
if Effect = "Scale" then delete;
proc sort data = stds;
by Season;
proc means data = stds mean noprint;
var temp;
by Season;
output out = means mean = mtemp;



proc sort data = isch;
by Season;
data ischm;
set isch2;
if sex2 = "F" then delete;
proc means noprint data = ischm;
var day;
by Season;
output out = means2 mean = mday2;
proc reg data = means2 noprint;
model mday2 = Season;
output out = resids residual = rday;
data resids;
set resids;
if Season = 2016 then delete;
if Season = 2017 then delete;
proc iml;
use params;
read all var{Estimate} where(Effect = "Intercept" ) into int;
read all var{Estimate} where(Effect = "day" ) into beta;
read all var{Estimate} where(Effect = "day*day" ) into gam;
read all var{Estimate} where(Effect = "day*temp" ) into bee;
read all var{Estimate}  into v_est;
print v_est;
gamma = gam*2;
use covs;
read all into cov;
use means;
read all var{mtemp} into t;
use resids;
read all var{rday} into d;
z = J(16, 1, 0);
X0 = d||t||z;
X1 = J(16, 3);
do i = 1 to 16;

/*
X1[i,1]= (beta/-gamma) + (bee*t[i])/(-gamma);
*/
X1[i,1]= (v_est[2]/(-2*v_est[3])) + (v_est[4]*t[i])/(-2*v_est[3]);
X1[i,2]=t[i];
X1[i,3]=1;
end;
do i = 1 to 400;
X2 = J(16, 3);
simvec = randnormal(1, v_est,  cov);
/*
if simvec[3]>0 then goto CONTINUE;
*/
do j = 1 to 16;

X2[j,1]= (simvec[2]/(-2*simvec[3])) + (simvec[4]*t[j])/(-2*simvec[3]);
/*
X2[j,1] = (beta/-gamma) + (simvec[4]*t[j])/(-2*simvec[3]);
*/
X2[j,2]=t[j];
X2[j,3]= i+1;
end;
X1 = X0//X1//X2;
CONTINUE:
end;
print simvec;
create results from X1[colname={"theta" "temp" "sim"}];
append from X1;
close results;

data results;
set results;
if sim = 1 then xm = temp;
else xm = .;
if sim = 1 then ym = theta;
else xm = .;
if sim = 0 then xt = temp;
if sim = 0 then yt = theta;
if sim = 0 then temp=.;
if sim = 0 then theta=.;


proc sgplot data = results;
series y = theta x = temp/group = sim lineattrs =(color = grey pattern = 1) transparency =0.7;
series y = ym x = xm/lineattrs =(color = black thickness = 3 pattern = 1);
/*
scatter y = yt x= xt/ markerattrs = (color = black) markerattrs=(symbol=circlefilled size=15
          color=red);
*/
LINEPARM X=0 Y=8.6 SLOPE=-13.3/lineattrs =(color = blue thickness = 4 pattern = 2) noextend;
/*reaction norm from lab experiment, passing through intercept of beta/gamma*/
LINEPARM X=0 Y=8.6 SLOPE=-36/lineattrs =(color = blue thickness = 4 pattern = 5) noextend;
LINEPARM X=0 Y=8.6 SLOPE=-53/lineattrs =(color = black thickness = 4 pattern = 5) noextend;
xaxis label = "Spring temperature" labelattrs =(size = 14 weight = bold);
yaxis max = 50 min =-50 label = "Optimum phenology" labelattrs =(size = 14 weight = bold);
run;


proc glimmix data = isch2;
class pop2 sex;
model day = Season/s;
random intercept/ sub = pop2 type = chol;
output out = pheno_change predicted(ilink noblup) = p  lcl(ilink noblup) = low ucl(ilink noblup) = up;
proc sort data = pheno_change;
by Season;

proc sgplot data = pheno_change noautolegend;
band x = Season lower = low upper = up;
series x = Season y = p ;
scatter x = Season y = day /markerattrs = (color = black);
yaxis  label = "Julian Day" labelattrs =(size = 14 weight = bold);
xaxis min = 1999 max = 2018 label = "Year" labelattrs =(size = 14 weight = bold);
proc sort data = ischw;
by Season;
proc standard data = ischw out = stds2 mean = 0 std = 1;
var day temp;
proc glimmix data = stds2 method = quad;
class Season ;
model Copula = day/s covb ;
random intercept day/sub = Season type= un solution;
ods output SolutionR = blups;
data blups;
set blups;
if Effect = 'Intercept' then delete;
beta = Estimate + 0.02746;
proc sgplot data = blups noautolegend;
histogram beta;
density beta /type = kernal lineattrs = (color = black thickness = 2);
refline  0.02746/ axis = x lineattrs = (color = blue pattern = 2 thickness = 2);
xaxis label = "Directional selection gradient" labelattrs =(size = 14 weight = bold);
yaxis label = "Density" labelattrs =(size = 14 weight = bold);
proc print data = blups;
run;
