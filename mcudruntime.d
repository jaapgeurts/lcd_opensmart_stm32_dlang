module mcudruntime;

// https://github.com/ldc-developers/ldc/issues/3290
//import ldc.attributes;
//@llvmAttr("nounwind") :
import ldc.llvmasm;

import io;

// pragma(LDC_intrinsic, "ldc.bitop.vld") ubyte volatileLoad(ubyte* ptr);
// pragma(LDC_intrinsic, "ldc.bitop.vld") ushort volatileLoad(ushort* ptr);
// pragma(LDC_intrinsic, "ldc.bitop.vld") uint volatileLoad(uint* ptr);
// pragma(LDC_intrinsic, "ldc.bitop.vld") ulong volatileLoad(ulong* ptr);
// pragma(LDC_intrinsic, "ldc.bitop.vst") void volatileStore(ubyte* ptr, ubyte value);
// pragma(LDC_intrinsic, "ldc.bitop.vst") void volatileStore(ushort* ptr, ushort value);
// pragma(LDC_intrinsic, "ldc.bitop.vst") void volatileStore(uint* ptr, uint value);
// pragma(LDC_intrinsic, "ldc.bitop.vst") void volatileStore(ulong* ptr, ulong value);

void rt_start() {
    init_tls();
}

size_t strlen(const(char)* s) {
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
        ++n;
    }
    return n;
}

extern(C) noreturn __assert(const(char)* msg, const(char)* file, int line) {
    string smsg = cast(string)msg[0..strlen(msg)];
    string sfile = cast(string)file[0..strlen(file)];
    writeln("FATAL ERROR: ", sfile,"(",line,"): ", smsg);
    // hang
    while(true)
        continue;
}

extern(C) void* memcpy(ubyte* a, ubyte* b, size_t n) {
    ubyte* t = a;
    for(int i=0;i<n;i++)
        *a++ = *b++;
    return t;
}

extern (C) void *memset(ubyte*p, int c, size_t n)
{
    ubyte* t = p;
    for(int i=0;i<n;i++)
        *p++ = cast(ubyte)c;
    return t;
}

void delay(int f)
{
    int i;
    for (i = 0; i < 1000 * f; i++) /* Wait a bit. */
        __asm("nop", "");
}

// These are used to initialize the TLS data and bss segments
extern __gshared extern(C) {
    uint _tdata_loadaddr; // label filled in by linker
    uint _tdata;
    uint _etdata;
    uint _tbss;
    uint _etbss;
}

private void init_tls() {
    uint* src, dest;

    // clear out tbss
    dest =  &_tbss;
    while (dest < &_etbss) {
		*dest++ = 0;
	}

    // copy tdata
    for (src = &_tdata_loadaddr, dest = &_tdata;
		dest < &_etdata;
		src++, dest++) {
		*dest = *src;
	}
}

/* Thread Local Storage is implemented using software calls because STM32 doesn't
have a TLS support through the TPIDRPRW register */
extern(C) {
/+
// Warning: This code is incomplete.
// This code is for emulated-tls thread model
    struct __emutls_control {
        uint size;  /* size of the object in bytes */
        uint _align;  /* alignment of the object in bytes */
        union {
            uint* index;  /* data[index-1] is the object address */
            void* address;  /* object address, when in single thread env */
        }
        void* value;  /* null or non-zero initial value for the object */
    }
    struct __emutls_object;

    void* __emutls_get_address (__emutls_control *a)
    {
        return &a.address;
    }
  +/
    // This code is for use with -fno-pic(gdc) or --relocation-model=static(ldc2)
    // and --fthread-model=local-exec
    void* __aeabi_read_tp() {
        // https://wiki.segger.com/Thread-Local_Storage
        // When the memory layout has the sections .tbss and .tdata (in this order), __aeabi_read_tp can simply return the start address of .tbss - 8.
        // https://maskray.me/blog/2021-02-14-all-about-thread-local-storage
        return cast(void*)((cast(uint)&_tbss)-8);
    }

}

