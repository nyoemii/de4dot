# Method proxying

Some obfuscators replace methods calls, accessing fields, expressions by proxy functions. for example, all call to `String::Combine` replaced to calls to this method.

```
.method static privatescope 
        string MethodProxy (
            string '',
            string ''
        ) cil managed 
{
    // Header Size: 12 bytes
    // Code Size: 8 (0x8) bytes
    // LocalVarSig Token: 0x11000006 RID: 6
    .maxstack 4
    .locals init (
        [0] uint32
    )

    IL_0000: ldarg.0
    IL_0001: ldarg.1
    IL_0002: call      string [mscorlib]System.String::Concat(string, string)
    IL_0007: ret
}
```

Call to MethodProxy, can be simply replaced to original call inside, to decrypt.
