# Guide to setting up `smalltalkCI`

1. Add a test package
   * this package contains one or more subclasses of the class `TestCase`
   * you can name it `{YourProjectname}-Tests`
   * methods of these classes that are called `test{Something}` will be executed as tests
   * you can add `setUp` and `tearDown` methods to each subclass, they will run before and after each test, respectively
   * see [here](src/SmalltalkCITest-Tests/SomeClassTest.class.st) and [here](https://github.com/hpi-swa-teaching/SWT-Demo/tree/1d6d942c8a34d120f7fb18b76549634bfa09980c/packages/Counter-Tests.package/CounterTests.class/instance) for some examples
2. Add a `Baseline` class
   * this class defines the dependencies of your project
   * define a new package called `BaselineOf{YourProjectName}`
   * define a class within that package like this:
     ```smalltalk
     BaselineOf subclass: #BaselineOf{YourProjectName}
         instanceVariableNames: ''
    	   classVariableNames: ''
    	   poolDictionaries: ''
    	   category: 'BaselineOf{YourProjectName}'
     ```
   * define a method `baseline:` like this (adjust the package names if necessary):
     ```smalltalk
     baseline: spec
         <baseline>
         spec
             for: #'common'
             do: [
                 spec
                     package: '{YourProjectName}-Core';
                     package: '{YourProjectName}-Tests' with: [spec requires: #('default')];
                     yourself.
                 spec
                     group: 'default' with: #('{YourProjectName}-Core');
                     group: 'tests' with: #('{YourProjectName}-Tests');
                     yourself].
     ```
3. If your code is encoded in Tonel (not Cypress): add `.properties`
   * Tonel: paths in repository look like `{some-path}/{PackageName}/{ClassName}.class.st`
   * Cypress: paths in repository look like `{some-path}/{PackageName}.package/{ClassName}.class/instance/{methodName}.st`
   * if you are using Tonel, add a `.properties` file in the same directory as the packages (i. e. `{some-path}/.properties`)
   * you can copy [this file](src/.properties)
4. Add `.smalltalk.ston`
   * this file defines which parts of your projects are loaded in the CI and which tests are run
   * it should be placed in the root directory of your repository
   * you can copy [this file](.smalltalk.ston), replace `SmalltalkCITest` with your project name and `src` with the path to your packages (`{some-path}` from above)
   * you can read [the documentation](https://github.com/hpi-swa/smalltalkCI/tree/master?tab=readme-ov-file#setting-up-a-custom-smalltalkston) to customize it
5. Grant your [personal access token](https://github.com/settings/tokens) the `workflow` permission
6. Add `.github/workflows/ci.yml`
   * this file configures a GitHub action that runs your tests in the CI
   * you can copy [this file](.github/workflows/ci.yml) without any modifications
7. If you haven't done so, push your changes and check the Actions tab on your GitHub repository
