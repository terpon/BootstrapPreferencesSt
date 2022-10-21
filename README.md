# Pharo bootstrapping of startup scripts

Startup scripts are Smalltalk files run when an image is launched in [Pharo](https://pharo.org/) (on [GitHub](https://github.com/pharo-project/pharo)).

There are already tools to generate those scripts in a running image. This package allows me to save my scripts in source management and easily deploy on new computers.

## Installation
```smalltalk
Metacello new 
	baseline: 'BootstrapPreferences';
	repository: 'github://terpon/BootstrapPreferencesSt/src';
	load.
```

## Description

The package only needs to be installed once in an image. The scripts are generated on the file system and will be available to all images launched on the computer.

To generate the startup scripts:
```smalltalk
StartupScriptsGenerator new run.
```
Or execute the script pragma on the `run` method of the generator class.

## How it works

The generator creates one startup script for every instance method in the `StartupScriptsSource` class with the `scripts` protocol.

Those methods should return a collection of selectors. Each corresponding method will be a `StartupAction` instance with the source code being used as code.

**TODO** Scripts for versioned images are not handled yet. Everything is created in the general folder:
```smalltalk
StartupPreferencesLoader default preferencesGeneralFolder.
```

## Content

Scripts include setting the author, setting fonts, downloading an icon set for dark themes. They also fetch a specific dark theme from Github and sets it.


