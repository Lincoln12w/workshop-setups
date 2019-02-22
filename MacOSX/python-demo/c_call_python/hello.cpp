

#include <Python.h>
#include <iostream>

int main()
{
	Py_Initialize();
	if(!Py_IsInitialized()) {
		return -1;
	}
	
	PyRun_SimpleString("import sys");
	PyRun_SimpleString("sys.path.append(\"./\")");

	// import python modules
	PyObject * pModule = PyImport_ImportModule("hello");
	if(!pModule) {
		std::cout << "Cannot import Module!\n";
		return -2;
	}

	PyObject * pDict = PyModule_GetDict(pModule);
	if(!pDict) {
		std::cout << "Cannot get dictionary from module!\n";
		Py_DECREF(pModule);
		return -3;
	}

	// fetch function
	PyObject * pFunHi = PyDict_GetItemString(pDict, "display");
	if(!pFunHi) {
		std::cout << "Cannot get function!\n";
		Py_DECREF(pDict);
		Py_DECREF(pModule);
		return -4;
	}

	// run function
	PyObject_CallFunction(pFunHi, (char *)"s", (char *)"Crazybaby");

	// release
	Py_DECREF(pFunHi);
	//Py_DECREF(pDict);				// Why?
	Py_DECREF(pModule);
	Py_Finalize();

	return 0;
}


