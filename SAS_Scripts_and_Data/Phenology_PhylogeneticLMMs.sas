DATA  cmat;
INFILE  "swed_bigC.sas" 
     DSD 
     LRECL= 586 ;
INPUT parm row col1-col49;

data plast;
input
Bt	species $	b_lat	b_plas	temp	day	B_b lat r size;
ab_b = abs(B_b);
lab = log(ab_b);
ar = abs(r);
r2 = r*r;
r_b_b = abs(b_lat-b_plas);
labR = log(r_b_b);
datalines;

-11.38	1	-1.009157509	4.07	0.90	234.72	-15.45	57.58	0.504051841	71.5
109.70	2	-0.235650231	2.78	0.34	224.90	106.92	59.58	0.455817407	73.5
-1.59	3	0.392803388	4.89	1.43	245.27	-6.47	56.51	0.499213028	75.5
181.84	4	-8.498701684	2.93	-0.13	214.83	178.91	58.68	0.365447631	60
1.43	5	-9.652685012	-11.04	0.41	216.44	12.48	58.32	0.660527385	78
-7.57	6	6.57074439	1.95	0.63	224.42	-9.52	57.74	0.152332939	74
-2.66	7	-20.80163361	1.75	0.45	217.06	-4.41	58.46	0.197860285	70
91.59	8	25.74180115	0.43	2.58	192.54	91.17	56.20	0.052752329	76.5
-55.71	9	5.827145398	-1.34	1.20	157.68	-54.37	57.03	0.300934019	58.5
2.75	10	-1.360296846	-1.12	-0.11	190.87	3.87	58.57	0.142251588	77
-66.13	11	-3.233392814	-1.63	0.41	164.30	-64.50	57.92	0.27096831	51
28.19	12	0.499111111	-0.28	0.95	166.71	28.47	57.74	0.046341226	60
-670.66	13	-15.24025658	-4.54	0.81	165.96	-666.12	57.67	0.442149226	47.5
-6.42	14	-2.748253977	2.27	0.98	183.21	-8.69	58.24	0.265948343	36
-5.34	15	14.36790169	-2.35	0.25	174.51	-2.99	58.57	0.420269133	35
-1.75	16	-1.924141339	0.02	0.03	177.04	-1.76	59.37	0.00189422	33.5
12.64	17	-10.53418108	-1.70	0.40	172.30	14.35	58.13	0.263363068	35.5
125.02	18	-3.586470629	-1.86	0.16	158.16	126.89	58.73	0.249003899	34.5
6.12	19	-4.353852685	-1.09	1.17	168.22	7.20	56.95	0.168253138	43.5
-129.90	20	-5.722455333	-0.20	1.31	178.01	-129.70	57.60	0.030879265	43.5
76.68	21	-2.865195812	-1.47	0.52	171.52	78.15	57.85	0.23940783	44
-9.53	22	-1.736458333	-0.07	0.46	192.14	-9.45	58.13	0.007646752	48
-17.14	23	1.56548241	3.96	0.58	195.60	-21.10	57.88	0.466292142	40.5
7.19	24	-0.939233577	5.12	-0.12	193.21	2.07	61.90	0.279942922	48
28.90	25	-14.88448053	1.16	0.72	191.30	27.74	57.92	0.157807811	49.5
-6.12	26	-1.442080301	1.00	0.10	199.56	-7.12	58.48	0.114997838	53
-8.32	27	-2.390538941	1.64	0.60	236.08	-9.96	58.72	0.182372369	31.5
5.81	28	3.245126994	-2.66	0.47	209.63	8.46	57.91	0.188561478	34.5
106.20	29	-4.920446684	1.59	1.05	224.38	104.61	57.35	0.238686733	36.5
3.78	30	-27.00421006	0.90	1.60	237.06	2.87	56.88	0.041169735	39.5
-75.24	31	-4.33573903	2.80	0.81	233.27	-78.03	57.83	0.301074539	37.5
-65.05	32	-3.960913876	0.76	1.05	184.48	-65.81	57.13	0.07769216	46.5
111.47	33	-1.754054617	0.39	0.34	182.96	111.08	58.67	0.052421652	47
0.02	34	-4.037576741	-4.92	0.36	153.94	4.95	58.50	0.288784507	32
-4.18	35	-3.067573882	0.13	0.06	168.22	-4.31	58.63	0.01922436	32
1.93	36	-1.733653846	0.61	-1.11	184.94	1.33	60.73	0.08945817	29
-2.23	37	-1.91774744	-0.39	1.15	157.04	-1.84	57.42	0.069147353	32
-15.63	38	-3.511057039	-1.39	1.09	174.47	-14.23	57.21	0.21151734	34
-10.17	39	-4.154005989	-0.08	0.76	172.28	-10.09	57.40	0.012648814	36
58.65	40	-4.598838415	-1.29	0.87	191.40	59.95	56.91	0.161568491	32
272.77	41	-6.245438121	1.49	0.43	178.93	271.28	57.68	0.155322166	33
572.93	42	16.57788347	-0.32	2.69	209.41	573.25	55.74	0.03380629	29
-53.77	43	31.39251744	-5.11	2.83	182.00	-48.67	56.35	0.238326354	29
21.27	44	-6.420588936	0.61	0.95	197.02	20.66	57.13	0.046051709	37.5
26.84	45	0.47197447	2.16	0.61	211.48	24.68	57.53	0.339584583	37
-112.34	46	-28.25452438	-3.20	2.15	226.74	-109.14	56.64	0.233004775	36
68.47	47	-0.793670458	0.75	0.79	184.15	67.72	57.84	0.091885938	36
4.68	48	-3.990626685	-0.98	0.42	168.05	5.66	57.63	0.148750436	34.5
6.57	49	131.7821012	-110.69	1.18	155.54	117.26	57.90	0.997686491	36
;
/*
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
*/

data plast2;
set plast;
if b_plas < -25 then delete;
data cmat2(drop = col49);
set cmat;
if row = '49' then delete;
/*
proc glimmix data = plast2 initglm order = data;
class species;
model Bt = b_plas/s ddfm = residual;
random INTERCEPT/ sub = species type = lin(1) ldata = cmat2;
output out = pred_bB predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
*/
/*
proc glimmix data = plast order = data;
class species;
model lab = temp/s ddfm = residual ;
random INTERCEPT/ sub = species type = lin(1) ldata = cmat;
output out = pred_temp predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
proc sort data = pred_temp;
by temp;


proc sort data = pred_bB;
by b_plas;
proc sgplot data = pred_bB noautolegend;
scatter y = Bt x = b_plas/ markerattrs=(color=black);
series y = pred x = b_plas/ lineattrs=(thickness = 3 color = blue);
series y = locl x = b_plas/ lineattrs=(thickness = 1 pattern = 2 color = red);
series y = hicl x = b_plas/ lineattrs=(thickness = 1 pattern = 2 color = red);
xaxis label = "Estimated plasticity b";
yaxis label = "Estimated B";
*/

/*
proc sgplot data = pred_temp noautolegend;
scatter y = lab x = temp/ markerattrs=(color=black);
series y = pred x = temp/ lineattrs=(thickness = 3 color = blue);
series y = locl x = temp/ lineattrs=(thickness = 1 pattern = 2 color = red);
series y = hicl x = temp/ lineattrs=(thickness = 1 pattern = 2 color = red);
xaxis label = "Mean Temperature";
yaxis label = "log |B-b|";
*/


ods _all_ close; 
    ods listing gpath='C:\Users\Stephen De Lisle\Desktop\PhenologyMacro';

    ods graphics /  reset=all outputfmt=PDF  imagename='PhyloFig' border = off; 



proc glimmix data = plast order = data;
class species;
model lab = lat/ s ddfm = residual ;
random INTERCEPT/ sub = species type = lin(1) ldata = cmat;
output out = pred_lat predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
proc sort data = pred_lat;
by lat;
proc sgplot data = pred_lat noautolegend;
scatter y = lab x = lat/ markerattrs=(symbol=circlefilled color=black size = 10) ;
series y = pred x = lat/ lineattrs=(thickness = 4 color = blue);
series y = locl x = lat/ lineattrs=(thickness = 2 pattern = 2 color = red);
series y = hicl x = lat/ lineattrs=(thickness = 2 pattern = 2 color = red);
xaxis label = "Species Mean Latitude" labelattrs =(size = 14 weight = bold);
yaxis label = "|B-b| (log scale)" labelattrs =(size = 14 weight = bold);
/*
proc glimmix data = plast order = data;
class species;
model labR = lat/ s ddfm = residual ;
random INTERCEPT/ sub = species type = lin(1) ldata = cmat;
output out = pred_lat predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
proc sort data = pred_lat;
by lat;
proc sgplot data = pred_lat noautolegend;
scatter y = labR x = lat/ markerattrs=(color=black);
series y = pred x = lat/ lineattrs=(thickness = 3 color = blue);
series y = locl x = lat/ lineattrs=(thickness = 1 pattern = 2 color = red);
series y = hicl x = lat/ lineattrs=(thickness = 1 pattern = 2 color = red);
xaxis label = "Species Mean Latitude" labelattrs =(size = 14 weight = bold);
yaxis label = "|B-b| (log scale), B from random effects" labelattrs =(size = 14 weight = bold);
*/

data plast3;
set plast2; 
if b_plas < -10 then delete;
data cmat3(drop = col5);
set cmat2;
if row = '5' then delete;
proc glimmix data = plast3 order = data ;
class species;
model b_plas = lat/ s ddfm = residual;
random intercept/ sub = species type = lin(1) ldata = cmat3;
output out = pred_latb predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
proc sort data = pred_latb;
by lat;
proc sgplot data = pred_latb noautolegend;
scatter y = b_plas x = lat/ markerattrs=(symbol=circlefilled  color=black size = 10);
series y = pred x = lat/ lineattrs=(thickness = 4 color = blue);
series y = locl x = lat/ lineattrs=(thickness = 2 pattern = 2 color = red);
series y = hicl x = lat/ lineattrs=(thickness = 2 pattern = 2 color = red);
xaxis label = "Species Mean Latitude" labelattrs =(size = 14 weight = bold);
yaxis label = "Inferred reaction norm" labelattrs =(size = 14 weight = bold);



proc glimmix data = plast2 order = data;
class species;
model b_plas = day/s ddfm = residual ;
random INTERCEPT/ sub = species type = lin(1) ldata = cmat2;
output out = pred_day predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
proc sort data = pred_day;
by day;
proc sgplot data = pred_day noautolegend;
scatter y = b_plas x = day/ markerattrs=(symbol=circlefilled  color=black size = 10);
series y = pred x = day/ lineattrs=(thickness = 4 color = blue);
series y = locl x = day/ lineattrs=(thickness = 2 pattern = 2 color = red);
series y = hicl x = day/ lineattrs=(thickness = 2 pattern = 2 color = red);
xaxis label = "Mean Phenology" labelattrs =(size = 14 weight = bold);
yaxis label = "Inferred reaction norm" labelattrs =(size = 14 weight = bold);


proc glimmix data = plast order = data;
class species;
model b_plas = size/s ddfm = residual ;
random INTERCEPT/ sub = species type = lin(1) ldata = cmat;

run;
