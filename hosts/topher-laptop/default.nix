{
  imports = [ ./hardware-configuration.nix ];

  #----Host specific config ----
  boot.kernelParams = [
    "i8042.direct"
    "i8042.dumbkbd"
    "usbcore.autosuspend=-1"
    "i915.force_probe=9a49"
  ];

  boot.initrd.kernelModules = [ ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ]; 
 # usbcore.autosuspend = -1;

  # ---- System Configurations ----
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
  services.xserver.displayManager.gdm.autoSuspend = false;

  systemd.services = {
    # tune-power-management = {
    #   description = "Tune Power Management";
    #   wantedBy = [ "multi-user.target" ];

    #   serviceConfig = {
    #     Type = "oneshot";
    #     RemainAfterExit = false;
    #   };

    #   unitConfig.RequiresMountsFor = "/sys";
    #   script = ''
    #     echo 6000 > /proc/sys/vm/dirty_writeback_centisecs
    #     echo 1 > /sys/module/snd_hda_intel/parameters/power_save

    #     for knob in \
    #         /sys/bus/i2c/devices/i2c-0/device/power/control \
    #         /sys/bus/i2c/devices/i2c-1/device/power/control \
    #         /sys/bus/i2c/devices/i2c-2/device/power/control \
    #         /sys/bus/i2c/devices/i2c-3/device/power/control \
    #         /sys/bus/i2c/devices/i2c-4/device/power/control \
    #         /sys/bus/i2c/devices/i2c-5/device/power/control \
    #         /sys/bus/i2c/devices/i2c-6/device/power/control \
    #         /sys/bus/pci/devices/0000:00:00.0/power/control \
    #         /sys/bus/pci/devices/0000:00:02.0/power/control \
    #         /sys/bus/pci/devices/0000:00:16.0/power/control \
    #         /sys/bus/pci/devices/0000:00:19.0/power/control \
    #         /sys/bus/pci/devices/0000:00:1b.0/power/control \
    #         /sys/bus/pci/devices/0000:00:1c.0/power/control \
    #         /sys/bus/pci/devices/0000:00:1c.1/power/control \
    #         /sys/bus/pci/devices/0000:00:1d.0/power/control \
    #         /sys/bus/pci/devices/0000:00:1f.0/power/control \
    #         /sys/bus/pci/devices/0000:00:1f.2/power/control \
    #         /sys/bus/pci/devices/0000:00:1f.3/power/control \
    #         /sys/bus/pci/devices/0000:00:1f.6/power/control \
    #         /sys/bus/pci/devices/0000:03:00.0/power/control \
    #     ; do echo auto > $knob; done

    #     for knob in \
    #         /sys/class/scsi_host/host0/link_power_management_policy \
    #         /sys/class/scsi_host/host1/link_power_management_policy \
    #         /sys/class/scsi_host/host2/link_power_management_policy \
    #     ; do echo min_power > $knob; done
    #   '';
    # };

    tune-usb-autosuspend = {
      description = "Disable USB autosuspend";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = { Type = "oneshot"; };
      unitConfig.RequiresMountsFor = "/sys";
      script = ''
        echo -1 > /sys/module/usbcore/parameters/autosuspend
      '';
    };
  };
}
