# Chocolatey packages for Zephyr RTOS development tools

[Chocolatey](https://chocolatey.org) is a package manager for Windows.

You can use it to install the following Zephyr RTOS development tools:
* Zephyr Cross Compiler Toolchains ([zephyr-crosstool-ng](https://github.com/stephanosio/zephyr-crosstool-ng))
* Zephyr QEMU ([zephyr-qemu](https://github.com/stephanosio/zephyr-qemu))
* Zephyr OpenOCD ([zephyr-openocd](https://github.com/stephanosio/zephyr-openocd))

## Getting Started

### Install Chocolatey

Follow the installation instructions on the [Chocolatey website](https://chocolatey.org/install#individual).

### Install packages

```sh
choco install (package name)
```

_NOTE: You may need to run this command as an administrator._

## Package List

|                    Name                   |                                       Description                                       |
|:-----------------------------------------:|:---------------------------------------------------------------------------------------:|
|              zephyr-crosstool             |                 Cross Compiler Toolchain (meta package for all targets)                 |
|          zephyr-crosstool-aarch64         |               ARM (AArch64) Cross Compiler Toolchain (aarch64-zephyr-elf)               |
|            zephyr-crosstool-arc           |                      ARC Cross Compiler Toolchain (arc-zephyr-elf)                      |
|            zephyr-crosstool-arm           |          ARM (AArch32; Cortex-A/R/M) Cross Compiler Toolchain (arm-zephyr-eabi)         |
|           zephyr-crosstool-nios2          |                    NIOS2 Cross Compiler Toolchain (nios2-zephyr-elf)                    |
|           zephyr-crosstool-riscv          |                   RISC-V Cross Compiler Toolchain (riscv64-zephyr-elf)                  |
|           zephyr-crosstool-sparc          |                    SPARC Cross Compiler Toolchain (sparc-zephyr-elf)                    |
|            zephyr-crosstool-x86           |                  x86(-64) Cross Compiler Toolchain (x86_64-zephyr-elf)                  |
|   zephyr-crosstool-xtensa-intel_apl_adsp  |    Xtensa Intel APL ADSP Cross Compiler Toolchain (xtensa-intel_apl_adsp_zephyr-elf)    |
|   zephyr-crosstool-xtensa-intel_bdw_adsp  |    Xtensa Intel BDW ADSP Cross Compiler Toolchain (xtensa-intel_apl_adsp_zephyr-elf)    |
|   zephyr-crosstool-xtensa-intel_byt_adsp  |    Xtensa Intel BYT ADSP Cross Compiler Toolchain (xtensa-intel_apl_adsp_zephyr-elf)    |
|    zephyr-crosstool-xtensa-intel_s1000    |       Xtensa Intel S1000 Cross Compiler Toolchain (xtensa-intel_s1000_zephyr-elf)       |
|    zephyr-crosstool-xtensa-nxp_imx_adsp   |      Xtensa NXP i.MX ADSP Cross Compiler Toolchain (xtensa-nxp_imx_adsp_zephyr-elf)     |
|   zephyr-crosstool-xtensa-nxp_imx8m_adsp  |   Xtensa NXP i.MX 8M ADSP Cross Compiler Toolchain (xtensa-nxp_imx8m_adsp_zephyr-elf)   |
| zephyr-crosstool-xtensa-sample_controller | Xtensa Sample Controller Cross Compiler Toolchain (xtensa-sample_controller_zephyr-elf) |
|                zephyr-qemu                |                                       Zephyr QEMU                                       |
|               zephyr-openocd              |                                      Zephyr OpenOCD                                     |
