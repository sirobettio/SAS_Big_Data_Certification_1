proc sgscatter data=statdata.ameshousing3;
	plot SalePrice*Gr_Liv_Area / reg;
	title "Association of Above Grade Living Area with Sale Price";
run;
title;

%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area
              Lot_Area Age_Sold Bedroom_AbvGr Total_BAthroom;

options nolabel;
proc sgscatter data=statdata.ameshousing3;
	plot SalePrice*(&interval) / reg;
	title "Associations of Interval variables with Sale Price";
run;

proc corr data=statdata.fitness rank plots(only)=scatter(nvar=all ellipse=none);
	var runTime Age Weight Run_Pulse Rest_Pulse Maximum_Pulse Performance;
	with Oxygen_Consumption;
	title "Correlacionts with Oxygen_Consumption";
run;

ods graphics /imagemap=on;

proc corr data=statdata.fitness nosimple plots=matrix(nvar=all histogram);
	var runTime Age Weight Run_Pulse Rest_Pulse Maximum_Pulse Performance;
	id name;
	title "Correlacionts with Oxygen_Consumption";
run;
	with;
run;
