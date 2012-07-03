@echo off
rem *** Author: T. Wittrock, Kiel ***

if "%OS_VER_MAJOR%"=="" goto NoOSVersion

set WUA_VER_TARGET_MAJOR=7
set WUA_VER_TARGET_MINOR=4
set WUA_VER_TARGET_REVIS=7600
set WUA_VER_TARGET_BUILD=226

set MSI_VER_TARGET_REVIS=0
set MSI_VER_TARGET_BUILD=0

set WSH_VER_TARGET_REVIS=0
set WSH_VER_TARGET_BUILD=0

set DX_CORE_VER_TARGET_MAJOR=4
set DX_CORE_VER_TARGET_MINOR=09
set DX_CORE_VER_TARGET_REVIS=00
set DX_CORE_VER_TARGET_BUILD=0904
set DX_DLL_LATEST=%SystemRoot%\system32\D3DX9_43.dll

set IE_VER_TARGET_MINOR=0
set IE_VER_TARGET_REVIS=0
set IE_VER_TARGET_BUILD=0

set WMP_VER_TARGET_MINOR=0
set WMP_VER_TARGET_REVIS=0
set WMP_VER_TARGET_BUILD=0

set TSC_VER_TARGET_REVIS=0
set TSC_VER_TARGET_BUILD=0

set DOTNET35_VER_TARGET_MAJOR=3
set DOTNET35_VER_TARGET_MINOR=5
set DOTNET35_VER_TARGET_REVIS=30729
set DOTNET35_VER_TARGET_BUILD=1

set DOTNET4_VER_TARGET_MAJOR=4
set DOTNET4_VER_TARGET_MINOR=0
set DOTNET4_VER_TARGET_REVIS=30319
set DOTNET4_VER_TARGET_BUILD=0

set PSH_VER_TARGET_MAJOR=2
set PSH_VER_TARGET_MINOR=0
set PSH_TARGET_ID=968930

if %OS_VER_MAJOR% LSS 5 goto SetOfficeName
if %OS_VER_MAJOR% GTR 6 goto SetOfficeName
if %OS_VER_MAJOR% EQU 5 (
  if %OS_VER_MINOR% GTR 2 goto SetOfficeName
)
if %OS_VER_MAJOR% EQU 6 (
  if %OS_VER_MINOR% GTR 1 goto SetOfficeName
)
goto Windows%OS_VER_MAJOR%.%OS_VER_MINOR%

:Windows5.0
rem *** Windows 2000 ***
set OS_NAME=w2k
goto SetOfficeName

:Windows5.1
rem *** Windows XP ***
set OS_NAME=wxp
set OS_SP_VER_TARGET_MAJOR=3
set OS_SP_TARGET_ID=936929
set MSI_VER_TARGET_MAJOR=4
set MSI_VER_TARGET_MINOR=5
set MSI_TARGET_ID=942288
set WSH_VER_TARGET_MAJOR=5
set WSH_VER_TARGET_MINOR=7
if /i "%1"=="/instie8" (set IE_VER_TARGET_MAJOR=8) else (
  if /i "%1"=="/instie7" (set IE_VER_TARGET_MAJOR=7) else (set IE_VER_TARGET_MAJOR=6)
)
set WMP_VER_TARGET_MAJOR=11
set WMP_TARGET_ID=wmp11-windowsxp-x86
set TSC_VER_TARGET_MAJOR=6
set TSC_VER_TARGET_MINOR=1
set TSC_TARGET_ID=969084
set WOU_ENDLESS=3
goto SetOfficeName

:Windows5.2
rem *** Windows Server 2003 ***
set OS_NAME=w2k3
set OS_SP_VER_TARGET_MAJOR=2
set OS_SP_TARGET_ID=914961
set MSI_VER_TARGET_MAJOR=4
set MSI_VER_TARGET_MINOR=5
set MSI_TARGET_ID=942288
set WSH_VER_TARGET_MAJOR=5
if /i "%OS_ARCH%"=="x64" (
  set WSH_VER_TARGET_MINOR=6
) else (
  set WSH_VER_TARGET_MINOR=7
)
if /i "%1"=="/instie8" (set IE_VER_TARGET_MAJOR=8) else (
  if /i "%1"=="/instie7" (set IE_VER_TARGET_MAJOR=7) else (set IE_VER_TARGET_MAJOR=6)
)
set WMP_VER_TARGET_MAJOR=0
if /i "%OS_ARCH%"=="x64" (
  set TSC_VER_TARGET_MAJOR=5
  set TSC_VER_TARGET_MINOR=2
) else (
  set TSC_VER_TARGET_MAJOR=6
  set TSC_VER_TARGET_MINOR=0
  set TSC_TARGET_ID=925876
)
set WOU_ENDLESS=3
goto SetOfficeName

:Windows6.0
rem *** Windows Vista / Server 2008 ***
set OS_NAME=w60
set MSI_VER_TARGET_MAJOR=4
set MSI_VER_TARGET_MINOR=5
set WSH_VER_TARGET_MAJOR=5
set WSH_VER_TARGET_MINOR=7
if /i "%1"=="/instie9" (set IE_VER_TARGET_MAJOR=9) else (
  if /i "%1"=="/instie8" (set IE_VER_TARGET_MAJOR=8) else (set IE_VER_TARGET_MAJOR=7)
)
set WMP_VER_TARGET_MAJOR=11
if %OS_DOMAIN_ROLE% LEQ 1 (
  set TSC_VER_TARGET_MAJOR=6
  set TSC_VER_TARGET_MINOR=1
  set TSC_TARGET_ID=969084
) else (
  set TSC_VER_TARGET_MAJOR=6
  set TSC_VER_TARGET_MINOR=0
)
set WOU_ENDLESS=6
goto Windows%OS_VER_MAJOR%.%OS_VER_MINOR%.%OS_SP_VER_MAJOR%
:Windows6.0.
:Windows6.0.0
set OS_SP_VER_TARGET_MAJOR=1
set OS_SP_TARGET_ID=936330
goto SetOfficeName
:Windows6.0.1
:Windows6.0.2
set OS_SP_VER_TARGET_MAJOR=2
set OS_SP_TARGET_ID=948465
goto SetOfficeName

:Windows6.1
rem *** Windows 7 / Server 2008 R2 ***
set OS_NAME=w61
set OS_SP_VER_TARGET_MAJOR=1
set OS_SP_TARGET_ID=976932
set MSI_VER_TARGET_MAJOR=5
set MSI_VER_TARGET_MINOR=0
set WSH_VER_TARGET_MAJOR=5
set WSH_VER_TARGET_MINOR=8
if /i "%1"=="/instie9" (set IE_VER_TARGET_MAJOR=9) else (set IE_VER_TARGET_MAJOR=8)
set WMP_VER_TARGET_MAJOR=12
set TSC_VER_TARGET_MAJOR=6
set TSC_VER_TARGET_MINOR=1
set WOU_ENDLESS=4
goto SetOfficeName

:SetOfficeName
if "%O2K3_VER_MAJOR%"=="" goto NoO2k3
rem *** Office 2003 ***
set OFC_NAME=o2k3
set OFC_LANG=%O2K3_LANG%
set O2K3_SP_VER_TARGET=3
set O2K3_SP_TARGET_ID=923618
:NoO2k3
if "%O2K7_VER_MAJOR%"=="" goto NoO2k7
rem *** Office 2007 ***
set OFC_NAME=o2k7
set OFC_LANG=%O2K7_LANG%
set O2K7_SP_VER_TARGET=3
set O2K7_SP_TARGET_ID=2526086
:NoO2k7
if "%O2K10_VER_MAJOR%"=="" goto NoO2k10
rem *** Office 2010 ***
set OFC_NAME=o2k10
set OFC_LANG=%O2K10_LANG%
set O2K10_SP_VER_TARGET=1
set O2K10_SP_TARGET_ID=2460049-%O2K10_ARCH%
:NoO2k10
goto EoF

:NoOSVersion
echo.
echo ERROR: Environment variable OS_VER_MAJOR not set.
echo.
exit /b 1

:EoF
