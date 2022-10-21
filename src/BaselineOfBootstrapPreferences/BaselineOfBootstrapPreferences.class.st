"
BootstrapPreferences should have minimum dependencies.
The package is used to store in source control startup scripts to be stored on new computers.
"
Class {
	#name : #BaselineOfBootstrapPreferences,
	#superclass : #BaselineOf,
	#category : #BaselineOfBootstrapPreferences
}

{ #category : #baselines }
BaselineOfBootstrapPreferences >> baseline: spec [ 
	<baseline>
	
	spec for: #common do: [
		spec package: 'BootstrapPreferences'
	] 
]
