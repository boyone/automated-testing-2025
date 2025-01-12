# Install Robotframework and SeleniumLibrary by Virtual environments

1. Setup venv

   ```sh
   python -m venv venv
   ```

2. Activate virtual environment

   - macOS/linux

     ```sh
     source venv/bin/activate
     ```

     - result

       ```sh
       (venv) path to working directory$
       ```

   - windows

     ```sh
     venv\Scripts\activate
     ```

     - result

       ```sh
       (venv) path to working directory>
       ```

3. Install Robotframework

   ```sh
   pip install robotframework
   ```

4. Install Robotframework-SeleniumLibrary

   ```sh
   pip install robotframework-seleniumLibrary
   ```

5. Check Installation

   ```sh
   pip list
   ```

   - Result

     ```txt
     Package                        Version
     ------------------------------ -----------
     attrs                          24.3.0
     certifi                        2024.12.14
     cffi                           1.17.1
     h11                            0.14.0
     idna                           3.10
     outcome                        1.3.0.post0
     pip                            24.3.1
     pycparser                      2.22
     PySocks                        1.7.1
     robotframework                 7.1.1
     robotframework-pythonlibcore   4.4.1
     robotframework-seleniumlibrary 6.3.0
     selenium                       4.27.1
     sniffio                        1.3.1
     sortedcontainers               2.4.0
     trio                           0.28.0
     trio-websocket                 0.11.1
     typing_extensions              4.12.2
     urllib3                        2.3.0
     websocket-client               1.8.0
     wsproto                        1
     ```

6. Deactivate virtual environment

   - macOS/linux

     ```sh
     deactivate
     ```

   - windows

     ```sh
     deactivate
     ```

7. Install Driver

   1. [ChromeDriver](https://developer.chrome.com/docs/chromedriver/downloads)
   2. [Firefox GeckoDriver](https://github.com/mozilla/geckodriver/releases)