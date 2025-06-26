# Makefile for building with CMake and compiling shaders
# Usage: mingw32-make [all|build|clean|shaders]

CMAKE_BUILD_DIR = build
CMAKE = cmake
GLSLC = glslc
SHADER_DIR = shaders
SHADERS = $(SHADER_DIR)/triangle.vert $(SHADER_DIR)/triangle.frag
SPV = $(SHADER_DIR)/triangle.vert.spv $(SHADER_DIR)/triangle.frag.spv

all: clean shaders build

build:
	$(CMAKE) -S . -B $(CMAKE_BUILD_DIR)
	$(CMAKE) --build $(CMAKE_BUILD_DIR)

shaders: $(SPV)

$(SHADER_DIR)/%.vert.spv: $(SHADER_DIR)/%.vert
	$(GLSLC) $< -o $@

$(SHADER_DIR)/%.frag.spv: $(SHADER_DIR)/%.frag
	$(GLSLC) $< -o $@

clean:
	-$(CMAKE) --build $(CMAKE_BUILD_DIR) --target clean
	-if exist $(CMAKE_BUILD_DIR) rmdir /S /Q $(CMAKE_BUILD_DIR)
	-del /Q main.o VulkanApp.o VulkanSwapchain.o *.o *.exe *.pdb *.ilk $(SPV) 2>nul
	-for /r %%i in (*.o) do del /q "%%i" 2>nul

.PHONY: all build clean shaders

# Notes:
# - This Makefile uses CMake for C++ build and glslc for shader compilation.
# - Requires CMake and glslc in PATH.
# - Run 'mingw32-make' to build everything, or 'mingw32-make shaders' to only compile shaders.
