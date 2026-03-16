---
title: Devices
description: List of hardware devices on my internal network.
---

# Network Devices

| Device Name | Model | Role | Location | Connection |
| ----------- | ----- | ---- | -------- | ---------- |
| **Router** | MikroTik RB5009UPr+S+IN | Gateway / PoE Switch | Main | FTTP |
| **Garage Switch** | KeepLink KP-9000-9XHPML-X | 2.5G Managed PoE Switch | Garage | 2.5Gb SFP+ (RJ45) |
| **House Switch (Planned)** | KeepLink KP-9000-9XHPML-X | 2.5G Managed PoE Switch | Under Stairs | 10Gb SFP+ (to RB5009) |
| **Plex Server** | Custom/Server | Media Server | Garage | 1Gb Ethernet |
| **AP Upstairs** | Ubiquiti U7 Pro | Access Point | Upstairs | PoE (RB5009) |
| **AP Downstairs** | Ubiquiti U7 Pro | Access Point | Downstairs | PoE (RB5009) |
| **AP Garage** | Ubiquiti U6 Pro | Access Point | Garage | PoE+ (KeepLink) |

## Hardware Specifications

### MikroTik RB5009UPr+S+IN
- **Ports:** 7x 1G, 1x 2.5G, 1x 10G SFP+
- **PoE:** 802.3af/at output on all 8 Ethernet ports.

### KeepLink KP-9000-9XHPML-X
- **Ports:** 8x 2.5G RJ45 ports + 1x 10G SFP+ port.
- **Management:** Web-managed (L2 Lite features).
- **PoE:** 8x PoE+ ports with 120W total budget.
- **Features:** 802.1p QoS, Jumbo Frames, Non-blocking architecture.

- **ISP:** BT Openreach FTTP
- **Current Speed:** 900 Mbps
- **Target Speed:** 1600 Mbps
