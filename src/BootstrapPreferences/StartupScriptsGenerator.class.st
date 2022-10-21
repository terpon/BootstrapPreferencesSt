"
Generates .st files to be loaded by StartupPreferencesLoader

The generator take a class and creates one file per method in the #scripts protocol.
Each method should return an array of selectors. The selectors points to methods which will be transformed into StartupAction instances.

Method names inside protocols ending with 'once' will create actions only run for an image once.

Scripts for specific version should be put in specific protocols.
"
Class {
	#name : #StartupScriptsGenerator,
	#superclass : #Object,
	#category : #BootstrapPreferences
}

{ #category : #'private - generating' }
StartupScriptsGenerator >> createAction: aSelector from: anObject [
| method once code |
	method := anObject class methodNamed: aSelector.
	once := method protocol asString endsWith: 'once' caseSensitive: false.
	code := self createCode: method from: anObject.
	
	^ StartupAction name: aSelector asString code: code runOnce: once
]

{ #category : #'private - generating' }
StartupScriptsGenerator >> createCode: aMethod from: anObject [
| source code block |
	source := aMethod sourceCode lines allButFirst.
	code := String cr join: source.
	block := Smalltalk compiler evaluate: ('[ ', code, ' ]' ).
	^ block
]

{ #category : #'private - generating' }
StartupScriptsGenerator >> createScript: aSelector from: anObject [
| scriptName selectors actions |
	scriptName := (aSelector asString), '.st'.
	
	selectors := anObject perform: aSelector.
	actions := selectors collect: [ :selector | self createAction: selector from: anObject ].
	
	StartupPreferencesLoader default addAtStartupInGeneralPreferenceFolder: actions named: scriptName.
	
]

{ #category : #generating }
StartupScriptsGenerator >> createScriptsFrom: aClass [
| instance scripts |
	instance := aClass new.
	scripts := aClass selectorsInProtocol: #scripts.
	scripts do: [ :script | self createScript: script from: instance ]
	
]

{ #category : #running }
StartupScriptsGenerator >> run [
<script: 'self new run'>
	self createScriptsFrom: StartupScriptsSource.
]
