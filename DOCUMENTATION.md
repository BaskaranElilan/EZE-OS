# EZE OS Playbook — Technical Specification & Feature Reference

> **Playbook Name:** EZE OS  
> **Target Audience:** Students, Office Workers & Professionals  
> **Version:** 1.0  
> **Author / Maintainer:** EzE  
> **GUID:** `866d4605-f011-4536-8f24-88a60d42e362`  
> **ProductCode:** `607` (Unique Standalone Identifier)  
> **Archive File:** `EZE-OS.apbx` (ZIP format, password: `malte`)  
> **Repository:** `https://github.com/BaskaranElilan/EZE-OS`  

---

## 1. System Requirements & Compatibility

### Supported Windows Versions
* **Windows 10:** 21H2 (`19044`), 22H2 (`19045`)
* **Windows 11:** 22H2 (`22621`), 23H2 (`22631`), 24H2 (`26100`), 25H2 (`26200`)

### Execution Requirements (`playbook.conf`)
* **`DefenderToggled`**: Allows Defender configuration.
* **`NoPendingUpdates`**: Ensures clean application without pending restart locks.
* **`NoAntivirus`**: Prevents third-party AV interference during execution.
* **`Internet`**: Required for downloading user-selected software packages.
* **`PluggedIn`**: Mandates AC power to prevent laptop battery drain during optimization.
* **`SupportsISO`**: Can be baked into Windows ISOs via AME Wizard ISO tool.

---

## 2. Debloating & Component Removal

### A. Pre-Installed AppX / Bloatware Removal
EZE OS strips non-essential Windows Store apps to free up system memory and background CPU cycles while keeping core functionality intact (MS Store, Calculator, Camera remain available).

| App / Component | Removal Option Key | Action |
| :--- | :--- | :--- |
| **Microsoft Edge** | `remove-edge` | Uninstalls Edge browser, stops background update services, removes Edge auto-start entries |
| **OneDrive** | `remove-onedrive` | Uninstalls OneDrive setup, removes file sync extensions, sets `DisableFileSyncNGSC` registry policy |
| **AI Features (Copilot & Recall)** | `remove-winsxs-ai` | Removes `Microsoft.Windows.Ai.Copilot.Provider`, disables Copilot via registry policy (`TurnOffWindowsCopilot`) |
| **Microsoft Teams** | `remove-teams` | Uninstalls pre-installed Teams consumer app |
| **Xbox Apps** | `remove-appx-xbox` | Removes Xbox Game Bar, Xbox Speech, and gaming overlays (optional checkbox for non-gamers) |
| **MS Photos** | `remove-appx-photos` | Removes pre-installed Photos app (replaced by lightweight viewer) |
| **Dev Home** | `remove-appx-devhome` | Removes Dev Home bloatware |
| **Your Phone / Link to Windows** | `remove-appx-yourphone` | Removes Your Phone AppX packages and hides cross-device resume settings |

### B. Telemetry & Tracking Disablement
* **DiagTrack & dmwappushservice:** Stopped, disabled, and blocked from running as services.
* **Customer Experience Improvement Program (CEIP):** Tasks `Consolidator`, `UsbCeip`, `KernelCeipTask` disabled in Task Scheduler.
* **Application Experience:** Tasks `AitAgent` and `Microsoft Compatibility Appraiser` disabled.
* **Windows Error Reporting (WER):** Error reporting services stopped and policy keys configured to prevent data uploads.
* **Diagnostic Data:** Set to 0 (Security level on Enterprise/Education, minimum on Pro).

---

## 3. Optional Software Packages (Selective Installation)

Users can select their preferred software during the AME Wizard setup wizard:

### Web Browsers
1. **Brave Browser (Default Recommended):** Fast, ad-blocking by default, optimal for research.
2. **Mozilla Firefox:** Privacy-oriented browser with full extension support.
3. **LibreWolf:** Hardened Firefox fork with uBlock Origin pre-configured and zero telemetry.

### Productivity & Office Suites
1. **LibreOffice (Default Recommended):** Full-featured free office suite (.docx, .xlsx, .pptx support).
2. **OnlyOffice Desktop:** Modern UI office suite with high Microsoft Office file compatibility.

### Communication & Media
1. **Thunderbird:** Email client supporting university/work accounts (IMAP, POP3, Exchange, Gmail).
2. **VLC Media Player:** Universal codec media player for lecture recordings and video playback.

### System Utilities
1. **7-Zip:** High-ratio archive tool for `.zip`, `.rar`, `.7z` files.
2. **Notepad++:** Lightweight code and plain text editor.

---

## 4. Performance & System Optimizations

### Power & Hibernation Management
* **Disable Hibernation (`disable-hibernate`):** Executes `powercfg /hibernate off`, turning off `hiberfil.sys` to free **2 GB to 8 GB+ of disk space** and disabling Fast Startup to prevent memory corruption.
* **Enable Hibernation (`enable-hibernate`):** Option provided for laptop users who prefer sleep/hibernate states.

### Kernel & System Performance
* **Intel TSX (`DisableTsx`):** Enabled where supported to boost database transaction and heavy calculation performance.
* **Legacy Boot Policy:** Configured via `bcdedit` for faster boot transitions.
* **Memory Management:** Clears unused background working sets and optimizes system responsiveness.

### Security Options
* **Windows Defender Toggle:**
  * **Keep Defender Enabled (`enable-defender` - Default):** Recommended for students and general office use.
  * **Disable Defender (`disable-defender`):** Option for advanced power users seeking maximum performance.

---

## 5. UI, Customization & Branding

### Visual Branding Assets
* **Logo:** Red 3D Metallic Cube with centered **"R"** logo (`playbook.png`).
* **Desktop Wallpaper:** Dark metallic theme wallpaper applied to `%SystemRoot%\Web\Wallpaper\EZE-OS\desktop.jpg`.
* **Lockscreen Wallpaper:** Dark metallic theme applied to `%SystemRoot%\Web\Wallpaper\EZE-OS\lockscreen.jpg`.
* **OEM Information:** System Properties display Model as `"EZE OS for Students and Office"` and Manufacturer as `"EZE OS"`.

### UI Tweaks
* **Legacy Context Menu (`configure-lcm`):** Restores Windows 10 full right-click context menu in Windows 11.
* **Dark Mode (`configure-darkmode`):** Sets Windows System and App themes to Dark.
* **Transparency Effects (`configure-te`):** Disables aero transparency for lower GPU usage and snappier window rendering.
* **Start Menu Cleanup (`remove-pinned-items-startmenu`):** Cleans pre-pinned bloat icons from the Start Menu on initial user logon.

---

## 6. Architecture & File Structure

```
EZE-OS-Playbook/
├── playbook.conf                      # Primary metadata and AME Wizard UI layout
├── Configuration/
├── Tasks/
│   ├── final.yml                      # Wallpaper, branding, and theme application
│   ├── revert.yml                     # Rollback / undo task configuration
│   ├── packages/
│   │   ├── win-sxs.yml                # Bloatware AppX, Copilot, OneDrive removal
│   │   └── app-win32.yml              # Software installer tasks
│   └── registry/
│       ├── explorer/win-settings.yml  # Context menu, dark mode, Explorer tweaks
│       ├── security/vbs.yml           # Security & Defender tweaks
│       ├── system/power.yml           # Powercfg hibernation management
│       ├── system/kernel.yml          # TSX & BCDedit kernel settings
│       └── updates/updates.yml        # Windows Update policies
└── Executables/
    ├── FINALIZE.cmd                   # OEM info & final cleanup script
    ├── Set-Theme.ps1                  # PowerShell theme generator
    ├── WallpaperStartup.cmd           # Wallpaper initialization
    └── Wallpapers/
        ├── desktop.jpg                # EZE OS Desktop Wallpaper
        └── lockscreen.jpg             # EZE OS Lockscreen Wallpaper
```

---

## 7. Packaging & Rebuild Instructions

To package or rebuild `EZE-OS.apbx` manually using 7-Zip CLI:

```powershell
$sevenZip = "C:\Program Files\7-Zip\7z.exe"
$source   = "G:\Cybersecurity Projects\AME Playbook creation\EZE-OS-Playbook"
$output   = "G:\Cybersecurity Projects\AME Playbook creation\EZE-OS.apbx"

Push-Location $source
& $sevenZip a "-tzip" "-pmalte" $output "."
Pop-Location
```

* **Output Archive:** `EZE-OS.apbx`
* **Encryption Standard:** ZIP archive format with password `malte`
