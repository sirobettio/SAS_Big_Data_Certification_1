libname statdata "./ECST141"; 
libname library "./ECST141";



proc reg data=statdata.fitness;
	model oxygen_consumption=runtime /clm cli;
	id name runtime;
run;
quit;

data need_predictions;
	input runtime @@;
	datalines;
9 10 11 12 13
;
run;

data predoxy;
	set need_predictions
	    statdata.fitness;
run;

proc reg data=predoxy;
	model PctBodyFat2=Weight;
	id name runtime;
run;
quit;

proc reg data=statdata.BodyFat2;
	model PctBodyFat2=Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist ;
run;
quit;

proc reg data=statdata.BodyFat2;
	model PctBodyFat2=Age Weight Height Neck Chest Abdomen Hip Thigh Ankle Biceps Forearm Wrist ;
run;
quit;

proc corr data=statdata.fitness rank
     plots(only)=scatter(nvar=all ellipse=none);
   var RunTime Age Weight Run_Pulse
       Rest_Pulse Maximum_Pulse Performance;
   with Oxygen_Consumption;
   title "Correlations and Scatter Plots with Oxygen_Consumption";
run;
title;
