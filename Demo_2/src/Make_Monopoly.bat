set PATH=C:\MinGW\bin\;%PATH%
set RESULT=ResultBF
set PROG=Bug_Finder_Example
set PARENT_PROJECT_ON_ACCESS=/public/access/access-01
rd /S /Q Notification && md Notification

@echo on

REM cd "C:\Work\2021_WFD\Eclip_Repo\Demo"
del *.o
gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MT"example.o" -o "example.o" "example.c"
gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MT"initialisations.o" -o "initialisations.o" "initialisations.c"
gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MT"main.o" -o "main.o" "main.c"
gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MT"single_file_analysis.o" -o "single_file_analysis.o" "single_file_analysis.c"
gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MT"tasks1.o" -o "tasks1.o" "tasks1.c"
gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MT"tasks2.o" -o "tasks2.o" "tasks2.c"
gcc  -o "Demo.exe" ./example.o ./initialisations.o ./main.o ./single_file_analysis.o ./tasks1.o ./tasks2.o

if %errorlevel% EQU 1 (
   @echo Failure Reason Given is %errorlevel%
   cd "C:\Polyspace\Tools\Jenkins"
   exit /b %errorlevel%
)
del *.o
