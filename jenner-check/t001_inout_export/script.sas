/* Adapted from utl-latest-python-version-...-python310.sas
   The original builds the sd1.inout dataset that is exported to Python and
   re-imported.  This is that same DATA step and PROC PRINT, retargeted from
   the external "d:/sd1" libname to WORK so it runs standalone. */

data inout;
  do x=1 to 10;
    y=x*82;
    output;
  end;
run;quit;

proc print data=inout;
run;quit;
