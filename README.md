# XNET-CAN-Signal-Logger

Logging over 1000 channels * 100 Hz CAN data with bus load over 90% to TDMS files.

Developed with LabVIEW 2021 SP1 (32bit)

![image](https://user-images.githubusercontent.com/64485819/224992365-212132a9-50f4-43cd-b075-6730601d55da.png)

## Use the Logger

1. Download from the [release page](https://github.com/SallyTYT/XNET-CAN-Signal-Logger/releases)
2. Install LabVIEW Runtime Engine and hardware drivers (Refer to the release note for SW versions)
3. Run the exe file

## Develop the Logger

1. LabVIEW 2021 SP1
2. NI-XNET and NI-DAQmx Driver
3. Dependencies
    * JKI State Machine
    * OpenG Array Libraray
    * [LabVIEW-GlobalStop-Library](https://github.com/NEVSTOP-LAB/LabVIEW-GlobalStop-Library),  v2022.12.12 or newer version
    * [LabVIEW-TimerEngine](https://github.com/NEVSTOP-LAB/LabVIEW-TimerEngine), v0.1.1.3 or newer version

# FlexLogger Plugin-Performanced XNET CAN Logger

![image](https://user-images.githubusercontent.com/64485819/236158495-e3ff9088-e3f9-40cc-b8e8-e56211bc00f6.png)

## Use the Plugin

1. Install FlexLogger, LabVIEW Runtime Engine and hardware drivers (Refer to the release note for SW versions)
2. Download from the [release page](https://github.com/SallyTYT/XNET-CAN-Signal-Logger/releases)
3. Extract the plugin folder to `C:\Users\Public\Documents\National Instruments\FlexLogger\Plugins\IOPlugins\`
4. Run the FlexLogger and use the plugin

## Develop the Plugin

1. LabVIEW 2021 SP1 64bit
2. NI-XNET and NI-DAQmx Driver
3. FlexLogger 2022 Q2 or later
4. FlexLogger Plug-in Development Kit 1.4 or later, refer to the [Compatibility Page](https://www.ni.com/docs/zh-CN/bundle/flexlogger-plug-in-development-kit/page/software-version-compatibility.html)
5. Dependencies
    * XNET-CAN-Signal-Logger
