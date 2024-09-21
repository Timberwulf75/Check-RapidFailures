# Check-RapidFailures.ps1
![License](https://img.shields.io/github/license/Timberwulf75/Check-RapidFailures?style=flat-square)
![GitHub issues](https://img.shields.io/github/issues/Timberwulf75/Check-RapidFailures?style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/Timberwulf75/Check-RapidFailures?style=flat-square)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Timberwulf75/Check-RapidFailures?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/Timberwulf75/Check-RapidFailures?style=flat-square)


## Overview
`Check-RapidFailures.ps1` is a PowerShell script designed to identify rapid logon failures in Windows event logs. This script helps system administrators and security professionals detect potential brute-force attacks by monitoring Event ID 4625 from the Security event log.

## Features
- Analyzes Event ID 4625 logs for failed logon attempts.
- Identifies user accounts experiencing rapid failures within a defined time threshold.
- Outputs a summary of accounts with the number of rapid failures and total failures.

## Usage
1. **Download the Script**: Clone this repository or download the `Check-RapidFailures.ps1` script file.
2. **Run the Script**: Open a PowerShell terminal with administrative privileges and navigate to the script's directory. Run the script using:
    ```powershell
    .\Check-RapidFailures.ps1
    ```
3. **Customize Thresholds**: Modify the `$timeThresholdSeconds` and `$minimumRapidFailures` variables within the script to set your desired detection parameters.

## Script Details
- **`$timeThresholdSeconds`**: Specifies the time window (in seconds) to check for rapid failures. Default is set to 10 seconds.
- **`$minimumRapidFailures`**: The minimum number of rapid failures required to flag an account. Default is set to 5 failures.

## Example Output
UserName      LogonType RapidFailures TotalFailures
--------      --------- ------------- -------------
Administrator True                 11            12
htb-student   True                  5             6
user1         True                  5             6
user0         True                  9            10


## Requirements
- PowerShell 5.0 or later
- Administrative privileges on the host system

## Limitations
- The script currently only analyzes Event ID 4625 and is limited to detecting rapid logon failures.
- Requires access to the Security event log.

## Contributing
Feel free to open issues or submit pull requests if you have suggestions or improvements for this script.

## License
This project is licensed under the [https://github.com/Timberwulf75/Check-RapidFailures/blob/main/LICENSE](LICENSE).

## Contact
For any questions or feedback, please reach out to https://github.com/Timberwulf75

