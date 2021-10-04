# IP Plan

## Management network

Device: **enp2s0** (APU management)

**enp3s0** (Network Container)

Prefix: **192.168.0.0/24** (Untagged in switch)

| Use | IPs | Comment |
| - | - | - |
| c: managementnet | 192.168.0.1 | DHCP and gw for network |
| h: routainer | 192.168.0.2 | APU management |
| RESERVED | 192.168.0.3-10 | Reserved for management hosts |
| d: Cloudkey | 192.168.0.11 | |
| d: Switch | 192.168.0.12 | |
| d: Stue | 192.168.0.13 | AP |
| d: Gang | 192.168.0.14 | AP |
| RESERVED | 192.168.0.15-20 | Reserved for devices |
| DHCP | 192.168.0.100-254 | DHCP range for network |

## Container link net

Device: **linket**

Prefix: **192.168.100.0/24**

| Use | IPs | Comment |
| - | - | - |
| c: router | 192.168.100.1 | Containers other interface is connected to the internet |
| c: managementnet | 192.168.100.10 | Containers other interface is untagged |
| c: unbound | 192.168.100.50 | |
| c: pihole | 192.168.100.51 | |
| c: nginx | 192.168.100.52 | |
| RESERVED | 192.168.100.54-100 | Containers with no other interfaces |
| c: clientnet | 192.168.100.200 | Containers other interface has VLAN 200 |
| c: mediavpn | 192.168.100.201 | Containers other interface has VLAN 201 |
| c: guestnet | 192.168.100.202 | Containers other interface has VLAN 202 |
| RERSEVRED | 192.168.100.203-250 | Containers with other interface on VLAN 203-250 |

## Client network

Device: **enp2s0.200**

Prefix: **192.168.200.0/24** (VLAN 200)

| Use | IPs | Comment |
| - | - | - |
| c: clientnet | 192.168.200.1 | DHCP and gw for network |
| RESERVED | 192.168.200.50-100 | Reserved for hosts with static IPs |
| DHCP | 192.168.200.100-254 | DHCP range for network |

## MediaVPN network

Device: **enp2s0.201**

Prefix: **192.168.201.0/24** (VLAN 201)

| Use | IPs | Comment |
| - | - | - |
| c: mediavpn | 192.168.201.1 | DHCP and gw for network |
| RESERVED | 192.168.201.50-100 | Reserved for hosts with static IPs |
| DHCP | 192.168.201.100-254 | DHCP range for network |

## Guest network

Device: **enp2s0.202**

Prefix: **192.168.202.0/24** (VLAN 202)

| Use | IPs | Comment |
| - | - | - |
| c: guestnet | 192.168.202.1 | DHCP and gw for network |
| RESERVED | 192.168.202.50-100 | Reserved for hosts with static IPs |
| DHCP | 192.168.202.100-254 | DHCP range for network |
