title;

proc print data=statdata.concrete (obs=10);
run;

proc means data=statdata.concrete n mean std printalltypes;
	class Brand Additive;
	var Strength;
	output out=concrete_means mean=Strenght_mean;
	title "Concrete Strength means by Brand and Additive";
run;
title;

proc print data=concrete_means;
run;

proc sgplot data=concrete_means;
	where _TYPE_=3;
	scatter x=Additive y=Strenght_mean / group=Brand markerattrs=(size=10);
	series  x=Additive y=Strenght_mean / group=Brand lineattrs=(thickness=2);
	xaxis integer;
run;

proc glm data=statdata.concrete;
	class Additive Brand;
	model Strength = Additive Brand Additive*Brand;
run;

proc glm data=statdata.concrete;
	class Additive Brand;
	model Strength = Additive Brand;
	lsmeans Additive / pdiff=all adjust=tukey;
run;

proc sgplot data=statdata.drug;
	vline drugdose / group=disease stat=mean response=BloodP markers;
	format DrugDose dosefmt.;
run;

ods graphics on;
proc glm data=statdata.drug;
	class Drugdose Disease;
	model bloodp = DrugDose | Disease;
	lsmeans DrugDose*Disease / slice=Disease;
	format DrugDose dosefmt.;
run;
quit;


proc ttest data=statdata.testscores plots(shownull)=interval 
           h0=0 sides=U;
   class Gender;
   var SATScore;
   title 'One-Sided t-Test Comparing Girls to Boys';
run;
title;

