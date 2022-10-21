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

{ #category : #scripts }
StartupScriptsSource >> fonts [
	^ #( setFonts )
]

{ #category : #settings }
StartupScriptsSource >> setAuthor [
	Author fullName: 'terpon'.
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
