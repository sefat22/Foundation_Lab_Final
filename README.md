# Foundations_Lab_Final

**Student Name:** Sefat E Monzor   
**Course:** Cybersecurity Foundations by TKH Innovation Fellowship 
**Date:** February 26, 2026  
**Instructor:** George Robbins, Jane Pierre

---

### Introduction

I’m a cybersecurity student focused on the intersection of **Cloud Security and GRC**. This repository documents my hands-on lab environments and my approach to building resilient, policy-driven security architectures.

* **Primary Goal:** To master the balance between technical defense and organizational governance.

* **Source:** *NIST (2018) states that a successful cybersecurity framework must align business drivers with security activities (p. 12).*

---

## 01 | Security Foundations

**The CIA Triad**

* **Confidentiality:** Keeping data eyes-only.
* **Integrity:** Preventing unauthorized changes.
* **Availability:** Ensuring systems stay up.

**The AAA Framework**

* **Authentication:** Proving who you are.
* **Authorization:** What are you allowed to do?
* **Accounting:** Keeping a log of every action.

**Governance in Action**
Governance is the "rules of engagement." While technical skills allow me to build a firewall, governance tells me *which* traffic must be blocked to meet legal or business standards. It transforms a collection of tools into a compliant security program (ISACA, 2022).

---

## 02 | Infrastructure & Virtualization

* **Hypervisor:** The software (e.g., VirtualBox) that carves a physical PC into multiple virtual ones.
* **Virtual Machine (VM):** An isolated, software-defined computer running its own OS.
* **Isolation:** The "digital sandbox" that keeps malware from escaping to the host machine.

**Virtualization vs. CIA**
Virtualization provides **Confidentiality** through process separation, **Integrity** via snapshots that revert systems to a clean state, and **Availability** by allowing for rapid deployment and hardware redundancy.

---

## 03 | Security Philosophy (Final Submission)

My lab philosophy centers on **calculated isolation**. By using a Type-2 hypervisor, I create a "Zero Trust" environment where each VM is a contained unit. This allows for the execution of untrusted code without risking the host system’s data.

As noted by Smith (2023), physical or logical isolation is the strongest control for maintaining **Confidentiality** against lateral movement. Furthermore, the ability to monitor and limit VM resources ensures **Availability**, preventing any single guest OS from crashing the entire infrastructure (Johnson, 2022). This lab proves that virtualization isn't just a convenience—it is a core security control.

**References (APA 7)**

* Johnson, A. L. (2022). *Virtualization and the future of network resilience*. Journal of Cybersecurity Tech, 14(2), 102-115.
* Smith, R. E. (2023). *Elementary Information Security* (4th ed.). Jones & Bartlett Learning.

---

## 04 | Reflections

**Day 2:** Governance is the "blueprint" for technical "construction." Without it, security is reactive rather than strategic. This material aligns most with the **GRC (Governance, Risk, and Compliance)** domain.

**Day 3:** Isolation is vital for malware analysis because it limits the "blast radius" to a non-critical environment. Virtualization supports this by letting me "undo" damage instantly with snapshots. This aligns most with **Cloud and Network Security**.

---

## Technical Environment Specifications
* **Operating System:** macOS [Sequoia 15.3.1] (Apple Silicon M2)
* **Version Control:** Git v2.48.x (Homebrew Bin)
* **IDE:** Visual Studio Code v1.9x
* **Repository Type:** GitHub Remote
* **Hypervisor:** UTM v4.5.x (QEMU-based virtualization for Apple Silicon)
* **Guest Operating System:** Ubuntu 22.04.x LTS (ARM64 Architecture)
* **Network Simulator:** Cisco Packet Tracer v8.2.x
* **Remote Access:** OpenSSH (Secure Shell) via VS Code Remote-SSH Extension
* **Scripting Language:** Bash (Bourne Again SHell)

## Project Deliverables
1. **Local Initialization:** Established a local Git repository with a custom `.zshrc` PATH configuration to prioritize Homebrew binaries.
2. **Version Control Handshake:** Successfully synchronized local commits to the remote `Foundations_Lab_Final` repository.
3. **Hypervisor & Linux VM**:Host OS - MacBook Air M2 running Type 2 Hypervisor (Virtual Machine) - UTM with Linux VM active.
4. **Packet Tracer Connectivity:** A successful connectivity simulation in Cisco Packet Tracer .