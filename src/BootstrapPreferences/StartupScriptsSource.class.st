"
Holder of methods to be transformed into startup scripts.

Modification can be made inside the image and stored using source control.
"
Class {
	#name : 'StartupScriptsSource',
	#superclass : 'Object',
	#category : 'BootstrapPreferences',
	#package : 'BootstrapPreferences'
}

{ #category : 'settings - once' }
StartupScriptsSource >> fetchDarkIconSet [
| dark |
	dark := ThemeIcons named: 'darkerDawn'.
	dark url: 'https://github.com/terpon/pharo-icon-packs/archive/refs/tags/darkDawn-pharo13dev-1.zip'.
	dark downloadFromUrl.
	ThemeIcons current: dark.
]

{ #category : 'settings - once' }
StartupScriptsSource >> fetchDarkerDawnTheme [
	Metacello new 
		baseline: 'DarkerDawnTheme';
		repository: 'github://terpon/PharoDarkerDawnTheme:pharo13/src';
		load.
	Smalltalk globals at: #DarkerDawnTheme ifPresent: [ :theme | theme beCurrent ].

]

{ #category : 'scripts' }
StartupScriptsSource >> fonts [
	^ #( setFonts )
]

{ #category : 'settings - once' }
StartupScriptsSource >> setDarkTheme [
	PharoDarkTheme beCurrent.
]

{ #category : 'settings - once' }
StartupScriptsSource >> setFonts [
	FreeTypeSystemSettings loadFt2Library: true.
	FreeTypeFontProvider current updateFromSystem.
	
	StandardFonts defaultFont: (LogicalFont familyName: 'Input Sans' pointSize: 10 stretchValue: LogicalFont stretchCondensed weightValue: LogicalFont weightRegular slantValue: 0).	
	GraphicFontSettings resetAllFontToDefault.
	
	StandardFonts buttonFont: (LogicalFont familyName: 'Input Sans' pointSize: 10 stretchValue: LogicalFont stretchCondensed weightValue: LogicalFont weightBlack slantValue: 0).	
	StandardFonts codeFont: (LogicalFont familyName: 'Input Sans' pointSize: 10 stretchValue: LogicalFont stretchRegular weightValue: LogicalFont weightMedium slantValue: 0).	
	StandardFonts windowTitleFont: (LogicalFont familyName: 'Input Sans' pointSize: 10 stretchValue: LogicalFont stretchRegular weightValue: LogicalFont weightMedium slantValue: 0).	

]

{ #category : 'scripts' }
StartupScriptsSource >> theme [
	^ #( setDarkTheme fetchDarkIconSet fetchDarkerDawnTheme )
]
