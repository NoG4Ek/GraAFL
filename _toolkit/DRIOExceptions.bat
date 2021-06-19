call :DE
start "" cmd /c "echo AllFilesWasDRIO&echo(&pause"
pause
exit
:DE
for /r ".\in" %%f in (*.) do (
	call drrun.exe -c winafl.dll -debug -coverage_module "ImageTest.dll" -target_module "WinAFLHarness.exe" -target_method "main" -fuzz_iterations "3" -nargs "4" -- "WinAFLHarness.exe" "ImageTest.dll" "run_main" " " "Exception" %%f
)