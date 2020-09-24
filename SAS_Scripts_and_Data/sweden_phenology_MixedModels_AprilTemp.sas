

DATA  cmat;
INFILE  "swed_bigC.sas" 
     DSD 
     LRECL= 586 ;
INPUT parm row col1-col49;

* Written by R;
*  write.foreign(swed_expanded, "swed_big.sas", "swed_big.txt",  ;
* Written by R;
*  write.foreign(df, "swed_bigBIV.sas", "swed_bigBIV.txt", package = c("SAS")) ;
/*

DATA  bv ;
INFILE  "swed_bigBIV.sas" 
     DSD 
     LRECL= 29 ;
INPUT
 parm
 row
 col
 value
;
RUN;



* Written by R;
*  write.foreign(swed_expanded, "swed_big.sas", "swed_big.txt",  ;

PROC FORMAT;
value Quantity 
     1 = "1" 
     2 = "10" 
     3 = "100" 
     4 = "1000" 
     5 = "11" 
     6 = "115" 
     7 = "12" 
     8 = "120" 
     9 = "1200" 
     10 = "125" 
     11 = "128" 
     12 = "13" 
     13 = "130" 
     14 = "14" 
     15 = "140" 
     16 = "15" 
     17 = "150" 
     18 = "16" 
     19 = "17" 
     20 = "18" 
     21 = "19" 
     22 = "2" 
     23 = "20" 
     24 = "200" 
     25 = "2000" 
     26 = "21" 
     27 = "22" 
     28 = "23" 
     29 = "230" 
     30 = "24" 
     31 = "25" 
     32 = "250" 
     33 = "26" 
     34 = "27" 
     35 = "28" 
     36 = "29" 
     37 = "3" 
     38 = "30" 
     39 = "300" 
     40 = "31" 
     41 = "32" 
     42 = "33" 
     43 = "34" 
     44 = "35" 
     45 = "350" 
     46 = "3500" 
     47 = "36" 
     48 = "37" 
     49 = "38" 
     50 = "39" 
     51 = "4" 
     52 = "40" 
     53 = "400" 
     54 = "4000" 
     55 = "41" 
     56 = "43" 
     57 = "44" 
     58 = "45" 
     59 = "46" 
     60 = "460" 
     61 = "48" 
     62 = "5" 
     63 = "50" 
     64 = "500" 
     65 = "54" 
     66 = "55" 
     67 = "56" 
     68 = "59" 
     69 = "6" 
     70 = "60" 
     71 = "600" 
     72 = "65" 
     73 = "66" 
     74 = "7" 
     75 = "70" 
     76 = "700" 
     77 = "75" 
     78 = "8" 
     79 = "80" 
     80 = "800" 
     81 = "9" 
     82 = "90" 
     83 = "Listed" 
     84 = "Not recovered" 
;

value Gender 
     1 = "Female" 
     2 = "In pair" 
     3 = "Male" 
     4 = "Worker" 
;

value name 
     1 = "Aeshna cyanea" 
     2 = "Aeshna grandis" 
     3 = "Aeshna juncea" 
     4 = "Aeshna mixta" 
     5 = "Aeshna serrata" 
     6 = "Aeshna subarctica" 
     7 = "Aeshna viridis" 
     8 = "Anax imperator" 
     9 = "Brachytron pratense" 
     10 = "Cordulegaster boltonii" 
     11 = "Cordulia aenea" 
     12 = "Epitheca bimaculata" 
     13 = "Gomphus vulgatissimus" 
     14 = "Leucorrhinia albifrons" 
     15 = "Leucorrhinia caudalis" 
     16 = "Leucorrhinia dubia" 
     17 = "Leucorrhinia pectoralis" 
     18 = "Leucorrhinia rubicunda" 
     19 = "Libellula depressa" 
     20 = "Libellula fulva" 
     21 = "Libellula quadrimaculata" 
     22 = "Onychogomphus forcipatus" 
     23 = "Orthetrum coerulescens" 
     24 = "Somatochlora arctica" 
     25 = "Somatochlora flavomaculata" 
     26 = "Somatochlora metallica" 
     27 = "Sympetrum danae" 
     28 = "Sympetrum flaveolum" 
     29 = "Sympetrum sanguineum" 
     30 = "Sympetrum striolatum" 
     31 = "Sympetrum vulgatum" 
     32 = "Calopteryx splendens" 
     33 = "Calopteryx virgo" 
     34 = "Coenagrion armatum" 
     35 = "Coenagrion hastulatum" 
     36 = "Coenagrion johanssoni" 
     37 = "Coenagrion lunulatum" 
     38 = "Coenagrion puella" 
     39 = "Coenagrion pulchellum" 
     40 = "Enallagma cyathigerum" 
     41 = "Erythromma najas" 
     42 = "Erythromma viridulum" 
     43 = "Ischnura pumilio" 
     44 = "Lestes dryas" 
     45 = "Lestes sponsa" 
     46 = "Lestes virens" 
     47 = "Platycnemis pennipes" 
     48 = "Pyrrhosoma nymphula" 
     49 = "Sympecma fusca" 
;

DATA  sweden;
INFILE  "swed_big.sas" 
     DSD 
     LRECL= 111 ;
INPUT
 Quantity
 Gender $
 day
 month
 name $
 year $
 x
 y
 month_t
 one20
 april
;

RUN;


data sweden; 
set sweden;
if 55 < y <= 56 then lat = "a";
if 56 < y <= 56.5 then lat = "b";
if 56.5 < y <= 57 then lat = "c";
if 57 < y <= 57.5 then lat = "d";
if 57.5 < y <= 58 then lat = "e";
if 58 < y <= 58.5 then lat = "f";
if 58.5 < y <= 59 then lat = "g";
if 59 < y <= 59.5 then lat = "h";
if 59.5 < y <= 60 then lat = "i";
if 60 < y <= 60.5 then lat = "j";
if 60.5 < y <= 61 then lat = "k";
if 61 < y <= 62 then lat = "l";
if 62 < y <= 65 then lat = "m";

if name = "Aeshna cyanea" then name2 = 1;
 if name ="Aeshna grandis" then name2 = 2;
  if name ="Aeshna juncea" then name2 = 3;
   if name = "Aeshna mixta" then name2 = 4; 
 if name = "Aeshna serrata" then name2 = 5;
 if name = "Aeshna subarctica" then name2 = 6;
  if name = "Aeshna viridis" then name2 = 7;
  if name = "Anax imperator" then name2 = 8;
 if name = "Brachytron pratense" then name2 = 9; 
if name = "Cordulegaster boltonii" then name2 = 10;
if name = "Cordulia aenea" then name2 = 11;
 if name = "Epitheca bimaculata" then name2 = 12; 
 if name = "Gomphus vulgatissimus" then name2 = 13;
 if name = "Leucorrhinia albifrons" then name2 = 14;
  if name = "Leucorrhinia caudalis" then name2 = 15;
  if name = "Leucorrhinia dubia" then name2 = 16;
if name = "Leucorrhinia pectoralis" then name2 = 17;
 if name = "Leucorrhinia rubicunda" then name2 = 18;
  if name = "Libellula depressa" then name2 = 19;
 if name = "Libellula fulva" then name2 = 20;
 if name = "Libellula quadrimaculata" then name2 = 21; 
  if name = "Onychogomphus forcipatus" then name2 = 22;
  if name = "Orthetrum coerulescens" then name2 = 23;
 if name = "Somatochlora arctica" then name2 = 24;
 if name = "Somatochlora flavomaculata" then name2 = 25; 
   if name = "Somatochlora metallica" then name2 = 26;
  if name = "Sympetrum danae" then name2 = 27;
 if name = "Sympetrum flaveolum" then name2 = 28;
if name = "Sympetrum sanguineum" then name2 = 29;
  if name = "Sympetrum striolatum" then name2 = 30;
 if name = "Sympetrum vulgatum" then name2 = 31;
 if name = "Calopteryx splendens" then name2 = 32;
  if name = "Calopteryx virgo" then name2 = 33;
  if name = "Coenagrion armatum" then name2 = 34;
   if name = "Coenagrion hastulatum" then name2 = 35;
  if name = "Coenagrion johanssoni" then name2 = 36;
  if name = "Coenagrion lunulatum" then name2 = 37;
 if name = "Coenagrion puella" then name2 = 38;
  if name = "Coenagrion pulchellum" then name2 = 39;
  if name = "Enallagma cyathigerum" then name2 = 40;
  if name = "Erythromma najas" then name2 = 41;
  if name = "Erythromma viridulum" then name2 = 42; 
  if name = "Ischnura pumilio" then name2 = 43;
   if name = "Lestes dryas" then name2 = 44;
  if name = "Lestes sponsa" then name2 = 45;
   if name = "Lestes virens" then name2 = 46;
  if name = "Platycnemis pennipes" then name2 = 47; 
   if name = "Pyrrhosoma nymphula" then name2 = 48;
    if name = "Sympecma fusca" then name2 = 49;

data sweden;
set sweden;
if year = '2006' then y2 = 2006;
if year = '2007' then y2 = 2007;
if year = '2008' then y2 = 2008;
if year = '2009' then y2 = 2009;
if year = '2010' then y2 = 2010;
if year = '2011' then y2 = 2011;
if year = '2012' then y2 = 2012;
if year = '2013' then y2 = 2013;
if year = '2014' then y2 = 2014;
if year = '2015' then y2 = 2015;

data sweden;
set  sweden;
rownum = _n_;
rownum_char = put(rownum,10.);

proc sort data = sweden;
by name lat year rownum_char;

proc transpose data = sweden out = lswed;
var day april;
by name lat year rownum_char;

data test1(keep = y);
set sweden;

data test2(keep = y );
set sweden;

proc append base = test1 data = test2;

data lswed;
merge lswed test1;


data lswed;
set lswed;
if name = 1 then name2 = "Aeshna cyanea";
 if  name = 2 then name2 ="Aeshna grandis";
  if  name = 3 then name2 ="Aeshna juncea";
   if name = 4 then name2 = "Aeshna mixta";
 if  name = 5 then name2 = "Aeshna serrata";
 if name = 6 then name2 = "Aeshna subarctica"; 
  if name = 7 then name2 = "Aeshna viridis";
  if name = 8 then name2 = "Anax imperator" ;
 if name = 9 then name2 = "Brachytron pratense" ; 
if  name = 10 then name2 = "Cordulegaster boltonii" ;
if  name = 11 then name2 = "Cordulia aenea";
 if  name = 12 then name2 = "Epitheca bimaculata"; 
 if name = 13 then name2 = "Gomphus vulgatissimus" ;
 if  name = 14 then name2 = "Leucorrhinia albifrons";
  if name = 15 then name2 = "Leucorrhinia caudalis";
  if name = 16 then name2 = "Leucorrhinia dubia" ;
if name = 17 then name2 = "Leucorrhinia pectoralis" ;
 if name = 18 then name2 = "Leucorrhinia rubicunda" ;
  if  name = 19 then name2 = "Libellula depressa";
 if  name = 20 then name2 = "Libellula fulva";
 if name = 21 then name2 = "Libellula quadrimaculata" ; 
  if name = 22 then name2 = "Onychogomphus forcipatus";
  if name = 23 then name2 = "Orthetrum coerulescens";
 if  name = 24 then name2 = "Somatochlora arctica" ;
 if name = 25 then name2 = "Somatochlora flavomaculata"; 
   if name = 26 then name2 = "Somatochlora metallica";
  if name = 27 then name2 = "Sympetrum danae" ;
 if  name = 28 then name2 = "Sympetrum flaveolum" ;
if name = 29 then name2 = "Sympetrum sanguineum" ;
  if  name = 30 then name2 = "Sympetrum striolatum";
 if name = 31 then name2 = "Sympetrum vulgatum" ;
 if name = 32 then name2 = "Calopteryx splendens" ;
  if name = 33 then name2 = "Calopteryx virgo";
  if name = 34 then name2 = "Coenagrion armatum" ;
   if name = 35 then name2 = "Coenagrion hastulatum" ;
  if  name = 36 then name2 = "Coenagrion johanssoni";
  if name = 37 then name2 = "Coenagrion lunulatum";
 if name = 38 then name2 = "Coenagrion puella" ;
  if name = 39 then name2 = "Coenagrion pulchellum" ;
  if  name = 40 then name2 = "Enallagma cyathigerum";
  if name = 41 then name2 = "Erythromma najas";
  if  name = 42 then name2 = "Erythromma viridulum"; 
  if name = 43 then name2 = "Ischnura pumilio";
   if  name = 44 then name2 = "Lestes dryas";
  if  name = 45 then name2 = "Lestes sponsa" ;
   if name = 46 then name2 = "Lestes virens";
  if  name = 47 then name2 = "Platycnemis pennipes"; 
   if name = 48 then name2 = "Pyrrhosoma nymphula";
    if name = 49 then name2 = "Sympecma fusca" ;

data lswed;
set lswed;
if name = '1' then name2 = 1.0;
 if  name = '2' then name2 =2.0;
  if  name = '3' then name2 =3.0;
   if name = '4' then name2 = 4.0;
 if  name = '5' then name2 = 5.0;
 if name = '6' then name2 = 6.0; 
  if name = '7' then name2 = 7.0;
  if name = '8' then name2 = 8.0;
 if name = '9' then name2 = 9.0; 
if  name = '10' then name2 = 10.0;
if  name = '11' then name2 = 11.0;
 if  name = '12' then name2 = 12.0; 
 if name = '13' then name2 = 13.0;
 if  name = '14' then name2 = 14.0;
  if name = '15' then name2 = 15.0;
  if name = '16' then name2 = 16.0;
if name = '17' then name2 = 17.0;
 if name = '18' then name2 = 18.0 ;
  if  name = '19' then name2 = 19.0;
 if  name = '20' then name2 = 20.0;
 if name = '21' then name2 = 21.0; 
  if name = '22' then name2 = 22.0;
  if name = '23' then name2 = 23.0;
 if  name = '24' then name2 = 24.0;
 if name = '25' then name2 = 25.0; 
   if name = '26' then name2 = 26.0;
  if name = '27' then name2 = 27.0;
 if  name = '28' then name2 = 28.0;
if name = '29' then name2 =  29.0;
  if  name = '30' then name2 = 30.0;
 if name = '31' then name2 = 31.0;
 if name = '32' then name2 = 32.0;
  if name = '33' then name2 = 33.0;
  if name = '34' then name2 = 34.0;
   if name = '35' then name2 = 35.0;
  if  name = '36' then name2 = 36.0;
  if name = '37' then name2 = 37.0;
 if name = '38' then name2 = 38.0;
  if name = '39' then name2 = 39.0;
  if  name = '40' then name2 = 40.0;
  if name = '41' then name2 = 41.0;
  if  name = '42' then name2 = 42.0; 
  if name = '43' then name2 = 43.0;
   if  name = '44' then name2 = 44.0;
  if  name = '45' then name2 = 45.0;
   if name = '46' then name2 = 46.0;
  if  name = '47' then name2 = 47.0; 
   if name = '48' then name2 = 48.0;
    if name = '49' then name2 = 49.0;
	
	

proc sort data = lswed;
by name;


data lswed;
set lswed;
if year = '2006' then y2 = 2006;
if year = '2007' then y2 = 2007;
if year = '2008' then y2 = 2008;
if year = '2009' then y2 = 2009;
if year = '2010' then y2 = 2010;
if year = '2011' then y2 = 2011;
if year = '2012' then y2 = 2012;
if year = '2013' then y2 = 2013;
if year = '2014' then y2 = 2014;
if year = '2015' then y2 = 2015;

proc sort data = lswed;
by name;

/*USE THIS MODEL */
/*
ods output FitStatistics = fits;
ods output CovParms = covp;
ods output ParameterEstimates =fixed;
proc hpmixed data = lswed;
class  name rownum_char _NAME_ lat year;
model COL1 = _NAME_|y _NAME_|y2/s noint;
random _NAME_ / sub = lat type = un;
random _NAME_/ sub = year(lat) type = un;
by name;
ods listing;
proc print data = fixed;
proc print data = covp;
proc print data = fits;
*/
proc iml;
use covp;
read all var{Estimate} where(Subject = "year(lat)" & CovParm = "UN(1,1)") into sig1;
read all var{Estimate} where(Subject = "year(lat)" & CovParm = "UN(2,1)" ) into sig21;
read all var{Estimate} where(Subject = "year(lat)" & CovParm = "UN(2,2)") into sig2;
read all var{Estimate} where(Subject = "lat" & CovParm = "UN(1,1)") into sig1L;
read all var{Estimate} where(Subject = "lat" & CovParm = "UN(2,2)") into sig2L;
read all var{Estimate} where(CovParm = "Residual") into res;
read all var{name} where(Subject = "year(lat)" & CovParm = "UN(2,2)") into names;
X1 = J(49, 1);
do i = 1 to 49;
cor = sig21[i]/(sqrt(sig1[i])*sqrt(sig2[i]));
gof = (sig1[i] + sig2[i] + sig1L[i] + sig2L[i])/(sig1[i] + sig2[i] + sig1L[i] + sig2L[i]+res[i]);
X1[i,1]= gof;
end;
use fits;
read all var{Value} where(Descr = "-2 Res Log Likelihood") into liks;
read all var{name} where(Descr = "-2 Res Log Likelihood") into names3;
B1 = J(49, 1);
do i = 1 to 49;
b = sig21[i]/sig1[i];
B1[i,1]= b;
end;
print X1 names;
print liks names;

use fixed;
read all var{Estimate} where(Effect = "y*_NAME_" & _NAME_ = "april") into temp;
read all var{Estimate} where(Effect = "y*_NAME_" & _NAME_ = "day") into pheno;
read all var{name} where(Effect = "y*_NAME_" & _NAME_ = "april") into name2;
X2 = J(49, 1);
do i = 1 to 49;
B = pheno[i]/temp[i];
X2[i,1]= B;
end;
print temp pheno name2;
RUN;
