---
title: Topology
description: Physical and logical network layout.
---

# Network Topology

```mermaid
graph TD
    ISP((Internet / BT Openreach)) --- ONT[ONT]
    ONT --- RB5009[MikroTik RB5009<br/>Under Stairs]

    subgraph "Main House"
        RB5009 --- U7PU[Ubiquiti U7 Pro<br/>Upstairs]
        RB5009 --- U7PD[Ubiquiti U7 Pro<br/>Downstairs]
    end

    RB5009 -- "SFP+ 2.5Gb RJ45<br/>(Outdoor Cat7 Run)" --- GSW[2.5G Managed Switch<br/>Garage]

    subgraph "Garage"
        GSW --- Plex[Plex Server<br/>1Gb]
        GSW --- U6PG[Ubiquiti U6 Pro]
    end

    style RB5009 fill:#f96,stroke:#333,stroke-width:2px
    style GSW fill:#f96,stroke:#333,stroke-width:2px
    style ISP fill:#0cf,stroke:#333,stroke-width:2px
```

## Internet Connection

- **Provider:** BT Openreach (FTTP)
- **ONT:** Connected directly to RB5009.

## Core Hardware

### MikroTik RB5009UPr+S+IN
- Primary router and PoE provider for main house APs.
- **Location:** Under the stairs.
- **SFP+ Port:** Equipped with a 2.5Gb SFP-to-RJ45 module.
- **Uplink to Garage:** A physical Cat7 cable run from under the stairs, routed outside the house, connecting to the Garage Switch.

### Garage 2.5G Switch
- **Location:** Garage.
- **Uplink:** 2.5Gb copper link via the Cat7 run from the RB5009 SFP+ port.
- **Connected Devices:**
    - **Plex Server:** 1Gb link.
    - **Ubiquiti U6 Pro:** PoE.

## Wireless (Ubiquiti)

- **U7 Pro (Upstairs):** Connected to RB5009.
- **U7 Pro (Downstairs):** Connected to RB5009.
- **U6 Pro (Garage):** Connected to Garage Switch.
