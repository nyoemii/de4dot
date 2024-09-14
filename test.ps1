$Configuration="Release"

mkdir obj -Force
# C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64
$env:PATH="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64;$env:PATH"

$de4dotExec="Release\net8.0\win-x64\de4dot.exe"

# tests\samples\inlining\inline_static_method.il
mkdir -Force obj\tests\samples\inlining\
ilasm /DLL tests\samples\inlining\inline_static_method.il /OUTPUT=obj\tests\samples\inlining\inline_static_method.dll

& $de4dotExec obj\tests\samples\inlining\inline_static_method.dll -o obj\tests\samples\inlining\inline_static_method.cleaned.dll

ildasm obj\tests\samples\inlining\inline_static_method.cleaned.dll /OUT=tests\samples\inlining\inline_static_method.cleaned.il

# tests\samples\inlining\inline_static_generic_method.il
mkdir -Force obj\tests\samples\inlining\
ilasm /DLL tests\samples\inlining\inline_static_generic_method.il /OUTPUT=obj\tests\samples\inlining\inline_static_generic_method.dll

& $de4dotExec obj\tests\samples\inlining\inline_static_generic_method.dll -o obj\tests\samples\inlining\inline_static_generic_method.cleaned.dll

ildasm obj\tests\samples\inlining\inline_static_generic_method.cleaned.dll /OUT=tests\samples\inlining\inline_static_generic_method.cleaned.il

# tests\samples\inlining\inline_static_method_br_target.il
mkdir -Force obj\tests\samples\inlining\
ilasm /DLL tests\samples\inlining\inline_static_method_br_target.il /OUTPUT=obj\tests\samples\inlining\inline_static_method_br_target.dll

& $de4dotExec obj\tests\samples\inlining\inline_static_method_br_target.dll -o obj\tests\samples\inlining\inline_static_method_br_target.cleaned.dll

ildasm obj\tests\samples\inlining\inline_static_method_br_target.cleaned.dll /OUT=tests\samples\inlining\inline_static_method_br_target.cleaned.il