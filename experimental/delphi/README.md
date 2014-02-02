# Pascal bindings


The files and examples contained within are intended for use with Delphi(Windows/Mac) or Lazarus-FreePascal (cross platform).

## Dependencies
All you need to run the pascal code are: a pascal compiler, the binary library of libembroidery; and it's wrapper.
###	1. libembroidery binary library
Currently only shared dynamic library supported, you must have `libembroidery.dll` (or such libembroidery.so in Linux).
You can get it by compiling the `ibembroidery-shared.pro` in `libembroidery` directory with such QT Creator, 
otherwise in Windows, by compiling the `libembroidery.sln` (or in your options `libEmbroideryVS2008.sln`) with Microsoft Visual Studio.
	
###	2. libembroidery.pas
This pascal unit is a wrapper/binding to make a call to functions within binary library above.

###	3. Delphi or Lazarus.
It is according to you (and your OS) whether you need to run the applications with Delphi or Lazarus.

#### * Delphi (Mac/Windows)
Supported Delphi versions:  5.0, 6.0, 7.0, 2005, 2006, 2010, XE, XE2, XE3, XE4, XE5 (Delphi 8 is not supported)
http://www.embarcadero.com/products/delphi

#### * Lazarus (all major OS)
The applications has been tested with Lazarus 1.0.14
For general & Windows user: Download the Lazarus installer by visit `http://www.lazarus.freepascal.org/` and click download.

Nowadays, Lazarus is available in many Linux distro's repositories.
Get it easily by opening a terminal and issuing this command:
```
sudo apt-get install fpc-source lazarus lcl
```
It will also install any package for cross-compile.

BUT in this time writing, some Linux repository is outdated, you may got the ver. 0.9.30 of Lazarus, or version 1.0.10 if you luck.
It means: You can not upgrade to the latest Lazarus version while the new version is not yet available in the Linux repository.
So, if you want to upgrade Lazarus to the latest version, below links may helps a lot:
* http://askubuntu.com/questions/364003/cant-correctly-install-lazarus
* http://lazplanet.blogspot.com/2013/03/how-to-install-lazarus.html
	
## Building new pascal project

* Create a new project with you favourite pascal IDE (Delphi / Lazarus)
* Set your IDE's search path to where you put libembroidery.pas, so this file can be accessed.
  Delphi: menu Project->Options->Directories/Conditionals->Search path.
* Add libembroidery in "uses" section, like this:
  uses libembroidery;
* Make sure your runtime application can access the libembroidery.dll, 
  usually put this in the same directory of your application (.exe)
That's all!

## Modifying libembroidery.pas
	Modifying the `libembroidery.pas` pascal unit is usually not required.

	IFF (if and only if) you sure you need to regenerate it from C header (*.h), 
	or in case there is a need to reflect any changes made of libembroidery's API,
	then you can use any tool to generate .PAS from .H such:
	* h2pas by FreePascal
	http://www.freepascal.org/tools/h2pas.var
	http://wiki.freepascal.org/Creating_bindings_for_C_libraries
	http://wiki.freepascal.org/H2Pas
	* HeadConv (Delphi & Windows only) by DrBob, later by JEDI
	http://www.drbob42.com/delphi/headconv.htm
	http://sourceforge.net/projects/jdarth/
	http://www.codeforge.com/read/156535/Headconv.ini__html


Enjoy !	