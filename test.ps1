$Configuration="Release"

mkdir obj -Force
# C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64
$env:PATH="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64;$env:PATH"
mkdir -Force obj\tests\samples\inlining\
ilasm /DLL tests\samples\inlining\inline_static_method.il /OUTPUT=obj\tests\samples\inlining\inline_static_method.dll

Release\net8.0\de4dot.exe obj\tests\samples\inlining\inline_static_method.dll -o obj\tests\samples\inlining\inline_static_method.cleaned.dll

ildasm obj\tests\samples\inlining\inline_static_method.cleaned.dll /OUT=tests\samples\inlining\inline_static_method.cleaned.il

mkdir -Force obj\tests\samples\inlining\
ilasm /DLL tests\samples\inlining\inline_static_generic_method.il /OUTPUT=obj\tests\samples\inlining\inline_static_generic_method.dll

Release\net8.0\de4dot.exe obj\tests\samples\inlining\inline_static_generic_method.dll -o obj\tests\samples\inlining\inline_static_generic_method.cleaned.dll

ildasm obj\tests\samples\inlining\inline_static_generic_method.cleaned.dll /OUT=tests\samples\inlining\inline_static_generic_method.cleaned.il