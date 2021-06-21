#!/bin/sh

case "$(uname -s)" in
	Darwin*)  RID=osx-x64;;
	*)        RID=linux-x64;;
esac

dotnet build -v:q --nologo
dotnet publish -v:q --nologo -f netcoreapp3.1 -r $RID -p:PublishSingleFile=true
dotnet publish -v:q --nologo -f net5.0 -r $RID -p:PublishSingleFile=true

echo \*******************
echo \* .NET Core 3.1 \*
echo \*******************
echo \* 1. Framework dependent
dotnet exec test/bin/Debug/netcoreapp3.1/test.dll
echo
echo \* 2. Framework dependent executable
dotnet exec test/bin/Debug/netcoreapp3.1/$RID/test.dll
echo
echo \* 3a. Self contained executable \(abs\)
test/bin/Debug/netcoreapp3.1/$RID/test
echo
echo \* 3b. Self contained executable \(rel\)
pushd test/bin/Debug/netcoreapp3.1/$RID
./test
popd
echo
echo \* 4a. Self contained single-file executable \(abs\)
test/bin/Debug/netcoreapp3.1/$RID/publish/test
echo
echo \* 4b. Self contained single-file executable \(rel\)
pushd test/bin/Debug/netcoreapp3.1/$RID/publish/
./test
popd

echo
echo \**************
echo \* .NET 5.0 \*
echo \**************
echo \* 1. Framework dependent
dotnet exec test/bin/Debug/net5.0/test.dll
echo
echo \* 2. Framework dependent executable
dotnet exec test/bin/Debug/net5.0/$RID/test.dll
echo
echo \* 3a. Self contained executable \(abs\)
test/bin/Debug/net5.0/$RID/test
echo
echo \* 3b. Self contained executable \(rel\)
pushd test/bin/Debug/netcoreapp3.1/$RID
./test
popd
echo
echo \* 4a. Self contained single-file executable \(abs\)
test/bin/Debug/net5.0/$RID/publish/test
echo
echo \* 4b. Self contained single-file executable \(rel\)
pushd test/bin/Debug/net5.0/$RID/publish
./test
popd
