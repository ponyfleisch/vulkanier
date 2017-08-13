#include <iostream>
#include <fstream>
#include <vector>
#include <set>
#include <string>
#define VK_USE_PLATFORM_MACOS_MVK
#include <MoltenVK/vulkan/vulkan.h>

VkPresentModeKHR chooseSwapPresentMode(const std::vector<VkPresentModeKHR>);
VkExtent2D chooseSwapExtent(const VkSurfaceCapabilitiesKHR&);
static std::vector<char> readFile(const std::string&);
VkShaderModule createShaderModule(const std::vector<char>&);
void drawFrame();