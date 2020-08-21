![PBRP](https://raw.githubusercontent.com/PitchBlackRecoveryProject/manifest_pb/android-9.0/PitchBlack-Banner.png "PBRP")

PitchBlackRecoveryProject (PBRP) 3.0.0 for the Redmi K30 5G (picasso)

# How to build
Download PBRP's source and picasso's device tree. Then go to the source folder and run:

```bash
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch omni_picasso-eng
mka recoveryimage
```

# Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Qualcomm SDM765 Snapdragon 765G
CPU     | Octa-core (1x2.4 GHz Kryo 475 Prime & 1x2.2 GHz Kryo 475 Gold & 6x1.8 GHz Kryo 475 Silver)
GPU     | Adreno 620
Memory  | 6/8 GB RAM
Shipped Android Version | 10 with MIUI 11
Storage | 64/128/256 GB (without SD card capability)
Battery | Non-removable Li-Po 4500 mAh battery
Display | 1080 x 2400 pixels, 20:9 ratio, 6.67 inches, IPS LCD (~386 ppi density)

![Xiaomi Redmi K30 5G](https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575882160.38569692.jpg "Xiaomi Redmi K30 5G")
