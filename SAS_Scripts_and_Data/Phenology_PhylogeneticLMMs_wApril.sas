DATA  cmat;
INFILE  "swed_bigC.sas" 
     DSD 
     LRECL= 586 ;
INPUT parm row col1-col49;

data plast;
input
species $ temp meanpheno lat B120 lb120 r2b120 BA lba r2ba N;
ab_b = abs(B120-lb120);
lab = log(ab_b);
ab_ba = abs(BA-lba);
laba = log(ab_ba);
b_plas = lb120;
b_plasa = lba;
datalines;
1	0.90	234.72	57.58	-11.38	4.07	0.25	22.09115587	1.078312	0.0128418	23645
2	0.34	224.90	59.58	109.70	2.78	0.21	-177.7393313	0.5902941	0.0063868	75973
3	1.43	245.27	56.51	-1.59	4.89	0.25	-76.4172485	3.4967276	0.0939628	21065
4	-0.13	214.83	58.68	181.84	2.93	0.13	121.2962006	0.2937167	0.0008537	24893
5	0.41	216.44	58.32	1.43	-11.04	0.44	-2.151494808	-6.45306	0.3395677	1622
6	0.63	224.42	57.74	-7.57	1.95	0.02	-3.847997822	-4.211982	0.0763428	2718
7	0.45	217.06	58.46	-2.66	1.75	0.04	-3.554363748	0.5088907	0.0023732	4267
8	2.58	192.54	56.20	91.59	0.43	0.00	76.50362187	-2.113721	0.0476691	14602
9	1.20	157.68	57.03	-55.71	-1.34	0.09	-25.56571045	-2.060596	0.1527533	11878
10	-0.11	190.87	58.57	2.75	-1.12	0.02	4.273590121	-1.70473	0.0457856	5145
11	0.41	164.30	57.92	-66.13	-1.63	0.07	-22.21156495	-3.177132	0.1904278	38367
12	0.95	166.71	57.74	28.19	-0.28	0.00	14.94062554	-0.483146	0.0054457	1455
13	0.81	165.96	57.67	-670.66	-4.54	0.20	22.55729812	-4.764613	0.2727344	4517
14	0.98	183.21	58.24	-6.42	2.27	0.07	-12.27459148	-0.021376	4.3548E-06	5962
15	0.25	174.51	58.57	-5.34	-2.35	0.18	-7.049038536	-1.916744	0.0794414	4684
16	0.03	177.04	59.37	-1.75	0.02	0.00	-2.236802659	-2.587338	0.0751446	12826
17	0.40	172.30	58.13	12.64	-1.70	0.07	32.07687024	-2.538676	0.117435	14023
18	0.16	158.16	58.73	125.02	-1.86	0.06	-18.64675416	-3.625981	0.2051553	23934
19	1.17	168.22	56.95	6.12	-1.09	0.03	6.739721333	-1.043578	0.0120801	14286
20	1.31	178.01	57.60	-129.90	-0.20	0.00	620.726189	-1.875188	0.0726457	6177
21	0.52	171.52	57.85	76.68	-1.47	0.06	-1065.559474	-2.643033	0.1260738	87578
22	0.46	192.14	58.13	-9.53	-0.07	0.00	-10.03616942	-1.675351	0.0275484	4827
23	0.58	195.60	57.88	-17.14	3.96	0.22	-11.03759605	0.7885303	0.0062669	7156
24	-0.12	193.21	61.90	7.19	5.12	0.08	1499.087801	-1.862547	0.0152586	1476
25	0.72	191.30	57.92	28.90	1.16	0.02	18.09094657	-0.13181	0.0002392	11733
26	0.10	199.56	58.48	-6.12	1.00	0.01	-9.00299194	1.5080461	0.029257	15282
27	0.60	236.08	58.72	-8.32	1.64	0.03	-29.39167875	0.9529632	0.008622	42321
28	0.47	209.63	57.91	5.81	-2.66	0.04	5.33417723	2.0336604	0.0188584	7629
29	1.05	224.38	57.35	106.20	1.59	0.06	68.20632407	1.6782423	0.0416417	50365
30	1.60	237.06	56.88	3.78	0.90	0.00	4.040285845	-4.986233	0.0576646	8998
31	0.81	233.27	57.83	-75.24	2.80	0.09	-111.4758404	2.0533728	0.0290347	43489
32	1.05	184.48	57.13	-65.05	0.76	0.01	60.06536894	0.0990649	0.0000684	21439
33	0.34	182.96	58.67	111.47	0.39	0.00	-781.7217563	-2.342898	0.0748136	42339
34	0.36	153.94	58.50	0.02	-4.92	0.08	0.013947606	-1.111833	0.0080136	3341
35	0.06	168.22	58.63	-4.18	0.13	0.00	-5.263002772	-3.177017	0.1849347	34427
36	-1.11	184.94	60.73	1.93	0.61	0.01	3.138690622	-1.5917	0.0346549	3354
37	1.15	157.04	57.42	-2.23	-0.39	0.00	-2.204028513	-2.005518	0.1000053	5820
38	1.09	174.47	57.21	-15.63	-1.39	0.04	-3.631938172	-1.691467	0.0513726	50137
39	0.76	172.28	57.40	-10.17	-0.08	0.00	22.99111927	-2.186025	0.0823945	45495
40	0.87	191.40	56.91	58.65	-1.29	0.03	49.37497795	-2.646832	0.0703277	67224
41	0.43	178.93	57.68	272.77	1.49	0.02	160.6769273	0.9934478	0.0082714	25445
42	2.69	209.41	55.74	572.93	-0.32	0.00	-8705.453917	-1.703854	0.0258936	7535
43	2.83	182.00	56.35	-53.77	-5.11	0.06	-30.74206612	9.7009946	0.2253351	3433
44	0.95	197.02	57.13	21.27	0.61	0.00	8.590933744	-5.295897	0.1147024	5725
45	0.61	211.48	57.53	26.84	2.16	0.12	12.6209333	0.8504797	0.0126378	61277
46	2.15	226.74	56.64	-112.34	-3.20	0.05	48.69388106	-0.446276	0.0005279	6169
47	0.79	184.15	57.84	68.47	0.75	0.01	14.40634112	-1.672659	0.0335774	17140
48	0.42	168.05	57.63	4.68	-0.98	0.02	11.29769383	-2.96583	0.1508433	27317
49	1.18	155.54	57.90	6.57	-110.69	1.00	8.263384139	-45.29848	0.3317934	7442
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
/*

ods _all_ close; 
    ods listing gpath='C:\Users\Stephen De Lisle\Desktop\PhenologyMacro';

    ods graphics /  reset=all outputfmt=PDF  imagename='PhyloFig' border = off; 

*/

proc glimmix data = plast order = data;
class species;
model laba = lat/ s ddfm = residual ;
random INTERCEPT/ sub = species type = lin(1) ldata = cmat;
output out = pred_lat predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
proc sort data = pred_lat;
by lat;
proc sgplot data = pred_lat noautolegend;
scatter y = laba x = lat/ markerattrs=(symbol=circlefilled color=black size = 10) ;
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
proc glimmix data = plast2 order = data ;
class species;
model b_plasa = lat/ s ddfm = residual;
random intercept/ sub = species type = lin(1) ldata = cmat2;
output out = pred_latb predicted(noblup ilink)= pred lcl(ilink noblup) = locl ucl(ilink noblup) = hicl;
proc sort data = pred_latb;
by lat;
proc sgplot data = pred_latb noautolegend;
scatter y = b_plasa x = lat/ markerattrs=(symbol=circlefilled  color=black size = 10);
series y = pred x = lat/ lineattrs=(thickness = 4 color = blue);
series y = locl x = lat/ lineattrs=(thickness = 2 pattern = 2 color = red);
series y = hicl x = lat/ lineattrs=(thickness = 2 pattern = 2 color = red);
xaxis label = "Species Mean Latitude" labelattrs =(size = 14 weight = bold);
yaxis label = "Inferred reaction norm" labelattrs =(size = 14 weight = bold);
run;
