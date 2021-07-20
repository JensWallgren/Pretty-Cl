# PrettyCL
Readable, formatted output for the MSVC compiler (and linker - cl.exe)


### Why?
You're compiling you programs with MSVC's cl.exe. The output is turse, unstructured and hard to read. It's not the end of the world, but you deserve better.

### What?
PrettyCL is a small Powershell function that wraps the cl.exe call. It processes the output and adds some basic colors and (emoji) icons. You can probably write you own version without much effort. But *maybe* you don't enjoy writing Powershell or Regex expressions.

## Demo
<img src="https://user-images.githubusercontent.com/29680165/121817871-49bffb80-cc84-11eb-9ddc-f350532c0725.png" alt="Output comparison of cl.exe and Pretty-Cl" width="700" />

## Requirements

* Powershell 7
* (Windows Terminal) *For Emoji support. Coloring still works in the regular Powershell 7 console.*

## Installation
Install as a Powershell module.

1. **Locate your module folders**

    - *You have multiple module folder* 
    - *To list these folders, type* **$env:PSModulePath** *into a powershell session*

2. **Pull this directory to one of your Modules folders.**

    - *Choose any one of your module folders*
    - *File structure:* **{Module folder}/{PrettyCL folder}/{ps1m file}**

<img src="https://user-images.githubusercontent.com/29680165/121817441-c9989680-cc81-11eb-96aa-f921335b1510.gif" alt=".gif showing Pretty-Cl installed as a library" />
