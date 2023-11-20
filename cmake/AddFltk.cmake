include(FetchContent)

set(FLTK_BUILD_TEST OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    fltk
    GIT_REPOSITORY    https://github.com/fltk/fltk.git # 指定git仓库地址
    GIT_TAG           release-1.3.8 # 指定版本
    SOURCE_DIR        ${CMAKE_SOURCE_DIR}/third-party/fltk   # 源码下载到此目录下
    GIT_SHALLOW       TRUE
)

FetchContent_MakeAvailable(fltk)

function(target_link_fltk target)
    target_include_directories(${target} PUBLIC ${fltk_BINARY_DIR} ${fltk_SOURCE_DIR})
    target_link_libraries(${target} PRIVATE fltk)

    if(APPLE)
        target_link_libraries(${target} PRIVATE "-framework Cocoa") # needed for Darwin
    endif()

    if(WIN32)
        target_link_libraries(${target} PRIVATE gdiplus)
        set_target_properties(${target}
                PROPERTIES
                LINK_FLAGS_RELEASE "/SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup"
                LINK_FLAGS_DEBUG "/SUBSYSTEM:WINDOWS /ENTRY:mainCRTStartup"
        )
    endif()
endfunction()

function(add_fltk_executable target source)
    add_executable(${target} WIN32 MACOSX_BUNDLE ${source})
    target_link_fltk(${target})
endfunction()
