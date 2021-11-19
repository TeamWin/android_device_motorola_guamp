#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=

# Load TouchScreen Modules
insmod $module_path/himax_v3_mmi_hx83102d.ko
insmod $module_path/himax_v3_mmi.ko
insmod $module_path/ili9882_mmi.ko
insmod $module_path/chipone_tddi_mmi.ko
insmod $module_path/nova_0flash_mmi.ko

# Load Needed Modules
insmod $module_path/sensors_class.ko
insmod $module_path/utags.ko
insmod $module_path/exfat.ko
insmod $module_path/mmi_annotate.ko
insmod $module_path/mmi_info.ko
insmod $module_path/mmi_sys_temp.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/qpnp-power-on-mmi.ko
insmod $module_path/qpnp_adaptive_charge.ko

# Fix up chipone
if [[ -d /sys/class/touchscreen/ICNL9911S ]]; then
        echo "chipone"
        chipone_fw_path=/vendor/firmware/ICNL9911.bin
        flash_path=/sys/chipone-tddi/cts_firmware

        sleep 2

        echo $chipone_fw_path > $flash_path/update_from_file
fi

exit 0
