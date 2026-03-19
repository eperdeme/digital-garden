---
title: Devices
description: List of hardware devices on my internal network.
---

# Network Devices

| Device Name | IP Address | MAC Address | Model | Role | Connection |
| ----------- | ---------- | ----------- | ----- | ---- | ---------- |
| **Router** | `192.168.1.254` | `18:FD:74:78:4A:D1` | RB5009UPr+S+IN | Gateway / PoE Switch | 2.5GbE WAN (`ether1`) |
| **House Switch** | `192.168.1.250` | `78:D8:00:32:45:5E` | KP-9000-9XHPML-X | 2.5G PoE Switch | 10Gb SFP+ (`sfp-sfpplus1`) |
| **Garage Switch**| `192.168.1.251` | `78:D8:00:32:45:5F` | KP-9000-9XHPML-X | 2.5G PoE Switch | 2.5GbE RJ45 (from House SW) |
| **Plex Server** | `192.168.1.6` | `9A:82:21:67:78:97` | Custom/Server | Media Server | 1Gb Ethernet |
| AP Upstairs | `192.168.1.10` | `74:40:BE:9B:2C:E8` | Ubiquiti U7 Pro | Access Point | 1GbE PoE (`ether3`) |
| AP Downstairs| `192.168.1.44` | `04:17:B6:7D:66:51` | Ubiquiti U7 Pro | Access Point | 1GbE PoE (`ether5`) |
| Smart Hub | `192.168.1.2` | `AC:67:84:92:97:7C` | Smart Hub | Hub | 10/100 PoE (`ether2`) |
| **AP Garage** | `192.168.1.x` | `x:x:x:x:x:x` | Ubiquiti U6 Pro | Access Point | 1GbE PoE (KeepLink Garage) |

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
