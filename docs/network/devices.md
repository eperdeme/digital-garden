---
title: Devices
description: List of hardware devices on my internal network.
---

# Network Devices

| Device Name | IP Address | Model | Role | Location | Connection |
| ----------- | ---------- | ----- | ---- | -------- | ---------- |
| **Router** | `192.168.1.254` | MikroTik RB5009UPr+S+IN | Gateway / PoE Switch | Stairs | 2.5GbE WAN |
| **House Switch** | `192.168.1.250` | KeepLink KP-9000-9XHPML-X | 2.5G PoE Switch | Stairs | 10Gb SFP+ (DAC) |
| **Garage Switch** | `192.168.1.251` | KeepLink KP-9000-9XHPML-X | 2.5G PoE Switch | Garage | 2.5GbE RJ45 |
| **Plex Server** | `192.168.1.6` | Custom/Server | Media Server | Garage | 1Gb Ethernet |
| **AP Upstairs** | `192.168.1.x` | Ubiquiti U7 Pro | Access Point | Upstairs | 2.5GbE (PoE+) |
| **AP Downstairs**| `192.168.1.x` | Ubiquiti U7 Pro | Access Point | Downstairs | 1GbE (PoE+) |
| **AP Garage** | `192.168.1.x` | Ubiquiti U6 Pro | Access Point | Garage | 1GbE (PoE+) |

## Hardware Specifications

### MikroTik RB5009UPr+S+IN
- **Ports:** 7x 1G, 1x 2.5G (`ether1` WAN), 1x 10G SFP+ (`sfp-sfpplus1` LAN)
- **Management:** RouterOS v7.x
- **Configuration:** Custom firewall rules with FastTrack and NAT. DDNS managed via HE.net script.

### KeepLink KP-9000-9XHPML-X
- **Ports:** 8x 2.5G RJ45 ports + 1x 10G SFP+ port.
- **Management:** Web-managed.
- **PoE:** 8x PoE+ ports with 120W total budget.
- **Deployment:** Two units (House and Garage) forming the 2.5GbE access layer.

## ISP Configuration
- **Type:** BT Openreach FTTP
- **Current Connection:** 1.6Gbps (2.5Gbps ONT)
- **Modem:** Nokia 2.5G ONT
- **Public DNS:** 8.8.8.8, 8.8.4.4
- **DDNS:** `home.eper.net` (Hurricane Electric)
