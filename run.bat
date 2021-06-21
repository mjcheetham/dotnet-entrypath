@ECHO OFF

dotnet build -v:q --nologo
dotnet publish -v:q --nologo -f netcoreapp3.1 -r win-x64 -p:PublishSingleFile=true
dotnet publish -v:q --nologo -f net5.0 -r win-x64 -p:PublishSingleFile=true

echo ************************
echo * .NET Framework 4.6.1 *
echo ************************
echo * a. Path
test\bin\Debug\net461\test.exe
echo * b. CWD
pushd test\bin\Debug\net461
test.exe
popd

echo.
echo ************************
echo * .NET Framework 4.7.2 *
echo ************************
echo * a. Path
test\bin\Debug\net472\test.exe
echo * b. CWD
pushd test\bin\Debug\net472
test.exe
popd

echo.
echo *****************
echo * .NET Core 3.1 *
echo *****************
echo * 1. Framework dependent
dotnet exec test\bin\Debug\netcoreapp3.1\test.dll
echo.
echo * 2. Framework dependent executable
dotnet exec test\bin\Debug\netcoreapp3.1\win-x64\test.exe
echo.
echo * 3a. Self contained executable (abs)
test\bin\Debug\netcoreapp3.1\win-x64\test.exe
echo.
echo * 3b. Self contained executable (rel)
pushd test\bin\Debug\netcoreapp3.1\win-x64
test.exe
popd
echo.
echo * 4a. Self contained single-file executable (abs)
test\bin\Debug\netcoreapp3.1\win-x64\publish\test.exe
echo.
echo * 4b. Self contained single-file executable (rel)
pushd test\bin\Debug\netcoreapp3.1\win-x64\publish
test.exe
popd

echo.
echo ************
echo * .NET 5.0 *
echo ************
echo * 1. Framework dependent
dotnet exec test\bin\Debug\net5.0\test.dll
echo.
echo * 2. Framework dependent executable
dotnet exec test\bin\Debug\net5.0\win-x64\test.dll
echo.
echo * 3a. Self contained executable (abs)
test\bin\Debug\net5.0\win-x64\test.exe
echo.
echo * 3b. Self contained executable (rel)
pushd test\bin\Debug\net5.0\win-x64
test.exe
popd
echo.
echo * 4a. Self contained single-file executable (abs)
test\bin\Debug\net5.0\win-x64\publish\test.exe
echo.
echo * 4b. Self contained single-file executable (rel)
pushd test\bin\Debug\net5.0\win-x64\publish
test.exe
popd
