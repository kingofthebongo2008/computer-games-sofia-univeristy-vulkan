#include "pch.h"

#include <vulkan/vulkan.hpp>
#include <iostream>

int32_t main(int32_t argc, char** argv)
{
    vk::ApplicationInfo ai;
    vk::InstanceCreateInfo ici(vk::InstanceCreateFlags(), &ai);

    vk::Instance i;
    vk::Result   r = vk::createInstance(&ici, nullptr, &i);

    if (r == vk::Result::eSuccess)
    {
        auto&& devices = i.enumeratePhysicalDevices();
       

        for (auto&& d : devices)
        {
            std::cout << "Vulkan    Device name: " << d.getProperties().deviceName << "\n";
            std::cout << "Driver    Version: " << d.getProperties().driverVersion << "\n";
            std::cout << "Api       Version: " << d.getProperties().apiVersion << "\n";

        }
    }
    else
    {
        std::cout << "Could not find vulkan" << "\n";
    }

    i.destroy(nullptr);
    return 0;
}