# utl-latest-python-version-that-supports-export-and-import-of-sas-datasets-python310
Latest python version that supports export and import of sas datasets python 310
    %let pgm=utl-latest-python-version-that-supports-export-and-import-of-sas-datasets-python310;

    Latest python version that supports export and import of sas datasets python 310

    Too long to post here, see github

    https://github.com/rogerjdeangelis/utl-latest-python-version-that-supports-export-and-import-of-sas-datasets-python310

    PROBLEM
    =======

      The import and export of sas datasets seems to fail all post python 310 versions?
      Here is what I think is the latest Python version too support sas dataset export/import.


    SOLUTION (CONFIGURATION THAT SUPPORTS EXPORT/IMPORT
    ===================================================

    DOWNLOAD SITE
    -------------
    https://www.python.org/downloads/release/python-3100/


    INSTALL RELATED NUMPY AND PANDAS
    --------------------------------

    pip install "numpy==1.26.4"
    pip install "pandas==1.5.3"

    /*    _               _      _                   _
      ___| |__   ___  ___| | __ (_)_ __  _ __  _   _| |_
     / __| `_ \ / _ \/ __| |/ / | | `_ \| `_ \| | | | __|
    | (__| | | |  __/ (__|   <  | | | | | |_) | |_| | |_
     \___|_| |_|\___|\___|_|\_\ |_|_| |_| .__/ \__,_|\__|
                                        |_|
    */

    libname sd1 sas7bdat "d:/sd1";

    data sd1.inout;
      do x=1 to 10;
        y=x*82;
        output;
      end;
    run;quit;

    proc print;
    run;quit;

    Altair SLC

    Obs    X      Y

      1     1     82
      2     2    164
      3     3    246
      4     4    328
      5     5    410
      6     6    492
      7     7    574
      8     8    656
      9     9    738
     10    10    820

    /*
     _ __  _ __ ___   ___ ___  ___ ___
    | `_ \| `__/ _ \ / __/ _ \/ __/ __|
    | |_) | | | (_) | (_|  __/\__ \__ \
    | .__/|_|  \___/ \___\___||___/___/
    |_|
    */

    libname sd1 sas7bdat "d:/sd1";

    /*--- just in case you rerun ---*/
    proc delete data=sd1.fro_py;
    run;quit;

    options set=PYTHONHOME "D:\py310";
    proc python;
    export data=sd1.inout python=to_py;
    submit;
    import sys
    fro_py=to_py;
    try:
        import numpy as np
        numpy_version = np.__version__
    except ImportError:
        numpy_version = "Not installed"

    try:
        import pandas as pd
        pandas_version = pd.__version__
    except (ImportError, ValueError) as e:
        pandas_version = f"Not loaded: {e}"

    print(f"Python version: {sys.version}")
    print(f"NumPy version: {numpy_version}")
    print(f"Pandas version: {pandas_version}")
    endsubmit;
    import data=sd1.fro_py python=fro_py;
    run;quit;

    proc print data=sd1.fro_py;
    run;quit;

    /*           _               _
      ___  _   _| |_ _ __  _   _| |_
     / _ \| | | | __| `_ \| | | | __|
    | (_) | |_| | |_| |_) | |_| | |_
     \___/ \__,_|\__| .__/ \__,_|\__|
                    |_|
    */

    Altair SLC

    The PYTHON Procedure

    Python version: 3.10.0 (tags/v3.10.0:b494f59, Oct  4 2021, 19:00:18) [MSC v.1929 64 bit (AMD64)]

    NumPy version: 1.26.4

    Pandas version: 1.5.3


    Altair SLC

    Obs    X      Y

      1     1     82
      2     2    164
      3     3    246
      4     4    328
      5     5    410
      6     6    492
      7     7    574
      8     8    656
      9     9    738
     10    10    820

    /*
    | | ___   __ _
    | |/ _ \ / _` |
    | | (_) | (_| |
    |_|\___/ \__, |
             |___/
    */

    1                                          Altair SLC      12:20 Saturday, January  3, 2026

    NOTE: Copyright 2002-2025 World Programming, an Altair Company
    NOTE: Altair SLC 2026 (05.26.01.00.000758)
          Licensed to Roger DeAngelis
    NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

    NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
    NOTE: AUTOEXEC source line
    1       +  ï»¿ods _all_ close;
               ^
    ERROR: Expected a statement keyword : found "?"
    NOTE: Library workx assigned as follows:
          Engine:        SAS7BDAT
          Physical Name: d:\wpswrkx

    NOTE: Library slchelp assigned as follows:
          Engine:        WPD
          Physical Name: C:\Progra~1\Altair\SLC\2026\sashelp


    NOTE: 1 record was written to file PRINT

    NOTE: The data step took :
          real time : 0.027
          cpu time  : 0.000


    NOTE: AUTOEXEC processing completed

    1
    2         libname sd1 sas7bdat "d:/sd1";
    NOTE: Library sd1 assigned as follows:
          Engine:        SAS7BDAT
          Physical Name: d:\sd1

    3
    4         /*--- just in case you rerun ---*/
    5         proc delete data=sd1.fro_py;
    6         run;quit;
    NOTE: Deleting "SD1.FRO_PY" (memtype="DATA")
    NOTE: Procedure delete step took :
          real time : 0.002
          cpu time  : 0.000


    7
    8         options set=PYTHONHOME "D:\py310";
    9         proc python;
    10        export data=sd1.inout python=to_py;
    NOTE: Creating Python data frame 'to_py' from data set 'SD1.inout'

    11        submit;
    12        import sys
    13        fro_py=to_py;
    14        try:
    15            import numpy as np
    16            numpy_version = np.__version__
    17        except ImportError:
    18            numpy_version = "Not installed"
    19
    20        try:
    21            import pandas as pd
    22            pandas_version = pd.__version__
    23        except (ImportError, ValueError) as e:

    2                                                                                                                         Altair SLC

    24            pandas_version = f"Not loaded: {e}"
    25
    26        print(f"Python version: {sys.version}")
    27        print(f"NumPy version: {numpy_version}")
    28        print(f"Pandas version: {pandas_version}")
    29        endsubmit;

    NOTE: Submitting statements to Python:


    30        import data=sd1.fro_py python=fro_py;
    NOTE: Creating data set 'SD1.fro_py' from Python data frame 'fro_py'
    NOTE: Data set "SD1.fro_py" has 10 observation(s) and 2 variable(s)

    31        run;quit;
    NOTE: Procedure python step took :
          real time : 1.109
          cpu time  : 0.031


    32
    33        proc print data=sd1.fro_py;
    34        run;quit;
    NOTE: 10 observations were read from "SD1.fro_py"
    NOTE: Procedure print step took :
          real time : 0.011
          cpu time  : 0.000


    35
    ERROR: Error printed on page 1

    NOTE: Submitted statements took :
          real time : 1.233
          cpu time  : 0.109

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
