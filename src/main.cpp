// Minimal Vulkan blue triangle example
// Single-file, modern C++ (C++17), using GLFW and Vulkan
// Place compiled shaders as triangle.vert.spv and triangle.frag.spv in the working directory
#include "../include/VulkanApp.h"
#include <GLFW/glfw3.h>
#include <stdexcept>
#include <iostream>

const int WIDTH = 800;
const int HEIGHT = 600;

int main() {
    if (!glfwInit()) throw std::runtime_error("Failed to initialize GLFW");
    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    GLFWwindow* window = glfwCreateWindow(WIDTH, HEIGHT, "Vulkan Blue Triangle", nullptr, nullptr);
    if (!window) throw std::runtime_error("Failed to create GLFW window");
    try {
        VulkanApp app(window, WIDTH, HEIGHT);
        while (!glfwWindowShouldClose(window)) {
            glfwPollEvents();
            app.drawFrame();
        }
        app.waitIdle();
    } catch (const std::exception& e) {
        std::cerr << e.what() << std::endl;
    }
    glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}
