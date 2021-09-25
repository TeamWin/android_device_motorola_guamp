#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=

# Load TouchScreen Modules
insmod $module_path/himax_v3_mmi_hx83102d.ko
insmod $module_path/himax_v3_mmi.ko

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

return 0
