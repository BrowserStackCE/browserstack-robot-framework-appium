# BrowserStack Integration with Robot Framework Appium (Python)

![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780) 

## Setup
* Clone the repo
* Install dependencies  
  * `pip install robotframework==3.2.2`
  * `pip install --upgrade robotframework-appiumlibrary`
  * `pip install robotframework-pabot`
  * `pip install browserstack-local`
* Upload your Android or iOS App
<br/>Upload your Android app (.apk or .aab file) or iOS app (.ipa file) to BrowserStack servers using our REST API. Here is an example cURL request :
    ```
    curl -u "BROWSERSTACK_USERNAME:BROWSERSTACK_ACCESS_KEY" \
    -X POST "https://api-cloud.browserstack.com/app-automate/upload" \
    -F "file=@/path/to/apk/file"
    ```

## Set BrowserStack Credentials 
* You can export the environment variables for the Username and Access Key of your BrowserStack account. 

  ```
  export BROWSERSTACK_USERNAME=<browserstack-username> &&
  export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>&&
  export BROWSERSTACK_APP_ID=<app-hashed-id>
  ```

## Running tests
### Android
* To run single test, run `robot tests/android/SingleTestAndroid.robot`
* To run local tests, run `robot tests/android/LocalTestAndroid.robot`
* To run parallel tests we will be using the [Pabot](https://pabot.org/) library, 
  1. Test Suite level
     * Run - `pabot --processes <count_of_parallels> tests/android/parallel/*.robot`
     * Alternate method: `pabot --processes <count_of_parallels> <name_of_suites_to_run>`
         <br/>Eg: `pabot --processes 2 Suite1.robot Suite2.robot`
  2. Test case level
     * Run - `pabot --testlevelsplit <file_name>` <br/>Eg:  `pabot --testlevelsplit Suite1.robot`
  3. Run Test cases and Test suites together in parallel
     * Run - `pabot --testlevelsplit --processes <count_of_parallels> *.robot`
     <br/>**Note: If the process count exceeds the parallel thread limit, it will automatically get queued. No changes required in the scripts.**
     
### iOS
* To run single test, run `robot tests/iOS/SingleTestiOS.robot`
* To run local tests, run `robot tests/iOS/LocalTestiOS.robot`
* To run parallel tests we will be using the [Pabot](https://pabot.org/) library, 
  1. Test Suite level
     * Run - `pabot --processes <count_of_parallels> tests/iOS/parallel/*.robot`
     * Alternate method: `pabot --processes <count_of_parallels> <name_of_suites_to_run>`
         <br/>Eg: `pabot --processes 2 Suite1.robot Suite2.robot`
  2. Test case level
     * Run - `pabot --testlevelsplit <file_name>` <br/>Eg:  `pabot --testlevelsplit Suite1.robot`
  3. Run Test cases and Test suites together in parallel
     * Run - `pabot --testlevelsplit --processes <count_of_parallels> *.robot`
     <br/>**Note: If the process count exceeds the parallel thread limit, it will automatically get queued. No changes required in the scripts.**

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