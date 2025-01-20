# Robotframework-Metrics Report

## Features

- `Custom HTML Report`: Create visually appealing and informative dashboard.
- `Detailed Metrics`: Access suite, test case, keyword statistics, status, and elapsed time.
- `Support for RF7`: Fully compatible with `Robot Framework 7` (from `v3.5.0` onwards).
- `Command-Line Interface`: Easy-to-use CLI for report generation.

1. Install

   ```sh
   pip install robotframework-metrics
   ```

2. Generate Metrics Report

   1. Default: `output.xml` is in the current directory

      ```sh
      robotmetrics
      ```

   2. Custom path

      ```sh
      robotmetrics --inputpath <path to output.xml> --output <output file>
      ```

3. Help

   ```sh
   robotmetrics --help
   ```

---

## References:

1. [robotframework-metrics](https://github.com/adiralashiva8/robotframework-metrics)
