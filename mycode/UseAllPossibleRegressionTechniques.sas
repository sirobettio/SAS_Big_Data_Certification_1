libname statdata "/home/sas/SAS_Big_Data_Certification_1/ECST141";

ods graphics / imagemap=on;
proc reg data=statdata.bodyfat2 plots(only)=(cp);
   model PctBodyFat2 = Age Weight Height
         Neck Chest Abdomen Hip Thigh
         Knee Ankle Biceps Forearm Wrist
         / selection=cp best=60;
   title "Using Mallows' Cp for Model Selection";
run;
quit;
title;