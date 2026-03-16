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

---

# Proposed Upgrade: 1.6Gb Internet

To support the 1.6Gb (2.5Gb ONT) internet upgrade, the network will be restructured to free up the RB5009's single 2.5G RJ45 port for the WAN connection.

## Planned Changes

1.  **Add 2nd KeepLink (House):** Install under the stairs next to the RB5009.
2.  **10Gb Backbone:** Connect RB5009 SFP+ port to House KeepLink SFP+ port (10Gb link).
3.  **WAN Upgrade:** Move ONT to the RB5009 2.5G port (previously used for garage uplink).
4.  **Garage Uplink:** Move the Garage Cat7 run to a 2.5G port on the House KeepLink.

```mermaid
graph TD
    ISP((Internet / BT 1.6Gb)) --- ONT[ONT 2.5G]
    ONT -- "2.5Gb RJ45" --- RB5009[MikroTik RB5009]

    RB5009 -- "10Gb SFP+ DAC/Fiber" --- HSW[KeepLink Switch<br/>Under Stairs]

    subgraph "Main House (2.5G Network)"
        HSW --- U7PU[Ubiquiti U7 Pro]
        HSW --- U7PD[Ubiquiti U7 Pro]
        HSW --- Other[Other 2.5G Devices]
    end

    HSW -- "2.5Gb RJ45<br/>(Outdoor Cat7 Run)" --- GSW[KeepLink Switch<br/>Garage]

    subgraph "Garage (2.5G Network)"
        GSW --- Plex[Plex Server]
        GSW --- U6PG[Ubiquiti U6 Pro]
    end

    style RB5009 fill:#f96,stroke:#333,stroke-width:2px
    style HSW fill:#f96,stroke:#333,stroke-width:2px
    style GSW fill:#f96,stroke:#333,stroke-width:2px
    style ISP fill:#0cf,stroke:#333,stroke-width:2px
```
