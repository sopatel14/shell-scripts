# Shell Scripts Collection

A collection of Bash scripts created while learning Linux administration, Shell Scripting, and DevOps automation.

This repository contains practical examples and mini-projects covering Bash fundamentals, system administration, automation, backup management, log analysis, and scripting best practices.

---

## About This Repository

The scripts in this repository were developed as part of my Linux and DevOps learning journey. They demonstrate common tasks that system administrators and DevOps engineers perform regularly.

Topics covered include:

* Variables and user input
* Conditional statements
* Loops
* Functions
* File operations
* Error handling
* Log analysis
* Backup automation
* System monitoring
* Package installation
* Shell scripting best practices

---

## Repository Structure

```text
shell-scripts/
├── archive/
│   ├── linux_2k.log
│   └── sample_log.log
├── backup.sh
├── check_number.sh
├── count.sh
├── countdown.sh
├── disk_check.sh
├── file_check.sh
├── for_loop.sh
├── functions.sh
├── greet.sh
├── install_packages.sh
├── log_analyzer.sh
├── log_rotate.sh
├── maintenance.sh
├── server_check.sh
├── system_info.sh
└── README.md
```

---

## Script Categories

| Category                   | Scripts                                                               |
| -------------------------- | --------------------------------------------------------------------- |
| Bash Basics                | hello.sh, variable.sh, greet.sh, greet1.sh                            |
| Conditional Statements     | check_number.sh, file_check.sh                                        |
| Loops                      | count.sh, countdown.sh, for_loop.sh                                   |
| Functions                  | functions.sh, local_demo.sh                                           |
| System Administration      | system_info.sh, disk_check.sh, server_check.sh                        |
| Automation                 | backup.sh, maintenance.sh, install_packages.sh                        |
| Log Management             | log_analyzer.sh, log_rotate.sh                                        |
| Error Handling & Debugging | set-e.sh, set-u.sh, set-o-pipefail.sh, strict_demo.sh, safe_script.sh |
| Arguments & Parameters     | args_demo.sh                                                          |

---

## Featured Scripts

### Backup Script

Creates compressed backups with timestamps.

**Features**

* Creates `.tar.gz` archives
* Supports backup automation
* Uses timestamps for versioning
* Suitable for cron scheduling

---

### Log Analyzer

Analyzes log files and generates reports.

**Features**

* Reads log files
* Identifies errors and warnings
* Generates summary reports
* Useful for troubleshooting and monitoring

---

### System Information Script

Displays useful system information such as:

* Hostname
* Kernel version
* Disk usage
* Memory usage
* System uptime

---

### Disk Monitoring Script

Checks available disk space and helps identify storage issues before they become critical.

---

### Package Installation Script

Automates package installation using Bash.

Useful for server setup and provisioning tasks.

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/sopatel14/shell-scripts.git
cd shell-scripts
```

Make a script executable:

```bash
chmod +x script-name.sh
```

Run the script:

```bash
./script-name.sh
```

Or:

```bash
bash script-name.sh
```

---

## Example Usage

Run the backup script:

```bash
./backup.sh
```

Run the log analyzer:

```bash
./log_analyzer.sh
```

Check disk usage:

```bash
./disk_check.sh
```

Display system information:

```bash
./system_info.sh
```

---

## Cron Job Example

Schedule a backup every day at 2:00 AM:

```bash
0 2 * * * /home/ubuntu/shell-scripts/backup.sh
```

> Note: Cron entries are currently disabled/commented out in my lab environment and are used for learning purposes.

---

## Learning Outcomes

Through these scripts, I practiced:

* Linux command-line operations
* Bash scripting fundamentals
* Functions and reusable code
* Conditional logic
* Looping constructs
* File and directory management
* Error handling techniques
* Automation concepts
* System administration tasks
* DevOps scripting practices

---

## Future Improvements

* Email notifications
* Automated monitoring alerts
* AWS automation scripts
* Docker automation scripts
* CI/CD integration
* Infrastructure maintenance automation

---

## Technologies Used

* Bash
* Linux (Ubuntu)
* Cron
* tar & gzip
* Git
* GitHub

---

## Author

**Sourav Patel**

GitHub: https://github.com/sopatel14

---

## License

This repository is intended for educational purposes, DevOps practice, and Linux automation learning.

