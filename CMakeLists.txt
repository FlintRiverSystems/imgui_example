
cmake_minimum_required(VERSION 3.12)

set(FRSTPSRC $ENV{FRSTPSRC})
message("FRSTPSRC: ${FRSTPSRC}")

set(VCPKG_DIR "${FRSTPSRC}/vcpkg")
message("VCPKG_DIR: ${VCPKG_DIR}")

set(VCPKG_FEATURE_FLAGS "versions")
set(CMAKE_TOOLCHAIN_FILE ${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake CACHE STRING "vcpkg toolchain file")

project(imgui_example)

add_executable(imgui_example)

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_REQUIRED True)

#target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_SOURCE_DIR}/../..")
#target_include_directories(${PROJECT_NAME} PUBLIC "/data/proj")

#add_subdirectory(../../FRS_Utility_CPP FRS_Utility_CPP)
#target_link_libraries(${PROJECT_NAME} PUBLIC FRS_Utility_CPP)

#find_package (Boost REQUIRED COMPONENTS filesystem date_time)
#target_link_libraries(${PROJECT_NAME} PRIVATE Boost::boost)

find_package(X11 REQUIRED)

find_package(SDL2 CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE SDL2::SDL2 SDL2::SDL2main)

find_package(imgui CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE imgui::imgui)

target_link_libraries(${PROJECT_NAME} PRIVATE ${X11_LIBRARIES})

if (MSVC)
endif()

target_precompile_headers(${PROJECT_NAME} PRIVATE pch.h)

source_group(" " REGULAR_EXPRESSION ".*")

target_sources(${PROJECT_NAME}
	PRIVATE
		main.cpp
)

