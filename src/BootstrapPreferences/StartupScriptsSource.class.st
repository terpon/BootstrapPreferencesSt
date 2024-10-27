"
Holder of methods to be transformed into startup scripts.

Modification can be made inside the image and stored using source control.
"
Class {
	#name : #StartupScriptsSource,
	#superclass : #Object,
	#category : #BootstrapPreferences
}

{ #category : #scripts }
StartupScriptsSource >> author [
	^ #( setAuthor )
]

{ #category : #'settings - once' }
StartupScriptsSource >> fetchDarkIconSet [
| dark |
	dark := ThemeIcons named: 'darkIdea'.
	dark url: 'https://github.com/terpon/pharo-icon-packs/archive/refs/tags/v0.0.1-darkIdea.zip'.
	dark downloadFromUrl.
	ThemeIcons current: dark.
]

{ #category : #'settings - once' }
StartupScriptsSource >> fetchDarkerDawnTheme [
	Metacello new 
		baseline: 'DarkerDawnTheme';
		repository: 'github://terpon/PharoDarkerDawnTheme/src';
		load.
	Smalltalk globals at: #DarkerDawnTheme ifPresent: [ :theme | theme beCurrent ].

]

{ #category : #scripts }
StartupScriptsSource >> fonts [
	^ #( setFonts )
]

{ #category : #settings }
StartupScriptsSource >> setAuthor [
	Author fullName: 'terpon'.
]

{ #category : #'settings - once' }
StartupScriptsSource >> setDarkTheme [
	PharoDarkTheme beCurrent.
]

{ #category : #'settings - once' }
StartupScriptsSource >> setFonts [
	FreeTypeSystemSettings loadFt2Library: true.
	FreeTypeFontProvider current updateFromSystem.
	
	StandardFonts defaultFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10) forceNotBold.
	GraphicFontSettings resetAllFontToDefault.
	
	StandardFonts codeFont: (LogicalFont familyName: 'Input Sans' pointSize: 10).	
	StandardFonts windowTitleFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 11).
]

{ #category : #scripts }
StartupScriptsSource >> theme [
	^ #( setDarkTheme fetchDarkIconSet fetchDarkerDawnTheme )
]
