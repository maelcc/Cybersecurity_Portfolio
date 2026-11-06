# Windows Process Resource Analysis

A group study of how real-world Windows processes consume CPU and memory. Nine applications were monitored under different usage scenarios, with CPU percentage, thread counts, and memory measures (Commit, Working Set, Shareable, Private, hard faults) recorded and compared.

## Applications Analysed

- Steam
- The Witcher 3: Wild Hunt
- Minecraft: Java Edition
- osu!(Lazer)
- Discord
- Apex Legends
- Spotify
- Boss Tone Studio
- Audacity

## Methodology

Each application was monitored with Windows Resource Monitor (plus Task Manager and Process Explorer where useful) under controlled scenarios: idle screens, active use, and specific state changes such as downloading a game, joining a voice chat, enabling ray tracing, or exporting an audio file. Processes were monitored one at a time with the system at rest between tests.

## Key Findings

- CPU and memory spike at launch or on state change, then stabilise
- Graphically demanding games consume the most resources by far (up to around 13 million KB commit memory during gameplay)
- Ray tracing shifts the workload from the CPU to the GPU, lowering CPU usage
- Lighter applications such as Discord and audio tools stay well under 2% CPU even when active
- Capturing screenshots itself causes noticeable CPU spikes

## My Contribution

In this group project I analysed Steam, The Witcher 3: Wild Hunt, and Minecraft: Java Edition, including the download, gameplay, and ray tracing scenarios.

## Educational Purpose

This project was created for educational purposes only. It is a coursework project published to demonstrate learning.