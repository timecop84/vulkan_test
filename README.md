# Minimal Vulkan Blue Triangle Example

## Prerequisites
- CMake 3.10+
- Vulkan SDK
- GLFW (via vcpkg)

## Build Instructions

1. Install dependencies with vcpkg:
   ```
   vcpkg install glfw3
   ```
2. Configure with vcpkg toolchain:
   ```
   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=C:/Users/detou/vcpkg/scripts/buildsystems/vcpkg.cmake
   cmake --build build
   ```

## Shader Compilation

You need to compile the GLSL shaders to SPIR-V:

```
glslangValidator -V triangle.vert -o triangle.vert.spv
glslangValidator -V triangle.frag -o triangle.frag.spv
```

## Run

Run the executable from the `build` directory:

```
./build/VulkanTest
```

You should see a blue triangle.

## Build with Makefile (Windows, MSVC)

Alternatively, you can build the project using the provided Makefile with MSVC's `nmake` or a compatible make tool:

1. Set the required environment variables for the Vulkan SDK and GLFW:
   - `VULKAN_SDK` should point to your Vulkan SDK root directory.
   - `GLFW_ROOT` should point to your GLFW installation directory.

   Example (in PowerShell):
   ```powershell
   $env:VULKAN_SDK = "C:\VulkanSDK\1.3.275.0"
   $env:GLFW_ROOT = "C:\path\to\glfw"
   ```

2. Open a Visual Studio Developer Command Prompt (or ensure `cl.exe` is in your PATH).

3. Run:
   ```
   nmake
   ```
   or, if using GNU Make (with MSVC):
   ```
   make
   ```

This will build `VulkanTest.exe` in the project root.

To clean build artifacts:
```
nmake clean
```
or
```
make clean
```
