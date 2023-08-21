# BrowserStack Integration with Robot Framework Appium (Python)

![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780) 

## Setup
* Clone the repo
* Install dependencies  
  * `pip install robotframework==3.2.2`
  * `pip install --upgrade robotframework-appiumlibrary`
  * `pip install robotframework-pabot`
  * `pip install browserstack-sdk`

* Upload your Android or iOS App
<br/>Upload your Android app (.apk or .aab file) or iOS app (.ipa file) to BrowserStack servers using our REST API. Here is an example cURL request :
    ```
    curl -u "BROWSERSTACK_USERNAME:BROWSERSTACK_ACCESS_KEY" \
    -X POST "https://api-cloud.browserstack.com/app-automate/upload" \
    -F "file=@/path/to/apk/file"
    ```

## Set BrowserStack Credentials 
* You can export the environment variables for the Username and Access Key of your BrowserStack account or you can set it in the config files. 

  ```
  export BROWSERSTACK_USERNAME=<browserstack-username> &&
  export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```

## Running tests
### Android
* To run single test, run 
   ```
   browserstack-sdk robot tests/android/SingleTestAndroid.robot --browserstack.config tests/android/config/browserstack-single.yml
   ```
* To run tests on multiple devices in parallel, run 
   ```
   browserstack-sdk robot tests/android/SingleTestAndroid.robot --browserstack.config tests/android/config/browserstack-parallel-devices.yml
   ```
* To run local tests, run 
   ```
   browserstack-sdk robot tests/android/LocalTestAndroid.robot --browserstack.config tests/android/config/browserstack-local.yml
   ```
* To run test suites in parallel
   ```
   browserstack-sdk robot tests/android/*.robot --browserstack.config tests/android/config/browserstack-parallel.yml
   ```
* To run Test case level parallel tests we will be using the [Pabot](https://pabot.org/) library, 
   ```
   browserstack-sdk pabot --testlevelsplit ./tests/android/ParallelTestAndroid.robot --browserstack.config tests/android/config/browserstack-parallel.yml  
   ```
* To run Test cases and Test suites together in parallel we will also be using the [Pabot](https://pabot.org/) library
   ```
   browserstack-sdk pabot --testlevelsplit ./tests/android/*.robot --browserstack.config tests/android/config/browserstack-parallel.yml  
   ```
     
### iOS
* To run single test, run 
   ```
   browserstack-sdk robot tests/ios/SingleTestiOS.robot --browserstack.config tests/ios/config/browserstack-single.yml
   ```
* To run tests on multiple devices in parallel, run 
   ```
   browserstack-sdk robot tests/ios/SingleTestiOS.robot --browserstack.config tests/ios/config/browserstack-parallel-devices.yml
   ```
* To run local tests, run 
   ```
   browserstack-sdk robot tests/ios/LocalTestiOS.robot --browserstack.config tests/ios/config/browserstack-local.yml
   ```
* To run test suites in parallel
   ```
   browserstack-sdk robot tests/ios/*.robot --browserstack.config tests/ios/config/browserstack-parallel.yml
   ```
* To run Test case level parallel tests we will be using the [Pabot](https://pabot.org/) library, 
   ```
   browserstack-sdk pabot --testlevelsplit ./tests/ios/ParallelTestiOS.robot --browserstack.config tests/ios/config/browserstack-parallel.yml  
   ```
* To run Test cases and Test suites together in parallel we will also be using the [Pabot](https://pabot.org/) library
   ```
   browserstack-sdk pabot --testlevelsplit ./tests/ios/*.robot --browserstack.config tests/ios/config/browserstack-parallel.yml  
   ```

Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)

## Notes
* This repository only works for Selenium 3 as of now. Desired Capabilities do not get honoured for Selenium 4. The open issue on SeleniumLibrary can be found [here](https://github.com/robotframework/SeleniumLibrary/issues/1774).
* You can view your test results on the [BrowserStack Automate dashboard](https://www.browserstack.com/automate)
* To test on a different set of browsers, check out our [platform configurator](https://www.browserstack.com/automate/java#setting-os-and-browser)

## Additional Resources
* [Documentation for writing Automate test scripts in Python](https://www.browserstack.com/automate/python)
* [Customizing your tests on BrowserStack](https://www.browserstack.com/automate/capabilities)
* [Browsers & mobile devices for selenium testing on BrowserStack](https://www.browserstack.com/list-of-browsers-and-platforms?product=automate)
* [Using REST API to access information about your tests via the command-line interface](https://www.browserstack.com/automate/rest-api)