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

## Build Instructions (MinGW, Makefile)

This project uses a Makefile that wraps CMake and shader compilation for easy building on Windows with MinGW.

### Prerequisites
- CMake (in your PATH)
- MinGW (g++, mingw32-make in your PATH)
- glslc (from the Vulkan SDK, in your PATH)
- Vulkan SDK and GLFW (set VULKAN_SDK and GLFW_ROOT if not hardcoded)

### Build and Run

1. Open a terminal in the project directory:
   ```
   cd path/to/vulkan_test
   ```
2. To build everything (shaders and C++):
   ```
   mingw32-make
   ```
   or
   ```
   mingw32-make all
   ```
3. To only build shaders:
   ```
   mingw32-make shaders
   ```
4. To only build the C++ code (after shaders):
   ```
   mingw32-make build
   ```
5. To clean the build and shader outputs:
   ```
   mingw32-make clean
   ```
6. To time the build:
   ```
   time mingw32-make
   ```
7. To run the executable:
   ```
   .\build\Debug\VulkanTest.exe
   ```
### Notes
- The executable will be in the `build` directory if using CMake defaults.
- Make sure all required tools are in your PATH.
- You can edit the Makefile to adjust paths for your system if needed.
