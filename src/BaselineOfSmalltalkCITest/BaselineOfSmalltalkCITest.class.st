Class {
	#name : #BaselineOfSmalltalkCITest,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmalltalkCITest
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'mad 5/13/2024 20:41'
}
BaselineOfSmalltalkCITest >> baseline: spec [
	<baseline>
	spec
		for: #'common'
		do: [
			spec
				package: 'SmalltalkCITest-Core';
				package: 'SmalltalkCITest-Tests' with: [spec requires: #('default')];
				yourself.
			spec
				group: 'default' with: #('SmalltalkCITest-Core');
				group: 'tests' with: #('SmalltalkCITest-Tests');
				yourself].
]
