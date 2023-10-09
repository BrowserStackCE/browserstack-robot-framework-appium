# BrowserStack Integration with Robot Framework Appium (Python)

![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780) 

## Setup
* Clone the repo
* Create a virtual environment 
   ```
   python3 -m venv env
   source env/bin/activate
   ```
* Install dependencies  
  * `pip install --upgrade -r requirements.txt`

* Upload your Android or iOS App
<br/>Upload your Android app (.apk or .aab file) or iOS app (.ipa file) to BrowserStack servers using our REST API. Here is an example cURL request :
    ```
    curl -u "BROWSERSTACK_USERNAME:BROWSERSTACK_ACCESS_KEY" \
    -X POST "https://api-cloud.browserstack.com/app-automate/upload" \
    -F "file=@/path/to/apk/file"
    ```
The generated app_url is a unique ID used to identify the uploaded app build. You can add that to the config .yml file or directly set the path to the application in the config file under the app key. 

## Set BrowserStack Credentials 
* You can export the environment variables for the Username and Access Key of your BrowserStack account or you can set it in the config file. 

  ```
  export BROWSERSTACK_USERNAME=<browserstack-username> &&
  export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```

## Running tests
### Android
* To run single test, run 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/android/config/browserstack-single.yml" && browserstack-sdk robot tests/android/SingleTestAndroid.robot
   ```
* To run tests on multiple devices in parallel, run 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/android/config/browserstack-parallel-devices.yml" && browserstack-sdk robot tests/android/SingleTestAndroid.robot
   ```
* To run local tests, run 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/android/config/browserstack-local.yml" && browserstack-sdk robot tests/android/LocalTestAndroid.robot
   ```
* To run test suites in parallel
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/android/config/browserstack-parallel.yml" && browserstack-sdk robot tests/android/*.robot
   ```
* To run Test case level parallel tests we will be using the [Pabot](https://pabot.org/) library, 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/android/config/browserstack-parallel.yml" && browserstack-sdk pabot --testlevelsplit ./tests/android/ParallelTestAndroid.robot
   ```
* To run Test cases and Test suites together in parallel we will also be using the [Pabot](https://pabot.org/) library
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/android/config/browserstack-parallel.yml" && browserstack-sdk pabot --testlevelsplit ./tests/android/*.robot
   ```
     
### iOS
* To run single test, run 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/ios/config/browserstack-single.yml" && browserstack-sdk robot tests/ios/SingleTestiOS.robot
   ```
* To run tests on multiple devices in parallel, run 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/ios/config/browserstack-parallel-devices.yml" && browserstack-sdk robot tests/ios/SingleTestiOS.robot
   ```
* To run local tests, run 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/ios/config/browserstack-local.yml" && browserstack-sdk robot tests/ios/LocalTestiOS.robot
   ```
* To run test suites in parallel
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/ios/config/browserstack-parallel.yml" && browserstack-sdk robot tests/ios/*.robot
   ```
* To run Test case level parallel tests we will be using the [Pabot](https://pabot.org/) library, 
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/ios/config/browserstack-parallel.yml" && browserstack-sdk pabot --testlevelsplit ./tests/ios/ParallelTestiOS.robot
   ```
* To run Test cases and Test suites together in parallel we will also be using the [Pabot](https://pabot.org/) library
   ```
   export BROWSERSTACK_CONFIG_FILE="tests/ios/config/browserstack-parallel.yml" && browserstack-sdk pabot --testlevelsplit ./tests/ios/*.robot
   ```

Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)

## Notes
* You can view your test results on the [BrowserStack Automate dashboard](https://www.browserstack.com/automate)
* To configure the .yml file you can use the [SDK config generator](https://www.browserstack.com/docs/automate/selenium/sdk-config-generator)

## Additional Resources
* [Documentation for writing Automate test scripts in Python](https://www.browserstack.com/automate/python)
* [Customizing your tests on BrowserStack](https://www.browserstack.com/automate/capabilities)
* [Browsers & mobile devices for selenium testing on BrowserStack](https://www.browserstack.com/list-of-browsers-and-platforms?product=automate)
* [Using REST API to access information about your tests via the command-line interface](https://www.browserstack.com/automate/rest-api)