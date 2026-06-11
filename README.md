# 🇮🇷 Iran MikroTik IP List (Auto Updated)

This project generates an up-to-date list of Iranian IPv4 networks for MikroTik routers.

It is based on:

- RIPE NCC Country Resource List
- RFC1918 private networks
- CGNAT + local networks
- Automatic weekly updates via GitHub Actions

---

## 🚀 One-Line MikroTik Install

Paste this into MikroTik terminal:

/tool fetch url="https://raw.githubusercontent.com/hgolshan/iran-mikrotik-iplist/main/install.rsc" dst-path=install.rsc; /import install.rsc



---

## 📦 Features

- 🇮🇷 Iran IP ranges (RIPE official data)
- 🔄 Auto weekly updates (Friday 00:00)
- 🧠 Duplicate removal + CIDR aggregation
- 🏠 Includes local/private networks
- ⚡ MikroTik ready (.rsc format)

---

## 📂 Files

- `generate.py` → builds IP list
- `iran_ipv4.rsc` → generated MikroTik file
- `install.rsc` → one-line installer
- GitHub Actions → automatic updates

---

## ⚙️ How it works

1. GitHub Action runs every Friday
2. Fetches latest RIPE data
3. Generates `iran_ipv4.rsc`
4. Commits updated file
5. MikroTik fetches it automatically

---

## 📡 Use case

- Policy routing (Iran vs Tunnel)
- ISP routing optimization
- MikroTik firewall address-list automation

---

## 👤 Author

Hossein