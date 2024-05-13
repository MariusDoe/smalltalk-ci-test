Class {
	#name : #SomeClassTest,
	#superclass : #TestCase,
	#category : #'SmalltalkCITest-Tests'
}

{
	#category : #tests,
	#'squeak_changestamp' : 'mad 5/13/2024 20:45'
}
SomeClassTest >> testCalculateFail [
	self assert: SomeClass new calculate > 42.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'mad 5/13/2024 20:45'
}
SomeClassTest >> testCalculateSuccess [
	self assert: SomeClass new calculate = 42.
]
