# Project Details

## Purpose & Outcome

The purpose of this group project was to analyse how real-world processes on Windows consume CPU and memory. Each group member selected three applications they use regularly, monitored them under different scenarios, and documented the results in a shared report.

The outcome was a comparative study of nine applications in total, covering games, communication, music streaming, and audio software. The measurements showed consistent patterns: CPU and memory spike when an application launches or changes state (such as loading into a game), resource-intensive games consume far more CPU and memory than lighter applications, and features like ray tracing shift the workload from the CPU to the GPU.

## Technologies, Tools and Methods

- Windows Resource Monitor as the primary monitoring tool
- Task Manager and Process Explorer (used by other group members)
- CPU metrics: average CPU percentage per 60 seconds, current usage, active thread count
- Memory metrics: Commit, Working Set, Shareable, Private, and hard faults per second
- Controlled test scenarios per application (for example menu, gameplay, and toggled ray tracing for a game)
- Comparative analysis of results across applications

## Individual Contribution

This was a three-person group project. I was responsible for analysing three applications: Steam, The Witcher 3: Wild Hunt, and Minecraft: Java Edition. I designed the test scenarios myself, such as browsing versus downloading in Steam, and menu versus gameplay versus ray tracing in The Witcher 3. I recorded the CPU and memory metrics for each scenario with Resource Monitor, took the supporting screenshots, analysed the results, and wrote my full section of the report.