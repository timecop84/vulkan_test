cmake_minimum_required(VERSION 3.10)
project(VulkanTest)

set(CMAKE_CXX_STANDARD 17)

# Vulkan
if (WIN32)
    if(NOT DEFINED ENV{VULKAN_SDK})
        message(FATAL_ERROR "VULKAN_SDK environment variable not set!")
    endif()
    set(Vulkan_INCLUDE_DIR "$ENV{VULKAN_SDK}/Include")
    set(Vulkan_LIBRARY "$ENV{VULKAN_SDK}/Lib/vulkan-1.lib")
else()
    find_package(Vulkan REQUIRED)
    set(Vulkan_INCLUDE_DIR ${Vulkan_INCLUDE_DIRS})
    set(Vulkan_LIBRARY ${Vulkan_LIBRARIES})
endif()

# GLFW (prefer vcpkg integration)
find_package(glfw3 CONFIG REQUIRED)

# Add source and include directories
add_executable(VulkanTest
    src/main.cpp
    src/VulkanApp.cpp
)

target_include_directories(VulkanTest PRIVATE ${Vulkan_INCLUDE_DIR} include)
target_link_libraries(VulkanTest PRIVATE ${Vulkan_LIBRARY} glfw)
