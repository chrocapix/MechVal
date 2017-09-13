#pragma once

// The following ifdef block is the standard way of creating macros which make
// exporting from a DLL simpler. All files within this DLL are compiled with the
// MechValCore_EXPORTS symbol defined on the command line. This symbol should
// not be defined on any project that uses this DLL. This way any other project
// whose source files include this file see MechValCore_API functions as being
// imported from a DLL, whereas this DLL sees symbols defined with this macro as
// being exported.
#ifdef MechValCore_EXPORTS
#define MechValCore_API __declspec(dllexport)
#else
#define MechValCore_API __declspec(dllimport)
#endif

extern "C" {
// This is an example of an exported function.
MechValCore_API int fnMechValCore (void);
}
