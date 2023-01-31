try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    from appium import webdriver
    from percy import percy_screenshot
    ROBOT = False
except Exception:
    ROBOT = False

@keyword("PERCY SNAPSHOT")
def percySnapshot(title):
     driver = BuiltIn().get_library_instance('AppiumLibrary')._current_application()
     percy_screenshot(driver,title)
     print("percy is working")