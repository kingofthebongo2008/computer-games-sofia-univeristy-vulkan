rem echo off

set header_file_0=01_hello_h.msbuild
set cpp_file_0=01_hello_cpp.msbuild
set filters_file_0=01_hello.vcxproj.filters


echo ^<?xml version="1.0" encoding="utf-8"?^> > %header_file_0%
echo ^<Project DefaultTargets="Build" ToolsVersion="15.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003"^> >> %header_file_0%

ucdev_build_file_generator_r.exe --input ..\..\include\ --mode h >> %header_file_0%
ucdev_build_file_generator_r.exe --input ..\..\src\01_hello\ --mode h >> %header_file_0%


echo ^</Project^> >> %header_file_0%

echo ^<?xml version="1.0" encoding="utf-8"?^> > %cpp_file_0%
echo ^<Project DefaultTargets="Build" ToolsVersion="15.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003"^> >> %cpp_file_0%

ucdev_build_file_generator_r.exe --input ..\..\src\01_hello\ --mode cpp >> %cpp_file_0%

echo ^</Project^> >> %cpp_file_0%


echo ^<?xml version="1.0" encoding="utf-8"?^> > %filters_file_0%
echo ^<Project DefaultTargets="Build" ToolsVersion="15.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003"^> >> %filters_file_0%

ucdev_build_file_generator_r.exe --type filters --input ..\..\include\ --mode h >> %filters_file_0%
ucdev_build_file_generator_r.exe --type filters --input ..\..\src\01_hello\ --mode h >> %filters_file_0%
ucdev_build_file_generator_r.exe --type filters --input ..\..\src\01_hello\ --mode cpp >> %filters_file_0%

echo ^</Project^> >> %filters_file_0%





