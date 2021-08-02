'From Cuis 4.1 of 12 December 2012 [latest update: #1524] on 30 December 2012 at 6:01:06 pm'!
'Description Please enter a description for this package '!
!classDefinition: #RxMatcherTest category: #'Regex-Tests-Core'!
TestCase subclass: #RxMatcherTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Regex-Tests-Core'!
!classDefinition: 'RxMatcherTest class' category: #'Regex-Tests-Core'!
RxMatcherTest class
	instanceVariableNames: ''!

!classDefinition: #RxParserTest category: #'Regex-Tests-Core'!
TestCase subclass: #RxParserTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Regex-Tests-Core'!
!classDefinition: 'RxParserTest class' category: #'Regex-Tests-Core'!
RxParserTest class
	instanceVariableNames: ''!


!RxMatcherTest commentStamp: 'Tbn 11/12/2010 22:31' prior: 0!
This class provides tests for the regular expression matcher.!

!RxParserTest commentStamp: 'Tbn 11/12/2010 22:31' prior: 0!
This class provides tests for the regular expression parser.!

!RxMatcherTest methodsFor: 'utilties' stamp: 'TestRunner 1/15/2010 19:38'!
compileRegex: aString

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
henryReadme

!RxMatcherTest methodsFor: 'accessing' stamp: 'gsa 12/22/2012 12:25'!
matcherClass
	^ RxMatcher! !

!RxMatcherTest methodsFor: 'accessing' stamp: 'lr 1/15/2010 19:39'!
parserClass

!RxMatcherTest methodsFor: 'utilties' stamp: 'gsa 12/22/2012 12:26'!
runMatcher: aMatcher with: aString expect: aBoolean withSubexpressions: anArray
	| copy got |
	copy := aMatcher
		copy: aString
		translatingMatchesUsing: [ :each | each ].
	self 
		assert: copy = aString
		description: 'Copying: expected ' , aString printString , ', but got ' , copy printString.
	got := aMatcher search: aString.
	self
		assert: got = aBoolean 
		description: 'Searching: expected ' , aBoolean printString , ', but got ' , got printString.
	(anArray isNil or: [ aMatcher supportsSubexpressions not ])
		ifTrue: [ ^ self ].
	1 to: anArray size by: 2 do: [ :index |
		| sub subExpect subGot |
		sub := anArray at: index.
		subExpect := anArray at: index + 1.
		subGot := aMatcher subexpression: sub.
		self
			assert: subExpect = subGot
			description: 'Subexpression ' , sub printString , ': expected ' , subExpect printString , ', but got ' , subGot printString ]! !

!RxMatcherTest methodsFor: 'utilties' stamp: 'lr 1/15/2010 19:31'!
runRegex: anArray

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:28'!
testCaseInsensitive

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:28'!
testCaseSensitive

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:38'!
testCopyReplacingMatches

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'hfm 4/2/2010 13:52'!
testCopyTranslatingMatches

!RxMatcherTest methodsFor: 'testing-empty' stamp: 'gsa 12/20/2012 20:02'!
testEmptyStringAtBeginningOfLine
	| matcher |
	matcher := self matcherClass forString: '^'.
	self
		assert: (matcher copy: 'foo1 bar1' , String crString , 'foo2 bar2' replacingMatchesWith: '*')
			= ('*foo1 bar1' , String crString , '*foo2 bar2')
		description: 'An empty string at the beginning of a line'! !

!RxMatcherTest methodsFor: 'testing-empty' stamp: 'gsa 12/22/2012 12:34'!
testEmptyStringAtBeginningOfWord
	| matcher |
	matcher := self matcherClass forString: '\<'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= '*foo *bar'
		description: 'An empty string at the beginning of a word'! !

!RxMatcherTest methodsFor: 'testing-empty' stamp: 'gsa 12/20/2012 20:02'!
testEmptyStringAtEndOfLine
	| matcher |
	matcher := self matcherClass forString: '$'.
	self
		assert: (matcher copy: 'foo1 bar1' , String crString , 'foo2 bar2' replacingMatchesWith: '*')
			= ('foo1 bar1*', String crString , 'foo2 bar2*')
		description: 'An empty string at the end of a line'! !

!RxMatcherTest methodsFor: 'testing-empty' stamp: 'gsa 12/22/2012 12:34'!
testEmptyStringAtEndOfWord
	| matcher |
	matcher := self matcherClass forString: '\>'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= 'foo* bar*'
		description: 'An empty string at the end of a word'! !

!RxMatcherTest methodsFor: 'testing-empty' stamp: 'gsa 12/22/2012 12:34'!
testEmptyStringAtWordBoundary
	| matcher |
	matcher := self matcherClass forString: '\b'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= '*foo* *bar*'
		description: 'An empty string at a word boundary'! !

!RxMatcherTest methodsFor: 'testing-empty' stamp: 'gsa 12/22/2012 12:35'!
testEmptyStringNotAtWordBoundary
	| matcher |
	matcher := self matcherClass forString: '\B'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= 'f*o*o b*a*r'
		description: 'An empty string not at a word boundary'! !

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry001

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry002

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry003

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry004

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry005

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry006

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry007

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry008

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry009

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry010

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry011

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry012

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry013

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry014

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry015

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry016

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry017

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry018

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry019

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry020

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry021

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry022

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry023

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry024

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry025

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry026

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry027

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry028

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry029

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry030

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry031

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry032

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry033

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry034

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry035

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry036

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry037

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry038

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry039

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry040

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry041

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry042

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry043

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry044

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry045

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry046

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry047

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry048

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry049

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry050

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry051

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry052

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry053

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry054

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry055

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry056

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry057

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry058

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry059

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry060

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry061

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry062

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry063

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry064

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry065

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry066

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry067

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry068

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry069

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry070

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry071

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry072

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry073

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry074

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry075

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry076

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry077

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry078

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry079

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry080

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry081

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry082

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry083

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry084

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry085

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry086

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry087

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry088

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry089

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry090

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry091

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry092

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry093

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry094

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry095

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry096

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry097

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry098

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry099

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry100

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry101

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry102

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry103

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry104

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry105

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry106

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry107

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry108

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry109

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry110

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry111

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry112

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry113

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry114

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry115

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry116

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry117

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry118

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry119

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry120

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry121

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry122

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry123

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry124

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry125

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry126

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry127

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry128

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry129

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry130

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry131

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry132

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry133

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry134

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry135

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry136

!RxMatcherTest methodsFor: 'testing-henry' stamp: 'lr 1/15/2010 19:46'!
testHenry137

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:45'!
testMatches

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:38'!
testMatchesIn

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'hfm 4/2/2010 13:52'!
testMatchesInCollect

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:44'!
testMatchesInDo

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:39'!
testMatchesOnStream

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'hfm 4/2/2010 13:52'!
testMatchesOnStreamCollect

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:44'!
testMatchesOnStreamDo

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:45'!
testMatchesStream

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'TestRunner 1/15/2010 20:51'!
testMatchingRangesIn

!RxMatcherTest methodsFor: 'testing' stamp: 'lr 1/15/2010 19:47'!
testRegex001

!RxMatcherTest methodsFor: 'testing' stamp: 'lr 1/15/2010 19:47'!
testRegex002

!RxMatcherTest methodsFor: 'testing' stamp: 'lr 1/15/2010 19:47'!
testRegex003

!RxMatcherTest methodsFor: 'testing' stamp: 'lr 4/23/2010 09:01'!
testRegex004

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'gsa 12/22/2012 12:26'!
testStringAllRangesOfRegexMatches
	| result |
	result := 'aabbcc' allRangesOfRegexMatches: 'b+'.
	self assert: result size = 1.
	self assert: result first first = 3.
	self assert: result first last = 4
	! !

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:50'!
testStringAllRegexMatches

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:51'!
testStringAsRegex

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:52'!
testStringAsRegexIgnoringCase

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:53'!
testStringCopyWithRegexMatchesReplacedWith

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:53'!
testStringCopyWithRegexMatchesTranslatedUsing

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:55'!
testStringMatchesRegex

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:55'!
testStringMatchesRegexIgnoringCase

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:56'!
testStringPrefixMatchesRegex

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:56'!
testStringPrefixMatchesRegexIgnoringCase

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:57'!
testStringRegexMatchesCollect

!RxMatcherTest methodsFor: 'testing-extensions' stamp: 'lr 4/23/2010 08:58'!
testStringRegexMatchesDo

!RxMatcherTest methodsFor: 'testing-protocol' stamp: 'lr 1/15/2010 20:55'!
testSubexpressionCount

!RxMatcherTest class methodsFor: 'accessing' stamp: 'lr 1/15/2010 19:48'!
packageNamesUnderTest

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/5/2006 00:11'!
DoesNotWorktestBackQuotesEscape

!RxParserTest methodsFor: 'tests' stamp: 'StephaneDucasse 12/11/2010 15:00'!
test

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 16:24'!
testCadrMatching

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 16:49'!
testCharacterSet

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 17:39'!
testCharacterSetBinaryNumber

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/5/2006 00:01'!
testCharacterSetInversion

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 23:20'!
testCharacterSetRange

!RxParserTest methodsFor: 'tests' stamp: 'marcus.denker 10/22/2008 10:47'!
testMatchesInwW

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 16:38'!
testOrOperator

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 16:17'!
testQuotingOperators

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/3/2006 19:50'!
testSimpleMatchesRegex

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/3/2006 21:41'!
testSimpleMatchesRegexWithStar

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 23:38'!
testSpecialCharacterInSetRange

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 16:26'!
testStarPlusQuestionMark

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/3/2006 22:57'!
testStarPrecedence

!RxParserTest methodsFor: 'tests' stamp: 'StephaneDucasse 12/11/2010 15:00'!
testTranslatingMatchesUsing

!RxParserTest methodsFor: 'tests' stamp: 'sd 9/4/2006 23:29'!
toDotestSpecialCharacterInSetRange