#!/system/bin/sh
# Copyright (c) 2014, RaymanFX <raymanfx@gmail.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ondemand
    write /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor ondemand
    write /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor ondemand
    write /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor ondemand
    write /sys/devices/system/cpu/cpufreq/ondemand/up_threshold 90
    write /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate 50000
    write /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy 1
    write /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor 4
    write /sys/devices/system/cpu/cpufreq/ondemand/down_differential 3
    write /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_multi_core 80
    write /sys/devices/system/cpu/cpufreq/ondemand/down_differential_multi_core 3
    write /sys/devices/system/cpu/cpufreq/ondemand/optimal_freq 384000
    write /sys/devices/system/cpu/cpufreq/ondemand/sync_freq 384000
    write /sys/devices/system/cpu/cpufreq/ondemand/up_threshold_any_cpu_load 80
