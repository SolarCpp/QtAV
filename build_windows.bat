
@echo off
setlocal

SET ORIGINAL_DIR=%cd%
SET PRO_ROOT=%~dp0%

set CMAKE_BUILD_TYPE="Release"
set build_dir=%PRO_ROOT%\..\QtAV.build_2015_%CMAKE_BUILD_TYPE%
set install_dir=%PRO_ROOT%\..\QtAV.install.master.VS2015

if not exist %build_dir%  mkdir %build_dir%
cd %build_dir%

echo CMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE%
set CMAKE_GENERATOR="Visual Studio 14 2015 Win64"

set C_FLAGS=%BASIC_C_FLAGS% /D_WIN32 /Z7 /EHa /DNOMINMAX

:: set(CMAKE_INSTALL_PREFIX "E:\\ws.cute\\QtAV.install")
:: set(FFMPEG_DIR E:/ws.local/ffmpeg-4.02)

cmake %PRO_ROOT% ^
  -G%CMAKE_GENERATOR% ^
  -DQt5_DIR=C:/Qt/Qt5.9.0/5.9/msvc2015_64/lib/cmake/Qt5 ^
  -DCMAKE_INSTALL_PREFIX=%install_dir% ^
  -DFFMPEG_DIR=E:/ws.local/ffmpeg-4.02-win ^
  -DBUILD_PLAYERS=ON ^
  -DCMAKE_DEBUG_POSTFIX="d" ^
  || goto :label_error


:: Actually run the build
:: cmake --build . --config %CMAKE_BUILD_TYPE% -- /maxcpucount:%NUMBER_OF_PROCESSORS% 
cmake --build . --target install --config %CMAKE_BUILD_TYPE% -- /maxcpucount:4 
::-- /maxcpucount:%NUMBER_OF_PROCESSORS% 

