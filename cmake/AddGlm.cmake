include(FetchContent)

FetchContent_Declare(
    glm
    GIT_REPOSITORY    https://github.com/g-truc/glm.git # 指定git仓库地址
    GIT_TAG           0.9.9.8 # 指定版本
    SOURCE_DIR        ${CMAKE_SOURCE_DIR}/third-party/glm # 源码下载到此目录下
)

FetchContent_MakeAvailable(glm)
