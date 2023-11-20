include(FetchContent)

FetchContent_Declare(
    glfw
    GIT_REPOSITORY    https://github.com/glfw/glfw.git # 指定git仓库地址
    GIT_TAG           3.3-stable # 指定版本
    SOURCE_DIR        ${CMAKE_SOURCE_DIR}/third-party/glfw   # 源码下载到此目录下
)

FetchContent_MakeAvailable(glfw)
