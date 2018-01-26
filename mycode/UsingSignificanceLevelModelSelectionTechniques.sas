libname statdata "/home/sas/SAS_Big_Data_Certification_1/ECST141";

ods graphics / imagemap=on;
proc glmselect data=statdata.bodyfat2;
   model PctBodyFat2 = Age Weight Height
         Neck Chest Abdomen Hip Thigh
         Knee Ankle Biceps Forearm Wrist
         / selection=stepwise select=SL  SLENTRY= 0.05;
run;
title;

proc glmselect data=statdata.bodyfat2;
   model PctBodyFat2 = Age Weight Height
         Neck Chest Abdomen Hip Thigh
         Knee Ankle Biceps Forearm Wrist
         / selection=forward select=SL;
run;
title;