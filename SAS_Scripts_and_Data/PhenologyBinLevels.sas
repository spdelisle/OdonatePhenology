
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

proc sort data = sweden;
by name;

PROC FREQ NLEVELS data = sweden;
by name;
tables lat;
proc means data = sweden noprint n;
by name;
output out = means n = samp;
proc print data = means;
run;


