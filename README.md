# Overview

This repository contains many short scripts and wrappers around existing functions from my modules. They are optimized to be wired to the Windows registry via [SingleInstanceAccumulator](https://github.com/Beej126/SingleInstanceAccumulator). By using SIA as a proxy, it's trivial to emulate the functionality of a full context menu handler with interprocess communication. 

In combination with a high `MultipleInvokePromptMinimum` value, and Powershell's take on multithreading (`ForEach-Object -Parallel`) loop, you can easily rip through thousands of files at once. Large multithreaded batch conversions can be accomplished with just careful manipulation of the registry and smart PowerShell logic.

Unfortunately a lot of these scripts are tailored to my personal system configuration and won't be useful unless you know how to change them to your specific use-case.

