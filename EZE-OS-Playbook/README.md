<p align="center">
  <img src="playbook.png" alt="EZE OS Playbook" width="750"/>
</p>

<h1 align="center">EZE OS Playbook Source</h1>

<p align="center">
  <b>A lightweight, privacy-respecting, and optimized Windows Playbook built for Students, Office Workers & Professionals.</b>
</p>

<p align="center">
  <a href="#supported-windows-versions"><img src="https://img.shields.io/badge/Windows-10%20%7C%2011-0078D4?logo=windows&logoColor=white" alt="Windows Support"/></a>
  <a href="#version--identity"><img src="https://img.shields.io/badge/Version-1.0-brightgreen" alt="Version"/></a>
  <a href="LICENSE.txt"><img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License"/></a>
  <a href="https://ameliorated.io"><img src="https://img.shields.io/badge/AME%20Wizard-Compatible-orange" alt="AME Wizard"/></a>
</p>

---

## 🚀 Overview

This directory contains the complete source files for **EZE OS Playbook** v1.0.

EZE OS transforms stock Windows 10 and Windows 11 into a clean, fast, private, and distraction-free operating system tailored for students and office professionals.

---

## ✨ Key Features & Functions

- 🧹 **Debloating:** Removes OneDrive, Copilot/Recall AI, Microsoft Edge, Teams, and non-essential AppX packages.
- 🔒 **Privacy Protection:** Disables Telemetry, CEIP tasks, feedback mechanisms, and diagnostic data uploaders.
- 🌐 **Web Browsers:** User choice of Brave (default), Firefox, or LibreWolf.
- 💼 **Office Suites:** User choice of LibreOffice or OnlyOffice Desktop.
- 🛠️ **Utility Tools:** Optional 1-click install for Thunderbird, VLC Media Player, 7-Zip, and Notepad++.
- ⚡ **Power & Hibernation:** `powercfg` hibernation toggle (saves 2–8GB disk space) and Intel TSX kernel tweaks.
- 🎨 **Visual Styling:** EZE OS dark metallic wallpapers, dark theme integration, and legacy right-click context menu.
- 🛡️ **Security Flexibility:** Windows Defender ENABLED by default (with optional disable toggle).

---

## 💻 Supported Windows Versions

| Windows Build | Operating System | Support Status |
| :--- | :--- | :---: |
| **19044** | Windows 10 21H2 | ✅ Supported |
| **19045** | Windows 10 22H2 | ✅ Supported |
| **22621** | Windows 11 22H2 | ✅ Supported |
| **22631** | Windows 11 23H2 | ✅ Supported |
| **26100** | Windows 11 24H2 | ✅ Supported |
| **26200** | Windows 11 25H2 | ✅ Supported |

---

## 🛠️ Building `.apbx` Package

To package the contents of this directory into `EZE-OS.apbx` using 7-Zip CLI:

```powershell
$sevenZip = "C:\Program Files\7-Zip\7z.exe"
$source   = "G:\Cybersecurity Projects\AME Playbook creation\EZE-OS-Playbook"
$output   = "G:\Cybersecurity Projects\AME Playbook creation\EZE-OS.apbx"

Push-Location $source
& $sevenZip a "-tzip" "-pmalte" $output "."
Pop-Location
```

---

## 🆔 Metadata Reference

- **Name:** EZE OS
- **Version:** 1.0
- **Author:** EzE
- **GUID:** `866d4605-f011-4536-8f24-88a60d42e362`
- **ProductCode:** `607`
- **GitHub Repository:** [https://github.com/BaskaranElilan/EZE-OS](https://github.com/BaskaranElilan/EZE-OS)
