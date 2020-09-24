* Written by R;
*  write.foreign(dats, "justIschDat", "justIsch", package = c("SAS")) ;

PROC FORMAT;
value name 
     1 = "Aeshna caerulea" 
     2 = "Aeshna cyanea" 
     3 = "Aeshna grandis" 
     4 = "Aeshna isoceles" 
     5 = "Aeshna juncea" 
     6 = "Aeshna mixta" 
     7 = "Aeshna serrata" 
     8 = "Aeshna subarctica" 
     9 = "Aeshna viridis" 
     10 = "Anax imperator" 
     11 = "Brachytron pratense" 
     12 = "Calopteryx splendens" 
     13 = "Calopteryx virgo" 
     14 = "Coenagrion armatum" 
     15 = "Coenagrion hastulatum" 
     16 = "Coenagrion johanssoni" 
     17 = "Coenagrion lunulatum" 
     18 = "Coenagrion puella" 
     19 = "Coenagrion pulchellum" 
     20 = "Cordulegaster boltonii" 
     21 = "Cordulia aenea" 
     22 = "Enallagma cyathigerum" 
     23 = "Epitheca bimaculata" 
     24 = "Erythromma najas" 
     25 = "Erythromma viridulum" 
     26 = "Gomphus vulgatissimus" 
     27 = "Ischnura elegans" 
     28 = "Ischnura pumilio" 
     29 = "Lestes dryas" 
     30 = "Lestes sponsa" 
     31 = "Lestes virens" 
     32 = "Leucorrhinia albifrons" 
     33 = "Leucorrhinia caudalis" 
     34 = "Leucorrhinia dubia" 
     35 = "Leucorrhinia pectoralis" 
     36 = "Leucorrhinia rubicunda" 
     37 = "Libellula depressa" 
     38 = "Libellula fulva" 
     39 = "Libellula quadrimaculata" 
     40 = "Onychogomphus forcipatus" 
     41 = "Orthetrum cancellatum" 
     42 = "Orthetrum coerulescens" 
     43 = "Platycnemis pennipes" 
     44 = "Pyrrhosoma nymphula" 
     45 = "Somatochlora arctica" 
     46 = "Somatochlora metallica" 
     47 = "Somatocholora flavomaculata" 
     48 = "Sympecma fusca" 
     49 = "Sympetrum danae" 
     50 = "Sympetrum flaveolum" 
     51 = "Sympetrum sanguineum" 
     52 = "Sympetrum striolatum" 
     53 = "Sympetrum vulgatum" 
;

DATA  ischobs;
INFILE  "justIschDat" 
     DSD 
     LRECL= 87 ;
INPUT
 Id
 day
 month
 name
 year
 x
 y
 month_t
 one20
 april
;
FORMAT name name. ;
RUN;

data ischobs;
set  ischobs;
rownum = _n_;
rownum_char = put(rownum,10.);

data ischobs; 
set ischobs;
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

proc sort data = ischobs;
by lat year rownum_char;

proc transpose data = ischobs out = lisch;
var day one20;
by lat year rownum_char;

data test1(keep = y);
set ischobs;

data test2(keep = y );
set ischobs;

proc append base = test1 data = test2;

data lisch;
merge lisch test1;


data lisch;
set lisch;
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
proc hpmixed data = lisch;
class  rownum_char _NAME_ lat year;
model COL1 = _NAME_|y _NAME_|y2/s noint;
random _NAME_ / sub = lat type = un;
random _NAME_/ sub = year(lat) type = un;

run;

