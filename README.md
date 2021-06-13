# PrettyCL
Readable, formatted output for the MSVC compiler (and linker - cl.exe)


### Why?
You're compiling you programs with MSVC's cl.exe. The output is turse, unstructured and hard to read. It's not the end of the world, but you deserve better.

### What?
PrettyCL is a small Powershell function that wraps the cl.exe call. It processes the output and adds some basic colors and (emoji) icons. You can probably write you own version without much effort. But *maybe* you don't enjoy writing Powershell or Regex expressions.

### And?
Now your cl.exe output is easier to read, particularly at a glance.

Glance at this:

<img src="https://user-images.githubusercontent.com/29680165/121817635-df5a8b80-cc82-11eb-9af5-974cb1a98e30.png" alt="Output comparison of cl.exe and Pretty-Cl" width="700" />

## Installation
This is easiest to install as a module. To install, pull this directory to a folder in one of your Modules folders.
Powershell treats a couple of folders as "Module folders". To list these folders, print the **$env:PSModulePath** environment variable.

<img src="https://user-images.githubusercontent.com/29680165/121817441-c9989680-cc81-11eb-96aa-f921335b1510.gif" alt=".gif showing Pretty-Cl installed as a library" />
