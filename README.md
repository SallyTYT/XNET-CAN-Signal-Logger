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
2. NI-XNET Driver
3. Dependencies
    * JKI State Machine
    * OpenG Array Libraray
    * [LabVIEW-GlobalStop-Library](https://github.com/NEVSTOP-LAB/LabVIEW-GlobalStop-Library),  v2022.12.12 or newer version
    * [LabVIEW-TimerEngine](https://github.com/NEVSTOP-LAB/LabVIEW-TimerEngine), v0.1.1.3 or newer version
